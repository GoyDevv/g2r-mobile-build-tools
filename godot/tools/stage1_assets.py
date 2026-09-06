"""Stage 1: build guid database and copy raw textures/audio into the Godot project."""
import os, sys, json, shutil, re
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from unitylib import UNITY_SRC, PROJ, guid_of_meta, ensure_dir

def main():
    db = {}
    meta_count = 0
    for root, dirs, files in os.walk(UNITY_SRC):
        for fn in files:
            if fn.endswith(".meta"):
                meta_count += 1
                meta_path = os.path.join(root, fn)
                rel = os.path.relpath(meta_path, UNITY_SRC)[:-5]  # strip .meta
                g = guid_of_meta(meta_path)
                if g:
                    ext = os.path.splitext(rel)[1].lower()
                    db[g] = {"p": rel, "ext": ext}
    print(f"meta scanned: {meta_count}, guids: {len(db)}")

    kinds = {}
    for g, info in db.items():
        kinds.setdefault(info["ext"], []).append(g)
    for ext, gs in sorted(kinds.items()):
        print(f"  {ext or '(none)'}: {len(gs)}")

    copy_map = {}
    def copy_assets(exts, dest_rel, label):
        ensure_dir(os.path.join(PROJ, dest_rel))
        used = {}
        n = 0
        for ext in exts:
            for g in kinds.get(ext, []):
                info = db[g]
                src = os.path.join(UNITY_SRC, info["p"])
                if not os.path.exists(src):
                    continue
                base = os.path.splitext(os.path.basename(src))[0]
                # sanitize: ext_resource paths quote() special chars -> plain ASCII
                base = re.sub(r"[^A-Za-z0-9_.\-]+", "_", base).strip("_")
                name = base + ext
                key = name.lower()
                c = used.get(key, 0)
                used[key] = c + 1
                if c:
                    parent = os.path.basename(os.path.dirname(src))
                    parent = re.sub(r"[^A-Za-z0-9_.\-]+", "_", parent)
                    name = f"{parent}_{base}_{c}{ext}"
                dst = os.path.join(PROJ, dest_rel, name)
                if not os.path.exists(dst):
                    shutil.copy2(src, dst)
                copy_map[g] = f"res://{dest_rel}/{name}"
                n += 1
        print(f"copied {label}: {n}")

    copy_assets([".png", ".jpg", ".jpeg", ".tga", ".bmp"], "assets/textures", "textures")
    copy_assets([".wav", ".ogg", ".mp3", ".aiff", ".flac"], "assets/audio", "audio")

    img_exts = (".png", ".jpg", ".jpeg", ".tga", ".bmp")
    aud_exts = (".wav", ".ogg", ".mp3", ".aiff", ".flac")
    out = {"db": db,
           "textures": {g: p for g, p in copy_map.items() if db[g]["ext"] in img_exts},
           "audio": {g: p for g, p in copy_map.items() if db[g]["ext"] in aud_exts}}
    ensure_dir(os.path.join(PROJ, "tools"))
    with open(os.path.join(PROJ, "tools/db.json"), "w") as f:
        json.dump(out, f)
    print("db.json written")

if __name__ == "__main__":
    main()
