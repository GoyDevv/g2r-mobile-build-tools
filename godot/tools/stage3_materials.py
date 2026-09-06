"""Stage 3: convert Unity .mat (built-in Standard/Diffuse-ish) to Godot StandardMaterial3D .tres."""
import os, sys, json, glob, re
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from unitylib import (UNITY_SRC, PROJ, load_unity_docs, vec4, vec3, guid_of_meta,
                      fmt_color, fmt_float, ensure_dir, unescape_unity)

DB = os.path.join(PROJ, "tools", "db.json")
DST = os.path.join(PROJ, "converted", "materials")

def load_db():
    with open(DB) as f:
        return json.load(f)

def first(d):
    if isinstance(d, dict):
        for k in d:
            if not k.startswith("serializedVersion"):
                return d
    return d or {}

def tex_guid_of(texenv):
    # texenv = {"_MainTex": {"m_Texture": {fileID, guid, type}, m_Scale, m_Offset}}
    if not isinstance(texenv, dict):
        return None
    for k, v in texenv.items():
        if isinstance(v, dict):
            t = v.get("m_Texture") or {}
            if isinstance(t, dict) and t.get("fileID") != 0:
                return t.get("guid")
    return None

def main():
    ensure_dir(DST)
    db = load_db()
    texmap = db.get("textures", {})
    mats = sorted(glob.glob(os.path.join(UNITY_SRC, "**", "*.mat"), recursive=True))
    print(f"materials found: {len(mats)}")
    out = {}
    used_names = {}
    n_ok = n_tex = 0
    for fp in mats:
        rel = os.path.relpath(fp, UNITY_SRC)
        docs = load_unity_docs(fp)
        mat = None
        for d in docs:
            if d["cls"] == 21:
                mat = d["data"]
                break
        if not mat:
            print(f"  [skip] {rel}: no Material block")
            continue
        name = mat.get("m_Name") or os.path.splitext(os.path.basename(fp))[0]
        base = re.sub(r"[^A-Za-z0-9_]+", "_", name).strip("_") or "mat"
        # flatten: uniquify name
        n = used_names.get(base, 0)
        used_names[base] = n + 1
        fname = base if n == 0 else f"{base}_{n}"
        tres = convert_mat(mat, texmap)
        dst = os.path.join(DST, fname + ".tres")
        with open(dst, "w") as f:
            f.write(tres)
        g = guid_of_meta(fp + ".meta")
        if g:
            out[g] = f"res://converted/materials/{fname}.tres"
        n_ok += 1
        if "albedo_texture = ExtResource" in tres:
            n_tex += 1
    with open(os.path.join(PROJ, "tools", "materials.json"), "w") as f:
        json.dump(out, f, indent=0)
    print(f"converted {n_ok} materials ({n_tex} with texture), guid index written")

def convert_mat(mat, texmap):
    sp = mat.get("m_SavedProperties") or {}
    texenvs = sp.get("m_TexEnvs") or []
    floats = {}
    colors = {}
    for lst, dct in ((sp.get("m_Floats") or [], floats), (sp.get("m_Colors") or [], colors)):
        for item in lst:
            if isinstance(item, dict):
                for k, v in item.items():
                    if isinstance(v, (int, float)):
                        dct[k] = float(v)
                    elif isinstance(v, dict) and not k.startswith("serializedVersion"):
                        dct[k] = v
    shader = mat.get("m_Shader") or {}
    fileid = shader.get("fileID")
    keywords = mat.get("m_ShaderKeywords") or ""
    # render mode heuristics
    mode = floats.get("_Mode")
    alpha = 0.0
    if "_ALPHATEST_ON" in keywords:
        alpha = 2  # alpha scissor
    elif "_ALPHABLEND_ON" in keywords or "_ALPHAPREMULTIPLY_ON" in keywords:
        alpha = 1
    # _Mode 0 opaque,1 cutout,2 fade,3 transparent
    if mode is not None:
        if mode == 1:
            alpha = 2
        elif mode in (2, 3):
            alpha = 1
    albedo = colors.get("_Color")
    albedo_vec = vec4(albedo) if isinstance(albedo, dict) else (1, 1, 1, 1)
    if alpha == 0 and albedo_vec[3] < 0.99:
        alpha = 1  # legacy diffuse with transparent color
    emiss = colors.get("_EmissionColor")
    emiss_vec = vec4(emiss) if isinstance(emiss, dict) else None
    main_tex = None
    for te in texenvs:
        g = tex_guid_of(te)
        if g and g in texmap:
            main_tex = texmap[g]
            break
    metal = floats.get("_Metallic", 0.0)
    gloss = floats.get("_Glossiness", 0.5)
    roughness = 1.0 - gloss
    is_standard = fileid in (14, 106)
    cutout = floats.get("_Cutoff", 0.5)

    lines = []
    lines.append('[gd_resource type="StandardMaterial3D" format=3]')
    if main_tex:
        lines.append(f'[ext_resource type="Texture2D" path="{main_tex}" id="1"]')
    lines.append("[resource]")
    if not is_standard and fileid in (46, 10701, 34, 7):
        metal = 0.0
    if main_tex:
        lines.append("albedo_texture = ExtResource(\"1\")")
    if albedo_vec != (1, 1, 1, 1) or (main_tex is None):
        lines.append(f"albedo_color = {fmt_color(albedo_vec)}")
    if metal:
        lines.append(f"metallic = {fmt_float(metal)}")
    lines.append(f"roughness = {fmt_float(roughness)}")
    if alpha == 1:
        lines.append("transparency = 1")
    elif alpha == 2:
        lines.append("transparency = 2")
        lines.append(f"alpha_scissor_threshold = {fmt_float(cutout)}")
    if emiss_vec is not None and (emiss_vec[0] or emiss_vec[1] or emiss_vec[2]):
        lines.append(f"emission_enabled = true")
        lines.append(f"emission = {fmt_color(emiss_vec, False)}")
    # keep informational comment with the unity source path & shader id
    lines.append(f'; source: shader fileID {fileid}')
    return "\n".join(lines) + "\n"

if __name__ == "__main__":
    main()
