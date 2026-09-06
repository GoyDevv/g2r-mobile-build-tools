"""Stage 2: convert every Unity .obj into a minimal glTF 2.0 binary (.glb) in the Godot project."""
import os, sys, json, struct, glob, re
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from unitylib import UNITY_SRC, PROJ, guid_of_meta, ensure_dir

SRC_MESH = os.path.join(UNITY_SRC, "Meshs")
DST = os.path.join(PROJ, "assets", "meshes")

def build_glb(positions, uvs, normals, indices):
    """positions: list of (x,y,z); uvs: list of (u,v); normals list; indices list of int"""
    def blob_f32(items):
        b = bytearray()
        for it in items:
            b += struct.pack("<" + "f" * len(it), *it)
        return b
    pos = blob_f32(positions)
    uv_b = blob_f32(uvs) if uvs else bytearray()
    nrm = blob_f32(normals) if normals else bytearray()
    maxi = max(indices) if indices else 0
    idx_fmt = "I" if maxi > 65535 else "H"
    idx_b = bytearray()
    for i in indices:
        idx_b += struct.pack("<" + idx_fmt, i)
    while len(idx_b) % 4:
        idx_b.append(0)

    json_doc = {"asset": {"version": "2.0", "generator": "granny-migrate"},
                "scene": 0, "scenes": [{"nodes": [0]}], "nodes": [{"mesh": 0}],
                "meshes": [{"primitives": [{}]}], "buffers": [{"byteLength": 0}],
                "bufferViews": [], "accessors": []}
    accessors = []
    bufferViews = []
    attr = {}
    prim = {"attributes": attr}
    def add_attr(key, acc_idx):
        attr[key] = acc_idx

    def add_view(data):
        bufferViews.append({"buffer": 0, "byteOffset": 0, "byteLength": len(data)})
        return len(bufferViews) - 1

    # accumulate all data into one binary blob with 4-byte alignment
    blobs = []
    def append(data):
        while len(data) % 4:
            data.append(0)
        blobs.append(data)
        return sum(len(b) for b in blobs) - len(data)

    # POSITION
    off = append(pos)
    bufferViews.append({"buffer": 0, "byteOffset": off, "byteLength": len(pos)})
    accessors.append({"bufferView": len(bufferViews) - 1, "componentType": 5126, "count": len(positions),
                      "type": "VEC3", "min": [min(p[0] for p in positions), min(p[1] for p in positions), min(p[2] for p in positions)],
                      "max": [max(p[0] for p in positions), max(p[1] for p in positions), max(p[2] for p in positions)]})
    add_attr("POSITION", len(accessors) - 1)
    if uvs:
        off = append(uv_b)
        bufferViews.append({"buffer": 0, "byteOffset": off, "byteLength": len(uv_b)})
        accessors.append({"bufferView": len(bufferViews) - 1, "componentType": 5126, "count": len(uvs), "type": "VEC2"})
        add_attr("TEXCOORD_0", len(accessors) - 1)
    if normals:
        off = append(nrm)
        bufferViews.append({"buffer": 0, "byteOffset": off, "byteLength": len(nrm)})
        accessors.append({"bufferView": len(bufferViews) - 1, "componentType": 5126, "count": len(normals), "type": "VEC3"})
        add_attr("NORMAL", len(accessors) - 1)
    off = append(idx_b)
    bufferViews.append({"buffer": 0, "byteOffset": off, "byteLength": len(idx_b)})
    accessors.append({"bufferView": len(bufferViews) - 1, "componentType": 5123 if idx_fmt == "H" else 5125,
                      "count": len(indices), "type": "SCALAR"})
    prim["indices"] = len(accessors) - 1
    json_doc["meshes"][0]["primitives"] = [prim]
    json_doc["bufferViews"] = bufferViews
    json_doc["accessors"] = accessors

    body = bytearray()
    for b in blobs:
        body += b
    json_doc["buffers"][0]["byteLength"] = len(body)
    js = json.dumps(json_doc, separators=(",", ":")).encode()
    # pad JSON chunk with spaces (0x20), BIN chunk with zeros, both to 4 bytes
    def pad_to4(b, fill):
        extra = (4 - (len(b) % 4)) % 4
        return b + fill * extra
    js_p = pad_to4(js, b" ")
    body_p = pad_to4(bytes(body), b"\x00")
    total = 12 + 8 + len(js_p) + 8 + len(body_p)
    header = struct.pack("<4sII", b"glTF", 2, total)
    json_chunk = struct.pack("<I4s", len(js_p), b"JSON") + js_p
    bin_chunk = struct.pack("<I4s", len(body_p), b"BIN\x00") + body_p
    return header + json_chunk + bin_chunk

def parse_obj(path):
    positions, uvs, normals, faces = [], [], [], []
    for raw in open(path, errors="ignore"):
        line = raw.strip()
        if not line:
            continue
        parts = line.split()
        if not parts:
            continue
        tag = parts[0]
        if tag == "v":
            positions.append((float(parts[1]), float(parts[2]), float(parts[3])))
        elif tag == "vt":
            uvs.append((float(parts[1]), 1.0 - float(parts[2]) if len(parts) > 2 else 0.0))
        elif tag == "vn":
            normals.append((float(parts[1]), float(parts[2]), float(parts[3])))
        elif tag == "f":
            faces.append(parts[1:])
    # resolve indices
    verts, uvidx, nidx, idx = [], [], [], []
    cache = {}
    for f in faces:
        for vtxt in f:
            if vtxt in cache:
                idx.append(cache[vtxt])
                continue
            comps = vtxt.split("/")
            vi = int(comps[0]) - 1
            newi = len(verts)
            cache[vtxt] = newi
            verts.append(positions[vi])
            if len(comps) > 1 and comps[1]:
                uvi = int(comps[1]) - 1
                uvidx.append(uvs[uvi] if uvi < len(uvs) else (0.0, 0.0))
            else:
                uvidx.append((0.0, 0.0))
            if len(comps) > 2 and comps[2]:
                ni = int(comps[2]) - 1
                nidx.append(normals[ni] if ni < len(normals) else (0.0, 1.0, 0.0))
            else:
                nidx.append((0.0, 1.0, 0.0))
            idx.append(newi)
    return verts, uvidx, nidx, idx

def main():
    ensure_dir(DST)
    meta = {}
    for mf in glob.glob(os.path.join(SRC_MESH, "*.obj.meta")):
        g = guid_of_meta(mf)
        if g:
            meta[g] = os.path.splitext(os.path.basename(mf))[0]
    objs = glob.glob(os.path.join(SRC_MESH, "*.obj"))
    print(f"converting {len(objs)} obj files")
    out = {}
    n = 0
    used = {}
    for op in sorted(objs):
        base = os.path.splitext(os.path.basename(op))[0]
        # sanitize: ext_resource paths quote() special chars -> keep plain ASCII
        base = re.sub(r"[^A-Za-z0-9_.\-]+", "_", base).strip("_")
        c = used.get(base, 0)
        used[base] = c + 1
        if c:
            base = f"{base}_{c}"
        verts, uvs, nrm, idx = parse_obj(op)
        if len(verts) < 3 or len(idx) < 3:
            continue
        glb = build_glb(verts, uvs, nrm, idx)
        dst = os.path.join(DST, base + ".glb")
        with open(dst, "wb") as f:
            f.write(glb)
        n += 1
        g = guid_of_meta(op + ".meta")
        if g:
            out[g] = {"glb": f"res://assets/meshes/{base}.glb", "name": base,
                      "verts": len(verts), "tris": len(idx) // 3}
    ensure_dir(os.path.join(PROJ, "tools"))
    with open(os.path.join(PROJ, "tools/meshes.json"), "w") as f:
        json.dump(out, f, indent=0)
    print(f"wrote {n} glb files; {len(out)} guid-indexed")

if __name__ == "__main__":
    main()
