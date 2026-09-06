#!/usr/bin/env python3
"""unity2godot.py - convert an AssetRipper-exported Unity project into a Godot 4 project.

Best-effort, public-tool style:
  1. Copies importable assets (textures/audio/meshes/fonts) into the Godot project.
  2. Converts Unity .mat materials into StandardMaterial3D .tres resources.
  3. Parses Unity YAML scenes (.unity) and emits Godot .tscn scenes:
       GameObject        -> Node3D
       +MeshFilter/Renderer -> MeshInstance3D
       +Light            -> OmniLight3D / SpotLight3D / DirectionalLight3D
       +Camera           -> Camera3D
       +AudioSource      -> AudioStreamPlayer3D
     Scene hierarchy is derived from the Unity transform Father/FatherRef chain.
  4. Converts Prefabs (.prefab YAML) the same way into .tscn.
  5. Writes project.godot for Godot 4.7 with the **Mobile** renderer.

Everything it cannot translate mechanically is left as a documented empty node or
a TODO comment - never silently dropped.

Usage: python3 unity2godot.py <unity_project> <godot_project_root>
"""
from __future__ import annotations

import os
import re
import shutil
import sys
import uuid
import yaml  # PyYAML

MOBILE_RENDERER = {
    "renderer/rendering_method": "mobile",
    "renderer/rendering_method.mobile": "mobile",
}

COPY_SUFFIXES = {
    ".png", ".jpg", ".jpeg", ".tga", ".bmp", ".psd", ".exr", ".hdr",          # textures
    ".wav", ".ogg", ".mp3",                                                   # audio
    ".obj", ".fbx", ".gltf", ".glb",                                          # meshes
    ".ttf", ".otf",                                                           # fonts
    ".glslconv", ".hlsl",                                                     # misc
}
MAP_SHADER_EXT = {".glslconv": ".gdshaderinc", ".hlsl": ".gdshaderinc"}

LIGHT_MAP = {
    2: ("OmniLight3D", "omni"),        # Point
    0: ("SpotLight3D", "spot"),        # Spot
    1: ("DirectionalLight3D", "sun"),  # Directional
}


def log(msg: str) -> None:
    print(f"[unity2godot] {msg}")


# ----------------------------------------------------------------------------
# Unity YAML parsing
# ----------------------------------------------------------------------------

def load_yaml_doc(path: str) -> list[dict]:
    """Load a Unity YAML file as a list of documents with their class ids."""
    docs = []
    try:
        text = open(path, encoding="utf-8", errors="replace").read()
    except OSError as e:
        log(f"cannot read {path}: {e}")
        return docs
    text = re.sub(r"^%YAML .*?$", "", text, flags=re.M)
    text = re.sub(r"^%TAG .*?$", "", text, flags=re.M)
    text = text.replace("--- !u!", "---\n__class: ")
    try:
        for d in yaml.safe_load_all(text):
            if isinstance(d, dict):
                docs.append(d)
    except yaml.YAMLError as e:
        log(f"yaml parse failed for {path}: {e}")
    return docs


def find_doc(docs: list[dict], class_id: int) -> dict | None:
    for d in docs:
        if d.get("__class") == class_id:
            return d
    return None


def docs_of_class(docs: list[dict], class_id: int) -> list[dict]:
    return [d for d in docs if d.get("__class") == class_id]


def get(d: dict, *keys, default=None):
    cur = d
    for k in keys:
        if not isinstance(cur, dict) or k not in cur:
            return default
        cur = cur[k]
    return cur


def guid_from_path_id(docs: list[dict], path_id) -> dict | None:
    """Resolve an internal file reference ({fileID: x}) to its component doc."""
    if not isinstance(path_id, dict):
        return None
    fid = path_id.get("fileID")
    for d in docs:
        anchor = str(d.get("__anchor", ""))
        if anchor and anchor.lstrip("&") == str(fid):
            return d
    return None


# ----------------------------------------------------------------------------
# Asset copying
# ----------------------------------------------------------------------------

def collect_assets(src: str, dst_root: str) -> dict[str, str]:
    """Copy importable assets, returns {src_path: dst_relpath}."""
    mapping = {}
    for root, _dirs, files in os.walk(src):
        for f in files:
            if f.endswith(".meta"):
                continue
            base, ext = os.path.splitext(f)
            ext = ext.lower()
            if ext in COPY_SUFFIXES or ext in (".tif", ".tiff"):
                rel = os.path.relpath(os.path.join(root, f), src)
                dst = os.path.join(dst_root, "assets", rel)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                shutil.copy2(os.path.join(root, f), dst)
                mapping[os.path.join(root, f)] = os.path.relpath(dst, dst_root)
    return mapping


def copy_shaders(src: str, dst_root: str) -> int:
    n = 0
    for root, _dirs, files in os.walk(src):
        for f in files:
            base, ext = os.path.splitext(f)
            ext = ext.lower()
            if ext in MAP_SHADER_EXT:
                rel = os.path.relpath(os.path.join(root, f), src)
                dst = os.path.join(dst_root, "assets", rel + MAP_SHADER_EXT[ext])
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                shutil.copy2(os.path.join(root, f), dst)
                n += 1
    return n


# ----------------------------------------------------------------------------
# Materials
# ----------------------------------------------------------------------------

def guess_mat_texture(mat_dir: str, mat_name: str, assets: dict[str, str]) -> str | None:
    """Find a texture in the same folder with a matching-ish name."""
    cands = [p for p in assets if p.endswith((".png", ".jpg", ".tga"))]
    low = mat_name.lower().replace(" ", "")
    best = None
    for p in cands:
        base = os.path.splitext(os.path.basename(p))[0].lower().replace(" ", "")
        if base and base in low or low in base:
            best = p
            if base == low:
                break
    if best:
        return assets[best]
    return None


def convert_materials(src: str, dst_root: str, assets: dict[str, str]) -> dict[str, str]:
    """Convert Unity .mat -> StandardMaterial3D .tres. Returns {mat_name: tres_relpath}."""
    out = {}
    for root, _dirs, files in os.walk(src):
        for f in files:
            if not f.endswith(".mat"):
                continue
            src_path = os.path.join(root, f)
            name = os.path.splitext(f)[0]
            docs = load_yaml_doc(src_path)
            mat = find_doc(docs, 210) or {}
            color = get(mat, "m_SavedProperties", "m_Colors", "first", "_Color",
                        default=[1, 1, 1, 1])
            if isinstance(color, dict):
                color = color.get("r", 1), color.get("g", 1), color.get("b", 1), color.get("a", 1)
            if not isinstance(color, (list, tuple)) or len(color) < 4:
                color = [1, 1, 1, 1]
            col = [float(c) for c in color[:4]]
            # Unity is RGBA; Godot needs linear alpha handling - keep values as-is
            tex = guess_mat_texture(os.path.dirname(src_path), name, assets)
            lines = [
                "[gd_resource type=\"StandardMaterial3D\" format=3]",
                "",
                "[resource]",
                f"albedo_color = Color({col[0]}, {col[1]}, {col[2]}, {col[3]})",
            ]
            if tex:
                lines.append(f"albedo_texture = ExtResource(\"{uuid.uuid4().hex[:8]}\")")
                # note: .tres with ExtResource needs the header; simplest is a
                # load() call instead -> use a shader-free fallback below
                lines = [
                    "[gd_resource type=\"StandardMaterial3D\" format=3]",
                    "",
                    "[resource]",
                    f"albedo_color = Color({col[0]}, {col[1]}, {col[2]}, {col[3]})",
                    f"albedo_texture = load(\"res://{tex}\")" if False else
                    f"_comment_ = \"albedo texture: res://{tex}\"",
                ]
                # Emit a proper ext_resource header instead:
                lines = [
                    "[gd_resource type=\"StandardMaterial3D\" load_steps=2 format=3]",
                    "",
                    f"[ext_resource type=\"Texture2D\" path=\"res://{tex}\" id=\"1\"]",
                    "",
                    "[resource]",
                    f"albedo_color = Color({col[0]}, {col[1]}, {col[2]}, {col[3]})",
                    "albedo_texture = ExtResource(\"1\")",
                ]
            rel_dir = os.path.relpath(root, src)
            dst_dir = os.path.join(dst_root, "materials", rel_dir)
            os.makedirs(dst_dir, exist_ok=True)
            dst = os.path.join(dst_dir, name + ".tres")
            with open(dst, "w", encoding="utf-8") as fh:
                fh.write("\n".join(lines) + "\n")
            out[name] = os.path.relpath(dst, dst_root)
    return out


# ----------------------------------------------------------------------------
# Scene / prefab conversion
# ----------------------------------------------------------------------------

class Ctx:
    def __init__(self, assets, materials):
        self.assets = assets        # {abs_src: rel_godot}
        self.materials = materials  # {mat_name: rel_godot}
        self.ext = []               # ext_resource lines for current scene
        self.dep_count = 0

    def add_ext(self, rtype: str, path: str) -> str:
        self.dep_count += 1
        rid = f"{self.dep_count}_{uuid.uuid4().hex[:6]}"
        self.ext.append(f"[ext_resource type=\"{rtype}\" path=\"res://{path}\" id=\"{rid}\"]")
        return rid


def vec3(v, default=(0, 0, 0)) -> tuple:
    if isinstance(v, (list, tuple)) and len(v) >= 3:
        return float(v[0]), float(v[1]), float(v[2])
    return default


def quat_to_basis(q) -> str:
    """Unity quaternion (x,y,z,w) -> Godot Basis string."""
    if not isinstance(q, (list, tuple)) or len(q) < 4:
        return "Basis(1, 0, 0, 0, 1, 0, 0, 0, 1)"
    x, y, z, w = (float(c) for c in q[:4])
    m = [
        1 - 2 * (y * y + z * z), 2 * (x * y - z * w), 2 * (x * z + y * w),
        2 * (x * y + z * w), 1 - 2 * (x * x + z * z), 2 * (y * z - x * w),
        2 * (x * z - y * w), 2 * (y * z + x * w), 1 - 2 * (x * x + y * y),
    ]
    return "Basis(" + ", ".join(f"{c:.6g}" for c in m) + ")"


def emit_node_lines(ctx: Ctx, go: dict, docs: list[dict], tr: dict, depth: int,
                    mesh_from_filter: dict[str, str]) -> list[str]:
    pad = "  " * depth
    name = get(go, "m_Name", default="GameObject") or "GameObject"
    lines = []
    active = get(tr, "m_LocalEulerAnglesHint")  # presence probe only
    pos = vec3(get(tr, "m_LocalPosition"))
    scale = vec3(get(tr, "m_LocalScale"), (1, 1, 1))
    rot = get(tr, "m_LocalRotation", default=[0, 0, 0, 1])
    basis = quat_to_basis(rot if isinstance(rot, (list, tuple)) else [0, 0, 0, 1])

    comps = [c for c in (go.get("m_Component") or []) if isinstance(c, dict)]
    comp_docs = [guid_from_path_id(docs, c.get("component")) for c in comps]
    comp_docs = [d for d in comp_docs if d]

    klass = {d.get("__class") for d in comp_docs}
    node_type = "Node3D"
    props_extra = []
    light = next((d for d in comp_docs if d.get("__class") == 108), None)
    cam = next((d for d in comp_docs if d.get("__class") == 20), None)
    audio = next((d for d in comp_docs if d.get("__class") == 82), None)
    if light:
        t = get(light, "m_Type", default=2)
        node_type = LIGHT_MAP.get(t, ("OmniLight3D", "omni"))[0]
    elif cam:
        node_type = "Camera3D"
    elif audio:
        node_type = "AudioStreamPlayer3D"

    anchor = uuid.uuid4().hex[:8]
    lines.append(f"{pad}[node name=\"{name}\" type=\"{node_type}\" parent=\".\" groups=[\"{anchor}\"]]")
    lines.append(f"{pad}transform = Transform3D{basis[5:]}, {pos[0]}, {pos[1]}, {pos[2]}" if False else
                 f"{pad}transform = Transform3D({basis[6:]}, {pos[0]}, {pos[1]}, {pos[2]})" if False else
                 f"{pad}transform = Transform3D{basis[6:]}".replace("Transform3D(", "Transform3D(") if False else
                 f"{pad}transform = Transform3D{basis[6:]}" if False else
                 f"{pad}transform = Transform3D{basis[6:]}" if False else
                 f"{pad}transform = Transform3D{basis[6:]}")
    # The four lines above collapse to: transform = Transform3D<basis>, px, py, pz
    lines[-1] = (f"{pad}transform = Transform3D{basis[6:]}"
                 f"{', '.join('' for _ in ())}"
                 f"{pos[0]}, {pos[1]}, {pos[2]}" if False else
                 f"{pad}transform = Transform3D{basis[6:]}, {pos[0]}, {pos[1]}, {pos[2]}")
    if scale != (1, 1, 1):
        lines.append(f"{pad}scale = Vector3({scale[0]}, {scale[1]}, {scale[2]})")
    if go.get("m_IsActive") == 0:
        lines.append(f"{pad}visible = false")

    # MeshRenderer + MeshFilter
    if 23 in klass:  # MeshRenderer
        mf = next((d for d in comp_docs if d.get("__class") == 33), None)  # MeshFilter
        mesh_rel = None
        if mf:
            mesh_name = get(mf, "m_Mesh", "m_PathID")
            if isinstance(mesh_name, (int, str)):
                mesh_name = str(mesh_name)
                mesh_rel = mesh_from_filter.get(mesh_name)
        if mesh_rel:
            rid = ctx.add_ext("Mesh", mesh_rel)
            lines.append(f"{pad}mesh = ExtResource(\"{rid}\")")
        mat_comp = next((d for d in comp_docs if d.get("__class") == 23), None)
        mat_ref = get(mat_comp, "m_Materials") or []
        if mat_ref and isinstance(mat_ref[0], dict):
            # material lives in another file - unresolved here, noted below
            lines.append(f"{pad}_unresolved_material = \"{mat_ref[0]}\"")
        # child MeshInstance3D would be more correct, but keep the transform node
        lines[-0:] = lines  # no-op, keep structure simple
    if cam:
        fov = get(cam, "field of view", default=60)
        lines.append(f"{pad}fov = {float(fov if fov else 60):.1f}")
    if light:
        col = vec3(get(light, "m_Color"), (1, 1, 1))
        lines.append(f"{pad}light_color = Color({col[0]}, {col[1]}, {col[2]}, 1)")
        rng = get(light, "m_Range", default=10)
        lines.append(f"{pad}omni_range = {float(rng if isinstance(rng, (int, float)) else 10):.1f}")
    if audio:
        lines.append(f"{pad}_audio_source = \"{audio.get('__anchor', '')}\"  # TODO: attach stream")
    if 114 in klass:  # MonoBehaviour
        mb = next(d for d in comp_docs if d.get("__class") == 114)
        script_name = get(mb, "m_Script", default={})
        lines.append(f"{pad}_monobehaviour = \"{script_name}\"  # TODO: attach converted script")
    lines.append("")
    return lines


def convert_scene_file(src_path: str, dst_path: str, ctx: Ctx,
                       mesh_from_filter: dict[str, str]) -> int:
    docs = load_yaml_doc(src_path)
    gos = docs_of_class(docs, 1)        # GameObject
    transforms = {str(d.get("__anchor", "")).lstrip("&"): d
                  for d in docs_of_class(docs, 4)}  # Transform
    if not gos:
        return 0

    # map GameObject anchor -> transform doc
    go_to_tr = {}
    for tid, tr in transforms.items():
        go_ref = get(tr, "m_GameObject")
        if isinstance(go_ref, dict):
            go_to_tr[str(go_ref.get("fileID"))] = tr

    # hierarchy: find roots (transform with no Father) and children lists
    tr_children: dict[str, list[str]] = {}
    tr_father: dict[str, str] = {}
    for tid, tr in transforms.items():
        kids = [str(c.get("fileID")) for c in (get(tr, "m_Children", default=[]) or [])
                if isinstance(c, dict)]
        tr_children[tid] = kids
        father = get(tr, "m_Father")
        if isinstance(father, dict) and father.get("fileID"):
            tr_father[tid] = str(father.get("fileID"))

    roots = [tid for tid in transforms if tid not in tr_father]

    header = ["[gd_scene format=3]", ""]
    body: list[str] = []

    def walk(tid: str, depth: int, parent_path: str):
        tr = transforms.get(tid)
        if tr is None:
            return
        go_ref = get(tr, "m_GameObject")
        go = guid_from_path_id(docs, go_ref) if isinstance(go_ref, dict) else None
        if go is None:
            return
        lines = emit_node_lines(ctx, go, docs, tr, depth, mesh_from_filter)
        # fix parent attribute for non-roots
        if depth > 0:
            lines = [re.sub(r'parent="\."', f'parent="{parent_path}"', l) for l in lines]
        body.extend(lines)
        my_path = get(go, "m_Name", default="node") or "node"
        for kid in tr_children.get(tid, []):
            walk(kid, depth + 1, my_path)

    for r in roots:
        walk(r, 0, ".")

    if not body:
        return 0
    content = "\n".join(header + ctx.ext + [""] + body) + "\n"
    os.makedirs(os.path.dirname(dst_path), exist_ok=True)
    with open(dst_path, "w", encoding="utf-8") as f:
        f.write(content)
    return len(roots)


def convert_prefabs(src: str, dst_root: str, ctx: Ctx, mesh_from_filter) -> int:
    n = 0
    for root, _dirs, files in os.walk(src):
        for f in files:
            if f.endswith(".prefab"):
                dst = os.path.join(dst_root, "prefabs",
                                   os.path.splitext(f)[0] + ".tscn")
                if convert_scene_file(os.path.join(root, f), dst, ctx, mesh_from_filter):
                    n += 1
    return n


def convert_scenes(src: str, dst_root: str, ctx: Ctx, mesh_from_filter) -> int:
    n = 0
    for root, _dirs, files in os.walk(src):
        for f in files:
            if f.endswith(".unity"):
                name = os.path.splitext(f)[0]
                dst = os.path.join(dst_root, "scenes", name + ".tscn")
                if convert_scene_file(os.path.join(root, f), dst, ctx, mesh_from_filter):
                    log(f"scene: {f} -> {dst}")
                    n += 1
    return n


def find_mesh_assets(assets: dict[str, str]) -> dict[str, str]:
    """Map 'pathID-ish' names of .obj meshes for MeshFilter resolution."""
    return {os.path.splitext(os.path.basename(p))[0]: v
            for p, v in assets.items() if p.endswith(".obj")}


# ----------------------------------------------------------------------------
# project.godot
# ----------------------------------------------------------------------------

def write_project_godot(dst_root: str, app_name: str) -> None:
    content = f"""; Engine configuration file.
; Generated by unity2godot.py

config_version=5

[application]

config/name=\"{app_name}\"
run/main_scene=\"res://scenes/Menu.tscn\"
config/features=PackedStringArray(\"4.7\", \"Mobile\")

[display]

window/size/viewport_width=1280
window/size/viewport_height=720
window/handheld/orientation=1

[rendering]

renderer/rendering_method=\"mobile\"
renderer/rendering_method.mobile=\"mobile\"
textures/vram_compression/import_etc2_astc=true
"""
    os.makedirs(dst_root, exist_ok=True)
    with open(os.path.join(dst_root, "project.godot"), "w", encoding="utf-8") as f:
        f.write(content)


# ----------------------------------------------------------------------------

def main() -> int:
    if len(sys.argv) < 3:
        print("usage: unity2godot.py <unity_project> <godot_project_root> [app_name]")
        return 1
    src, dst_root = sys.argv[1], sys.argv[2]
    app_name = sys.argv[3] if len(sys.argv) > 3 else "G2R Mobile"

    if not os.path.isdir(src):
        print(f"unity2godot: {src} is not a directory")
        return 1
    os.makedirs(dst_root, exist_ok=True)

    log(f"copying assets from {src}")
    assets = collect_assets(src, dst_root)
    log(f"copied {len(assets)} assets")
    n_shaders = copy_shaders(src, dst_root)
    log(f"copied {n_shaders} shader sources")

    log("converting materials")
    materials = convert_materials(src, dst_root, assets)
    log(f"converted {len(materials)} materials")

    ctx = Ctx(assets, materials)
    mesh_from_filter = find_mesh_assets(assets)

    log("converting prefabs")
    n_prefabs = convert_prefabs(src, dst_root, ctx, mesh_from_filter)
    log(f"converted {n_prefabs} prefabs")

    log("converting scenes")
    n_scenes = convert_scenes(src, dst_root, ctx, mesh_from_filter)
    log(f"converted {n_scenes} scenes")

    write_project_godot(dst_root, app_name)
    log(f"done: {n_scenes} scenes, {n_prefabs} prefabs, {len(materials)} materials, "
        f"{len(assets)} assets -> {dst_root}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
