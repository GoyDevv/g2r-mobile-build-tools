"""Stage 6: Unity Canvas UI -> Godot Control nodes (post-processor).

Runs after stage5 on each converted scene .tscn. Unity stores all UI widgets
(Image/Button/... uGUI) as MonoBehaviours on GameObjects whose transform is a
RectTransform (class 224); stage5 skips those subtrees, so prompts, buttons and
menus never made it into the Godot scenes.

What this pass does per Unity scene:
  1. collects every RectTransform (class 224) and rebuilds the UI trees;
  2. maps each UI GameObject to a Godot node:
       - Button      when the GO is clickable (uGUI-style mono with
                     m_Interactable/m_OnClick, or a known UI controller class)
       - TextureRect when an Image-like mono carries a sprite
       - ColorRect   when an Image-like mono has a non-white colour, no sprite
       - Control     otherwise (group / layout containers)
  3. converts Unity anchors/offsets (y-up) to Godot (y-down, top-left).
     Offsets are anchor-line-relative so the math only depends on the parent
     reference size for bottom/right-anchored children (REF = 1920x1080).
     Root canvases are ScreenSpaceOverlay -> emitted as full-viewport Controls.
  4. rewires clicks: the original wired buttons at runtime
     (Start() { btn1.onClick.AddListener(...) }), so this pass resolves each UI
     controller's serialized `btn1` target and the persistent m_OnClick calls
     and records them on the Button node. Interactive Buttons get either their
     ported controller script (self-connecting) or ui_click_bridge.gd, which
     dispatches the recorded target/method at runtime.
"""
import os, sys, json, re
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from unitylib import (UNITY_SRC, PROJ, load_unity_docs, vec3, vec4, fmt_float,
                      ensure_dir, unescape_unity)
from stage5_scenes import sanitize_name, SCRIPTS_BY_GUID, PORTED, TEXTURES

# Reference authoring screen (root-canvas children with bottom/right anchors
# keep px offsets; only these need a screen size assumption).
REF_W, REF_H = 1920.0, 1080.0

# UI controller classes whose ported script exposes the click action. Their GO
# becomes a Button; the ported script self-connects `pressed` (mirrors Unity
# Start() { btn1.onClick.AddListener(TaskOnClick) } with btn1 on the same GO).
UI_SELF_BUTTON = {
    "SeeObjects": "task_on_click",
    "dropObjects": "task_on_click",
    "ClickPlayButton": "task_on_click",
    "BackToMenu": "task_on_click",
    "clickBeartrapMenu": "task_on_click",
    "ClickContinueButton": "task_on_click",
    "ClickContinueButton2": "task_on_click",
}

# uGUI-ish widget GUID that is missing from this project's assets: it carries
# m_Sprite/m_Color when used as an Image and m_Interactable/m_OnClick when used
# as a Button. Its logic can't run, but visuals/shape are reproduced.
MISSING_UI = {"f70555f144d8491a825f0804e09c671c"}


def snake(name):
    return re.sub(r"(?<!^)(?=[A-Z])", "_", name).lower()


def dedupe(seq):
    out, seen = [], set()
    for item in seq:
        key = item[1:]  # (target_go_name, method) unique key
        if item[1] and key not in seen:
            seen.add(key)
            out.append(item)
    return out


class UIEmitters:
    def __init__(self, path):
        self.docs = load_unity_docs(path)
        self.by = {d["anchor"]: d for d in self.docs}
        self.go_name = {}
        self.go_active = {}
        for d in self.docs:
            if d["cls_name"] == "GameObject" and isinstance(d["data"], dict):
                self.go_name[d["anchor"]] = unescape_unity(d["data"].get("m_Name") or "")
                self.go_active[d["anchor"]] = d["data"].get("m_IsActive", 1) != 0
        self.monos_by_go = {}
        for d in self.docs:
            if d["cls_name"] == "MonoBehaviour" and isinstance(d["data"], dict):
                go = d["data"].get("m_GameObject", {}).get("fileID")
                if go:
                    self.monos_by_go.setdefault(go, []).append(d)
        self.rects = {}
        for d in self.docs:
            if d["cls_name"] == "RectTransform" and isinstance(d["data"], dict):
                dd = d["data"]
                self.rects[d["anchor"]] = {
                    "go": dd.get("m_GameObject", {}).get("fileID"),
                    "father": dd.get("m_Father", {}).get("fileID") or 0,
                    "children": [x.get("fileID") for x in dd.get("m_Children") or []
                                 if isinstance(x, dict)],
                    "amin": vec3(dd.get("m_AnchorMin") or {}),
                    "amax": vec3(dd.get("m_AnchorMax") or {}),
                    "apos": vec3(dd.get("m_AnchoredPosition") or {}),
                    "sd": vec3(dd.get("m_SizeDelta") or {}),
                    "pivot": vec3(dd.get("m_Pivot") or {}),
                }

    # ------------------------------------------------------------- layout ---
    @staticmethod
    def layout(rect, pw, ph):
        """Godot anchors+offsets from Unity fields given parent size (pw, ph).
        Unity UI y is up; Godot Control offsets are from the top, so y flips."""
        amin, amax = rect["amin"], rect["amax"]
        ax, ay = amin[0] * pw, amin[1] * ph
        bx, by = amax[0] * pw, amax[1] * ph
        sx = (bx - ax) + rect["sd"][0]
        sy = (by - ay) + rect["sd"][1]
        cx = (ax + bx) / 2.0 + rect["apos"][0]
        cy = (ay + by) / 2.0 + rect["apos"][1]
        pv = rect["pivot"]
        px = pv[0] if pv and pv[0] is not None else 0.5
        py = pv[1] if pv and pv[1] is not None else 0.5
        minx, miny = cx - sx * px, cy - sy * py
        maxx, maxy = minx + sx, miny + sy
        return (amin[0], amin[1], amax[0], amax[1]), \
               (minx - ax, ph - maxy - ay, maxx - bx, ph - miny - by), (sx, sy)

    # ---------------------------------------------------- classification ---
    def mono_class(self, mono):
        g = str(mono["data"].get("m_Script", {}).get("guid") or "")
        return SCRIPTS_BY_GUID.get(g)

    def go_roles(self, go):
        clickable = False
        sprite_guid = None
        color = None
        controller_cls = None
        label = None  # (text, font_size, alignment, color) from UnityEngine.UI.Text
        for m in self.monos_by_go.get(go, []):
            dd = m["data"]
            cn = self.mono_class(m)
            if cn in UI_SELF_BUTTON:
                controller_cls = cn
                clickable = True
            if "m_OnClick" in dd or dd.get("m_Interactable") is not None:
                clickable = True
            sp = dd.get("m_Sprite") or {}
            if isinstance(sp, dict) and sp.get("guid") and sprite_guid is None:
                sprite_guid = sp["guid"]
            col = dd.get("m_Color")
            if isinstance(col, dict) and color is None:
                color = vec4(col)
            # UnityEngine.UI.Text (fileID 708705254) carries the label string
            if (m["data"].get("m_Script") or {}).get("fileID") == 708705254:
                t = m["data"].get("m_Text") or ""
                if isinstance(t, str) and t.strip():
                    label = (t, dd.get("m_FontSize"), dd.get("m_Alignment"), vec4(col) if isinstance(col, dict) else None)
        return clickable, sprite_guid, color, controller_cls, label

    # ----------------------------------------------------- click wiring -----
    def btn_entries_for_go(self, go):
        """(controller_cls, target_go_name, method) triples that should fire when
        this GO's Button is pressed (original runtime wiring reconstructed).
        controller_cls is None for raw m_OnClick persistent calls."""
        entries = []
        # controllers (elsewhere) whose serialized btn1 Button points here
        for other_go, monos in self.monos_by_go.items():
            for m in monos:
                cn = self.mono_class(m)
                if not cn or cn not in UI_SELF_BUTTON:
                    continue
                btn = m["data"].get("btn1") or {}
                tgt = None
                if isinstance(btn, dict) and btn.get("fileID"):
                    comp = self.by.get(btn["fileID"])
                    if comp and comp["cls_name"] == "MonoBehaviour":
                        tgt = comp["data"].get("m_GameObject", {}).get("fileID")
                if tgt == go:
                    entries.append((cn, self.go_name.get(other_go), UI_SELF_BUTTON[cn]))
        # serialized persistent calls on this GO
        for m in self.monos_by_go.get(go, []):
            oc = m["data"].get("m_OnClick") or {}
            calls = ((oc.get("m_PersistentCalls") or {}).get("m_Calls")) or []
            for call in calls:
                if not isinstance(call, dict):
                    continue
                tgt = (call.get("m_Target") or {}).get("fileID")
                method = call.get("m_MethodName") or ""
                if not tgt or not method:
                    continue
                comp = self.by.get(tgt)
                if comp and comp["cls_name"] == "MonoBehaviour":
                    g2 = comp["data"].get("m_GameObject", {}).get("fileID")
                    entries.append((None, self.go_name.get(g2), snake(method)))
        return dedupe(entries)

    # --------------------------------------------------------- emission -----
    def emit_ui(self, used_names, ext_base):
        """Returns (node_lines, ext_lines). ext ids continue after ext_base."""
        rect_of_go = {r["go"]: a for a, r in self.rects.items()}
        roots = [a for a in self.rects if self.rects[a]["father"] not in rect_of_go]
        roots.sort(key=lambda a: self.rects[a]["go"] or 0)

        ext_paths = {}          # path -> id string
        node_lines = []
        ext_lines = []

        def ext(path):
            if path not in ext_paths:
                ext_paths[path] = str(ext_base + len(ext_paths) + 1)
            return ext_paths[path]

        def uniq(go, tr):
            base = self.go_name.get(go) or ("GO_%d" % tr)
            base = sanitize_name(base) or ("GO_%d" % tr)
            name = base
            n = 1
            while name in used_names:
                name = "%s_%d" % (base, n)
                n += 1
            used_names.add(name)
            return name

        def walk(rect_a, node_name, parent_attr, rel_path, pw, ph, ui_root=False):
            """parent_attr: value of the Godot parent= attribute. Direct
            children of the file root use ".". rel_path: node path relative
            to the file root. ui_root: this is a Unity ScreenSpaceOverlay
            canvas -> full-viewport Control."""
            rect = self.rects[rect_a]
            go = rect["go"]
            clickable, sprite_guid, color, controller_cls, label = self.go_roles(go)
            entries = self.btn_entries_for_go(go)
            active = self.go_active.get(go, True)

            if controller_cls or clickable or entries:
                ntype = "Button"
            elif label is not None:
                ntype = "Label"
            elif sprite_guid and sprite_guid in TEXTURES:
                ntype = "TextureRect"
            elif color is not None and color[3] > 0.001 \
                    and (color[0] + color[1] + color[2]) < 2.99:
                ntype = "ColorRect"
            else:
                ntype = "Control"

            node_lines.append("")
            if ui_root:
                # direct child of the file root (relative path = own name)
                node_lines.append('[node name="%s" type="%s" parent="."]' % (node_name, ntype))
            else:
                node_lines.append('[node name="%s" type="%s" parent="%s"]'
                                  % (node_name, ntype, parent_attr))

            if ui_root:
                # ScreenSpaceOverlay canvas: full-viewport Control
                node_lines.append("anchor_left = 0.0")
                node_lines.append("anchor_top = 0.0")
                node_lines.append("anchor_right = 1.0")
                node_lines.append("anchor_bottom = 1.0")
                node_lines.append("offset_left = 0.0")
                node_lines.append("offset_top = 0.0")
                node_lines.append("offset_right = 0.0")
                node_lines.append("offset_bottom = 0.0")
                size = (REF_W, REF_H)
            else:
                an, off, size = self.layout(rect, pw, ph)
                node_lines.append("anchor_left = %s" % fmt_float(an[0]))
                node_lines.append("anchor_top = %s" % fmt_float(an[1]))
                node_lines.append("anchor_right = %s" % fmt_float(an[2]))
                node_lines.append("anchor_bottom = %s" % fmt_float(an[3]))
                node_lines.append("offset_left = %s" % fmt_float(off[0]))
                node_lines.append("offset_top = %s" % fmt_float(off[1]))
                node_lines.append("offset_right = %s" % fmt_float(off[2]))
                node_lines.append("offset_bottom = %s" % fmt_float(off[3]))
            if not active:
                node_lines.append("visible = false")
                node_lines.append("process_mode = 3")

            # visuals
            tex_path = TEXTURES.get(sprite_guid or "") if sprite_guid else None
            if ntype == "TextureRect" and tex_path:
                node_lines.append("texture = ExtResource(\"%s\")" % ext(tex_path))
                if color is not None and (color[0], color[1], color[2], color[3]) != (1, 1, 1, 1):
                    node_lines.append("modulate = Color(%s, %s, %s, %s)"
                                      % tuple(fmt_float(c) for c in color[:4]))
            elif ntype == "ColorRect" and color is not None:
                node_lines.append("color = Color(%s, %s, %s, %s)"
                                  % tuple(fmt_float(c) for c in color[:4]))
            if ntype == "Button" and tex_path:
                node_lines.append("texture_normal = ExtResource(\"%s\")" % ext(tex_path))
            if ntype == "Label" and label is not None:
                txt, fsize, align, lcol = label
                node_lines.append("text = \"%s\"" % txt.replace("\\", "\\\\").replace('\"', '\\\"'))
                if fsize:
                    node_lines.append("theme_override_font_sizes/font_size = %d" % int(fsize))
                if align is not None:
                    # Unity TextAnchor: 0..2 top, 3..5 middle, 6..8 bottom; 0/3/6 left, 1/4/7 center, 2/5/8 right
                    ha = align % 3
                    va = align // 3
                    node_lines.append("horizontal_alignment = %d" % ha)
                    node_lines.append("vertical_alignment = %d" % va)
                if lcol is not None and (lcol[0], lcol[1], lcol[2], lcol[3]) != (1, 1, 1, 1):
                    node_lines.append("modulate = Color(%s, %s, %s, %s)"
                                      % tuple(fmt_float(c) for c in lcol[:4]))

            # scripts / click metadata
            if controller_cls and controller_cls in PORTED:
                node_lines.append("script = ExtResource(\"%s\")" % ext(PORTED[controller_cls]))
                node_lines.append("metadata/unity_class = \"%s\"" % controller_cls)
            elif entries:
                e_cls, tgt, method = entries[0]
                if e_cls and e_cls in PORTED:
                    # ported controller wired to this Button via btn1: attach its
                    # script directly to the Button node (self-connects pressed),
                    # mirroring the original Start() { btn1.onClick.AddListener }.
                    node_lines.append("script = ExtResource(\"%s\")" % ext(PORTED[e_cls]))
                    node_lines.append("metadata/unity_class = \"%s\"" % e_cls)
                else:
                    node_lines.append("script = ExtResource(\"%s\")" % ext("res://scripts/ui/ui_click_bridge.gd"))
                    node_lines.append("metadata/unity_click_target = \"%s\""
                                      % (sanitize_name(tgt) if tgt else ""))
                    node_lines.append("metadata/unity_click_method = \"%s\"" % method)

            # children (depth-first); a node's children reference it by rel_path
            for ctr in rect["children"]:
                if ctr not in self.rects:
                    continue
                cgo = self.rects[ctr]["go"]
                cname = uniq(cgo, ctr)
                child_rel = rel_path + "/" + cname
                walk(ctr, cname, rel_path, child_rel, size[0], size[1])

        for r in roots:
            go = self.rects[r]["go"]
            name = uniq(go, r)
            walk(r, name, ".", name, REF_W, REF_H, ui_root=True)

        for path, i in ext_paths.items():
            kind = "Script" if path.endswith(".gd") else "Texture2D"
            ext_lines.append('[ext_resource type="%s" path="%s" id="%s"]' % (kind, path, i))
        return node_lines, ext_lines


def convert_scene(unity_path, tscn_path):
    em = UIEmitters(unity_path)
    with open(tscn_path, "r", errors="ignore") as f:
        lines = f.read().split("\n")

    used = set()
    n_ext = 0
    for ln in lines:
        if ln.startswith("[ext_resource "):
            n_ext += 1
        m = re.search(r'\[node name="([^"]*)"', ln)
        if m:
            used.add(m.group(1))

    ui_lines, ext_lines = em.emit_ui(used, n_ext)
    if not ui_lines:
        return 0

    n0 = next((i for i, ln in enumerate(lines) if ln.startswith("[node ")), None)
    if n0 is None:
        return 0
    # end of the (root) node's block
    n1 = next((i for i in range(n0 + 1, len(lines)) if lines[i].startswith("[node ")),
              len(lines))

    m = re.match(r"^(\[gd_scene load_steps=)(\d+)([^\]]*\])", lines[0])
    if m:
        # load_steps = resources + 1 (the scene itself); we added len(ext_lines)
        # new ext_resources (ui_lines are node lines, not resources).
        lines[0] = "%s%d%s" % (m.group(1), int(m.group(2)) + len(ext_lines), m.group(3))

    # Godot expects [ext_resource] before [sub_resource]: insert ours right
    # after the header, before the first existing resource/sub_resource line.
    hdr_end = 1
    while hdr_end < len(lines) and not lines[hdr_end].startswith("["):
        hdr_end += 1
    out = lines[:hdr_end]
    if ext_lines:
        out += ext_lines
    out += lines[hdr_end:n1]
    out += ui_lines
    out += lines[n1:]
    text = "\n".join(out)
    if not text.endswith("\n"):
        text += "\n"
    with open(tscn_path, "w") as f:
        f.write(text)
    return len(ui_lines)


def main():
    import glob
    scenes_dir = os.path.join(UNITY_SRC, "1_Scenes")
    out_scenes = os.path.join(PROJ, "converted", "scenes")
    total = 0
    for fp in sorted(glob.glob(os.path.join(scenes_dir, "*.unity"))):
        base = os.path.splitext(os.path.basename(fp))[0]
        n = convert_scene(fp, os.path.join(out_scenes, base + ".tscn"))
        total += n
        print(f"ui {base}: +{n} nodes", flush=True)
    print("done", total)


if __name__ == "__main__":
    main()
