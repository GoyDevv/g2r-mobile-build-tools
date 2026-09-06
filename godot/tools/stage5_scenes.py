"""Stage 5: convert Unity .unity scenes / .prefab assets into Godot 4 .tscn files.

Coordinate approach: Unity and Godot are both Y-up; we carry transforms over
numerically (quaternion/position/scale) without mirroring so meshes authored in
Unity space render identically. Handedness differences are handled in GDScript
ports (forward/right conventions), never in scene space.
"""
import os, sys, json, re, math
from urllib.parse import quote
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from unitylib import (UNITY_SRC, PROJ, load_unity_docs, vec3, vec4, unescape_unity,
                      fmt_float, ensure_dir, guid_of_meta)

def load_json(name):
    p = os.path.join(PROJ, "tools", name)
    if os.path.exists(p):
        with open(p) as f:
            return json.load(f)
    return {}

DB = load_json("db.json")
MESHES = load_json("meshes.json")
MATERIALS = load_json("materials.json")
ANIMS = load_json("animations.json")
TEXTURES = DB.get("textures", {})
AUDIO = DB.get("audio", {})

# guid of C# class -> class name (from cs.meta files)
SCRIPTS_BY_GUID = {}
for _g, _i in DB.get("db", {}).items():
    if _i["p"].endswith(".cs"):
        SCRIPTS_BY_GUID[_g] = os.path.splitext(os.path.basename(_i["p"]))[0]

# class name -> godot script path (populated by porting effort)
PORTED = {}
_pm = os.path.join(PROJ, "tools", "ported_scripts.json")
if os.path.exists(_pm):
    with open(_pm) as f:
        PORTED = json.load(f)

# Ported classes whose script extends Button and must be attached to the UI
# Button node it controls (resolved from its serialized btn1 by stage6), NOT to
# the GO where the mono sits (often a plain Node3D like GameController).
UI_BTN_CLASSES = {
    "SeeObjects", "dropObjects", "ClickPlayButton", "BackToMenu",
    "clickBeartrapMenu", "ClickContinueButton", "ClickContinueButton2",
}

GODOT_UI = {
    "UnityEngine.UI.Text": "label",
    "UnityEngine.UI.Image": "image",
    "UnityEngine.UI.Button": "button",
}

# Unity component class ids
CID = {
    "GO": 1, "TR": 4, "CAMERA": 20, "MR": 23, "LIGHT": 108, "AUDIO": 82,
    "RB": 54, "BOX": 65, "SPHERE": 135, "CAPSULE": 136, "MESHCOL": 64,
    "MF": 33, "CC": 143, "ANIMATION": 111, "ANIMATOR": 95, "NAV": 195,
    "MONO": 114, "RT": 224, "CANVAS": 223, "CR": 222, "LODGROUP": 205,
    "NAVOBSTACLE": 208, "SKMESH": 137, "PARTICLE": 198, "TRAIL": 120,
    "LINE": 120,
}

class Node:
    __slots__ = ("name", "type", "props", "children", "go", "path", "instance")
    def __init__(self, name, type, go=None):
        self.name = name
        self.type = type
        self.props = []
        self.children = []
        self.go = go
        self.path = ""
        self.instance = None  # ext id of a PackedScene to instance (header form)

def quat_to_mat(x, y, z, w):
    """Standard quaternion->rotation matrix (Godot-consistent convention).
    Returns 3x3 as list of columns (images of unit axes)."""
    xx, yy, zz = x * x, y * y, z * z
    xy, xz, yz = x * y, x * z, y * z
    wx, wy, wz = w * x, w * y, w * z
    c0 = (1 - 2 * (yy + zz), 2 * (xy - wz), 2 * (xz + wy))
    c1 = (2 * (xy + wz), 1 - 2 * (xx + zz), 2 * (yz - wx))
    c2 = (2 * (xz - wy), 2 * (yz + wx), 1 - 2 * (xx + yy))
    return [c0, c1, c2]

def mat_to_text(cols, origin):
    # emit columns as rows (basis.x = column0) matching Godot's Transform3D text
    nums = []
    for c in cols:
        nums += c
    nums += origin
    return "Transform3D(" + ", ".join(fmt_float(n) for n in nums) + ")"

def sanitize_name(s):
    # NOTE: node names containing spaces crash this env's resource loader; use underscores
    s = re.sub(r"[^A-Za-z0-9_.\-]", "_", s)
    s = re.sub(r"_+", "_", s).strip("_")
    return s[:80]

class Converter:
    def __init__(self, path):
        self.path = path
        self.docs = load_unity_docs(path)
        self.by = {}
        for d in self.docs:
            self.by[d["anchor"]] = d
        self.gos = {}
        self.xforms = {}
        self.go_children = {}   # tr anchor -> [tr anchors]
        self.parent_of = {}
        self.parse()
        self.ext_res = []
        self.ext_ids = {}
        self.sub_res = []
        self.sub_ids = {}
        self.warnings = []
        self.used_names = set()
        self.go_path = {}  # go fileID -> absolute node path

    def parse(self):
        for d in self.docs:
            c, a, data = d["cls"], d["anchor"], d["data"]
            if c == 1:
                comps = []
                for x in data.get("m_Component") or []:
                    if isinstance(x, dict):
                        f = x.get("fileID") or (x.get("component") or {}).get("fileID")
                        if f:
                            comps.append(f)
                self.gos[a] = {"name": unescape_unity(data.get("m_Name") or ""),
                               "active": data.get("m_IsActive", 1) != 0,
                               "tag": data.get("m_TagString") or "",
                               "comps": comps}
            elif c == 4:
                self.xforms[a] = {"go": data.get("m_GameObject", {}).get("fileID"),
                                  "pos": vec3(data.get("m_LocalPosition")),
                                  "rot": vec4(data.get("m_LocalRotation")),
                                  "scale": vec3(data.get("m_LocalScale")),
                                  "father": data.get("m_Father", {}).get("fileID") or 0,
                                  "children": [x.get("fileID") for x in data.get("m_Children") or [] if isinstance(x, dict) and x.get("fileID")]}
                self.parent_of[a] = self.xforms[a]["father"]

    # --- resource helpers
    def ext(self, p, kind="Resource"):
        if p not in self.ext_ids:
            i = len(self.ext_ids) + 1
            self.ext_ids[p] = str(i)
            self.ext_res.append((kind, quote(p, safe="/:"), str(i)))
        return self.ext_ids[p]

    def sub_resource(self, text, key=None):
        k = key if key is not None else text
        if k not in self.sub_ids:
            i = len(self.sub_ids) + 1
            self.sub_ids[k] = i
            self.sub_res.append(text.replace("__ID__", str(i)))
        return self.sub_ids[k]

    def node_name(self, go, tr):
        base = self.gos.get(go, {}).get("name") or "GO_%d" % tr
        base = sanitize_name(base)
        if not base:
            base = "GO_%d" % tr
        name = base
        n = 1
        while name in self.used_names:
            name = "%s_%d" % (base, n)
            n += 1
        self.used_names.add(name)
        return name

    def transform_text(self, tr):
        t = self.xforms.get(tr)
        if not t:
            return None
        q = t["rot"]
        cols = quat_to_mat(q[0], q[1], q[2], q[3])
        s = t["scale"]
        # Godot inverts Node3D bases during transform syncing; a 0 scale axis makes
        # the basis singular (Basis::invert det==0 spam). Clamp 0 axes to 1e-5.
        s = tuple(1e-5 if abs(x) < 1e-9 else x for x in s)
        cols = [(c[0] * s[0], c[1] * s[1], c[2] * s[2]) for c in cols]
        return mat_to_text(cols, t["pos"])

    def build(self, tr, name):
        t = self.xforms[tr]
        go = t["go"]
        node = Node(name, "Node3D", go=go)
        self.populate(node, go, tr)
        return node

    def populate(self, node, go, tr):
        # decide node type & collect component payloads
        comps = self.gos.get(go, {}).get("comps", [])
        comp_data = {}
        for ca in comps:
            d = self.by.get(ca)
            if d:
                comp_data.setdefault(d["cls"], []).append(d["data"])
        active = self.gos.get(go, {}).get("active", True)

        mesh_guid = None
        materials = []
        rigid = None
        cc = None
        colliders = []
        navs = []
        nav_obstacles = []
        audio = []
        lights = []
        cams = []
        animations = []
        monos = []
        animators = []

        for cls, datas in comp_data.items():
            for data in datas:
                if cls == 33:  # MeshFilter
                    m = data.get("m_Mesh") or {}
                    if m.get("guid"):
                        mesh_guid = m["guid"]
                elif cls == 23:  # MeshRenderer
                    materials = [x.get("guid") for x in data.get("m_Materials") or [] if isinstance(x, dict)]
                    materials = [g for g in materials if g]
                elif cls == 54:
                    rigid = data
                elif cls == 143:
                    cc = data
                elif cls in (65, 135, 136, 64):
                    colliders.append((cls, data))
                elif cls == 195:
                    navs.append(data)
                elif cls == 208:
                    nav_obstacles.append(data)
                elif cls == 82:
                    audio.append(data)
                elif cls == 108:
                    lights.append(data)
                elif cls == 20:
                    cams.append(data)
                elif cls == 111:
                    animations.append(data)
                elif cls == 114:
                    monos.append(data)
                elif cls == 95:
                    animators.append(data)

        # choose wrapper body type
        if cc is not None:
            node.type = "CharacterBody3D"
        elif rigid is not None:
            node.type = "RigidBody3D"
        elif colliders:
            node.type = "StaticBody3D"

        props = []
        tt = self.transform_text(tr)
        if tt:
            props.append("transform = " + tt)
        if not active:
            props.append("visible = false")
            props.append("process_mode = 3")
            if node.type in ("StaticBody3D", "RigidBody3D", "CharacterBody3D"):
                props.append("collision_layer = 0")
                props.append("collision_mask = 0")
        # Unity tag -> metadata/unity_tag + Godot group (used by ported scripts)
        tag = self.gos.get(go, {}).get("tag", "") or ""
        if tag and tag != "Untagged":
            props.append("metadata/unity_tag = \"%s\"" % tag)
            props.append("groups=[\"unity_%s\"]" % tag)
        node.props = props

        # --- children: mesh (instance of .glb scene; materials attached by
        # runtime MaterialFixer from metadata/unity_materials)
        if mesh_guid:
            if mesh_guid in MESHES:
                g = MESHES[mesh_guid]["glb"]
                mi = Node("Mesh", "Node3D")
                mi.instance = self.ext(g, "PackedScene")
                if materials:
                    mi.props.append("metadata/unity_materials = [%s]" % ", ".join(
                        "\"%s\"" % mg for mg in materials))
                node.children.append(mi)
            else:
                self.warnings.append(f"missing mesh guid {mesh_guid}")

        # --- children: colliders
        for cls, data in colliders:
            shape = self.collider_shape(cls, data)
            if not shape:
                continue
            cs = Node("CollisionShape3D", "CollisionShape3D")
            cs.props.append("shape = SubResource(\"%s\")" % shape)
            ctr = data.get("m_Center")
            if isinstance(ctr, dict) and any(ctr.get(k) for k in ("x", "y", "z")):
                v = vec3(ctr)
                if v != (0, 0, 0):
                    cs.props.append("position = Vector3(%s, %s, %s)" % tuple(fmt_float(x) for x in v))
            node.children.append(cs)

        # --- children: cameras / lights / audio
        for data in cams:
            cn = Node("Camera3D", "Camera3D")
            cn.props.append("fov = %s" % fmt_float(data.get("m_fieldOfView", 60.0)))
            cn.props.append("near = %s" % fmt_float(data.get("m_NearClipPlane", 0.3)))
            far = data.get("m_FarClipPlane", 1000)
            cn.props.append("far = %s" % fmt_float(far))
            node.children.append(cn)
        for data in lights:
            ln = Node("Light3D", self.light_type(data))
            ln.props += self.light_props(data)
            node.children.append(ln)
        for i, data in enumerate(audio):
            an = Node("AudioStreamPlayer3D", "AudioStreamPlayer3D")
            clip = data.get("m_audioClip") or {}
            g = clip.get("guid") if isinstance(clip, dict) else None
            if g and g in AUDIO:
                an.props.append("stream = ExtResource(\"%s\")" % self.ext(AUDIO[g], "AudioStreamWAV"))
            elif g:
                self.warnings.append(f"missing audio guid {g}")
            vol = data.get("m_Volume", 1.0)
            an.props.append("volume_db = %s" % fmt_float(20.0 * math.log10(max(vol, 1e-5))))
            an.props.append("max_distance = %s" % fmt_float(data.get("MaxDistance", 500)))
            an.props.append("unit_size = 1")
            if data.get("Loop"):
                an.props.append("metadata/unity_loop = true")
            if data.get("m_PlayOnAwake"):
                an.props.append("autoplay = true")
            node.children.append(an)

        # legacy Animation -> AnimationPlayer
        for data in animations:
            ap = Node("AnimationPlayer", "AnimationPlayer")
            clip_list = data.get("m_Animations") or []
            anim_map = {}
            for cl in clip_list:
                if not isinstance(cl, dict):
                    continue
                g = cl.get("guid")
                if g and g in ANIMS:
                    base = os.path.splitext(os.path.basename(ANIMS[g]))[0]
                    anim_map[base] = ANIMS[g]
            if anim_map:
                ap.props.append(self.animlib_prop(anim_map))
            if data.get("m_PlayAutomatically"):
                ap.props.append("metadata/unity_autoplay = true")
            node.children.append(ap)

        if animators:
            self.warnings.append(f"Animator component not converted on '{self.gos.get(go, {}).get('name')}'")
        if navs:
            nv = Node("NavigationAgent3D", "NavigationAgent3D")
            node.children.append(nv)
            self.warnings.append("NavMeshAgent present - needs navigation mesh (manual)")
        for _no in nav_obstacles:
            no = Node("NavigationObstacle3D", "NavigationObstacle3D")
            node.children.append(no)
            self.warnings.append("NavMeshObstacle present - needs navigation mesh (manual)")

        # --- mono behaviour: attach script only for ported classes; scene fields are
        # resolved at runtime by the ported scripts (node-name conventions) or wired
        # by hand later (documented in migration log).
        for data in monos:
            scr = data.get("m_Script") or {}
            g = scr.get("guid")
            cls = SCRIPTS_BY_GUID.get(g)
            if not cls:
                continue
            if cls in PORTED and cls not in UI_BTN_CLASSES:
                node.props.append("script = ExtResource(\"%s\")" % self.ext(PORTED[cls], "Script"))
                node.props.append("metadata/unity_class = \"%s\"" % cls)
            elif cls in UI_BTN_CLASSES:
                # attached by stage6 to the btn1 Button node; keep the tag for
                # the report so the wiring is traceable.
                node.props.append("metadata/unity_class = \"%s\"" % cls)
            else:
                # remember which behaviour was here for the migration log/report
                node.props.append("metadata/unity_class = \"%s\"" % cls)
                self.warnings.append(f"unity script {cls} (guid {g}) on '{self.gos.get(go, {}).get('name')}' not ported")
        return node

    def collider_shape(self, cls, data):
        if cls == 65:  # BoxCollider
            size = data.get("m_Size")
            if not isinstance(size, dict):
                return None
            s = vec3(size)
            # Godot rejects negative box sizes (Unity mirrored colliders use them)
            s = tuple(abs(x) for x in s)
            return self.sub_resource(
                '[sub_resource type="BoxShape3D" id="__ID__"]\nsize = Vector3(%s, %s, %s)' % tuple(fmt_float(x) for x in s))
        if cls == 135:  # SphereCollider
            r = data.get("m_Radius", 0.5)
            return self.sub_resource(
                '[sub_resource type="SphereShape3D" id="__ID__"]\nradius = %s' % fmt_float(r))
        if cls == 136:  # CapsuleCollider
            r = data.get("m_Radius", 0.5)
            h = data.get("m_Height", 2.0)
            d = data.get("m_Direction", 1)
            if d == 1:
                return self.sub_resource(
                    '[sub_resource type="CapsuleShape3D" id="__ID__"]\nradius = %s\nheight = %s' % (fmt_float(r), fmt_float(h)))
            return self.sub_resource(
                '[sub_resource type="CapsuleShape3D" id="__ID__"]\nradius = %s\nheight = %s' % (fmt_float(r), fmt_float(h)))
        if cls == 64:  # MeshCollider
            mm = data.get("m_Mesh") or {}
            g = mm.get("guid")
            if g and g in MESHES:
                return self.sub_resource(
                    '[sub_resource type="ConcavePolygonShape3D" id="__ID__"]', key="concave")
        return None

    def light_type(self, data):
        # Unity LightType: 0=Spot 1=Directional 2=Point 3=Area(baked only)
        t = data.get("m_Type", 2)
        m = {0: "SpotLight3D", 1: "DirectionalLight3D", 2: "OmniLight3D", 3: "OmniLight3D"}
        return m.get(t, "OmniLight3D")

    def light_props(self, data):
        out = []
        color = data.get("m_Color")
        if isinstance(color, dict):
            v = vec4(color)
            # NOTE: this engine build's text parser rejects 3-arg Color(); always 4 args
            out.append("light_color = Color(%s, %s, %s, %s)" % (fmt_float(v[0]), fmt_float(v[1]), fmt_float(v[2]), fmt_float(v[3] if len(v) > 3 else 1.0)))
        en = data.get("m_Intensity")
        if en is not None:
            out.append("light_energy = %s" % fmt_float(en))
        lt = self.light_type(data)
        rng = data.get("m_Range")
        if lt == "SpotLight3D":
            if rng is not None:
                out.append("spot_range = %s" % fmt_float(rng))
            ang = data.get("m_SpotAngle")
            if ang is not None:
                out.append("spot_angle = %s" % fmt_float(ang))
        elif lt == "OmniLight3D":
            if rng is not None:
                out.append("omni_range = %s" % fmt_float(rng))
        return out

    def animlib_prop(self, anim_map):
        sid = self.anim_library(anim_map)
        return "libraries = {\n\"\": SubResource(\"%s\")\n}" % sid

    def anim_library(self, anim_map):
        text = '[sub_resource type="AnimationLibrary" id="__ID__"]\n'
        text += "\n".join("animations/%s = ExtResource(\"%s\")" % (n, self.ext(p, "Animation"))
                           for n, p in anim_map.items())
        if not anim_map:
            text = '[sub_resource type="AnimationLibrary" id="__ID__"]\nanimations = {}'
        return self.sub_resource(text, key=text)

    def build_tree(self, tr):
        t = self.xforms[tr]
        name = self.node_name(t["go"], tr)
        node = self.build(tr, name)
        for ctr in t.get("children", []):
            if ctr in self.xforms:
                node.children.append(self.build_tree(ctr))
        return node

    def emit(self):
        lines = []
        # tree pass
        roots = [a for a in self.xforms if not self.parent_of.get(a)]
        roots.sort(key=lambda a: self.xforms[a].get("go", 0))
        if len(roots) > 1:
            # Godot scenes require exactly one root: wrap multi-root Unity scenes
            wrap = Node("SceneRoot", "Node3D")
            for r in roots:
                wrap.children.append(self.build_tree(r))
            self.emit_node(wrap, lines, None, "")
        else:
            for r in roots:
                self.emit_node(self.build_tree(r), lines, None, "")
        header = "[gd_scene load_steps=%d format=3]" % (len(self.ext_res) + len(self.sub_res) + 1)
        all_lines = [header]
        for kind, p, i in self.ext_res:
            all_lines.append('[ext_resource type="%s" path="%s" id="%s"]' % (kind, p, i))
        for s in self.sub_res:
            all_lines.append(s)
        all_lines.append("")
        all_lines += lines
        return "\n".join(all_lines) + "\n"

    def emit_node(self, node, lines, parent_attr, rel_path):
        # parent_attr: value of the .tscn parent= attribute (None for the scene
        # root, "." for its direct children, else the parent's rel_path).
        # rel_path: this node's path EXCLUDING the scene root name.
        node.path = rel_path
        if node.go:
            self.go_path[node.go] = node.path
        lines.append("")
        if parent_attr is None:
            lines.append('[node name="%s" type="%s"]' % (node.name, node.type))
        else:
            lines.append('[node name="%s" type="%s" parent="%s"]' % (node.name, node.type, parent_attr))
        if node.instance:
            # Godot 4 requires the instance attribute in the node header line;
            # as a property line it is silently ignored (empty node).
            lines[-1] = lines[-1][:-1] + ' instance=ExtResource("%s")]' % node.instance
        for p in node.props:
            lines.append(p)
        for c in node.children:
            child_rel = c.name if rel_path == "" else rel_path + "/" + c.name
            self.emit_node(c, lines, "." if rel_path == "" else rel_path, child_rel)

def convert(path, out_path, is_prefab=False):
    c = Converter(path)
    text = c.emit()
    ensure_dir(os.path.dirname(out_path))
    with open(out_path, "w") as f:
        f.write(text)
    return c

def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("target", nargs="?", default="all")
    ap.add_argument("--only", default="")
    args = ap.parse_args()
    scenes_dir = os.path.join(UNITY_SRC, "1_Scenes")
    out_scenes = os.path.join(PROJ, "converted", "scenes")
    out_prefabs = os.path.join(PROJ, "converted", "prefabs")
    report = {"scenes": [], "prefabs": [], "warnings": {}}
    if args.target in ("all", "scenes"):
        for fp in sorted(__import__("glob").glob(os.path.join(scenes_dir, "*.unity"))):
            if args.only and args.only not in os.path.basename(fp):
                continue
            base = os.path.splitext(os.path.basename(fp))[0]
            print(f"scene: {base} ...", flush=True)
            c = convert(fp, os.path.join(out_scenes, base + ".tscn"))
            report["scenes"].append(base)
            report["warnings"][base] = c.warnings
            print(f"  -> nodes ok; {len(c.warnings)} warnings", flush=True)
    if args.target in ("all", "prefabs"):
        for fp in sorted(__import__("glob").glob(os.path.join(UNITY_SRC, "Prefab", "*.prefab"))):
            if args.only and args.only not in os.path.basename(fp):
                continue
            base = os.path.splitext(os.path.basename(fp))[0]
            print(f"prefab: {base} ...", flush=True)
            c = convert(fp, os.path.join(out_prefabs, base + ".tscn"), is_prefab=True)
            report["prefabs"].append(base)
            report["warnings"][base] = c.warnings
    ensure_dir(os.path.join(PROJ, "tools"))
    with open(os.path.join(PROJ, "tools", "scene_report.json"), "w") as f:
        json.dump(report, f, indent=1)
    print("done")

if __name__ == "__main__":
    main()
