#!/usr/bin/env python3
"""audit_ui.py — simulate Godot Control layout for a .tscn and report visual issues.

Computes absolute rects (anchors * parent_size + offsets) in design space,
then reports: giant nodes, center blockers, zero-size controls, and topmost
visible Buttons/TextureRects. Usage: audit_ui.py <scene.tscn> [W H]
"""
import re, sys, json

CONTROL_TYPES = {"Control","Button","TextureRect","Label","Panel","ColorRect",
                 "NinePatchRect","OptionButton","CheckBox","CheckButton","HScrollBar","VScrollBar"}

def parse_tscn(path):
    txt = open(path, encoding="utf8", errors="replace").read()
    nodes = {}  # full path -> dict(name, type, parent_path, props)
    roots = []
    for m in re.finditer(r'^\[node name="([^"]+)"([^\]]*)\]\n((?:[^\[]*)*)', txt, re.M):
        header, body = m.group(2), m.group(3)
        name = m.group(1)
        t = re.search(r'type="([^"]+)"', header)
        p = re.search(r'parent="([^"]*)"', header)
        props = {}
        for line in body.splitlines():
            kv = re.match(r'^([a-zA-Z_0-9]+)\s*=\s*(.+)$', line.strip())
            if kv:
                props[kv.group(1)] = kv.group(2)
        if p:
            pp = p.group(1)
            parent_path = "" if pp == "." else (pp if not pp.endswith(".") else pp[:-1])
            # tscn parent paths use "/" separators; root children have parent="."
            full = (parent_path + "/" + name) if parent_path else name
            nodes[full] = {"name": name, "type": t.group(1) if t else None,
                           "parent": parent_path if parent_path else None, "props": props}
        else:
            roots.append(name)
            nodes[name] = {"name": name, "type": t.group(1) if t else None,
                           "parent": None, "props": props}
    return nodes

def f(props, key, d=0.0):
    v = props.get(key)
    if v is None: return d
    try: return float(v)
    except ValueError: return d

def main():
    args = [a for a in sys.argv[1:] if a != "--summary"]
    summary = "--summary" in sys.argv
    scene = args[0]
    W = float(args[1]) if len(args) > 1 else 800.0
    H = float(args[2]) if len(args) > 2 else 600.0
    nodes = parse_tscn(scene)
    memo = {}
    def rect(path):
        if path in memo: return memo[path]
        n = nodes[path]
        if n["parent"] is None or n["parent"] == "":
            pw, ph = W, H
        else:
            pr = rect(n["parent"])
            pw, ph = pr[2], pr[3]
        a = (f(n["props"],'anchor_left'), f(n["props"],'anchor_top'),
             f(n["props"],'anchor_right'), f(n["props"],'anchor_bottom'))
        o = (f(n["props"],'offset_left'), f(n["props"],'offset_top'),
             f(n["props"],'offset_right'), f(n["props"],'offset_bottom'))
        x = a[0]*pw + o[0]; y = a[1]*ph + o[1]
        w = (a[2]*pw + o[2]) - x; h = (a[3]*ph + o[3]) - y
        memo[path] = (x, y, w, h)
        return memo[path]
    def visible_chain(path):
        p = path
        while p:
            if nodes[p]["props"].get('visible') == 'false': return False
            p = nodes[p]["parent"]
        return True
    def mf(path):
        v = nodes[path]["props"].get('mouse_filter')
        return int(v) if v is not None else 0  # Godot default STOP=0
    report = {"design": [W, H], "visible_controls": [], "center_blockers": [],
              "zero_size_visible": [], "giant": []}
    for path, n in nodes.items():
        if n["type"] not in CONTROL_TYPES: continue
        x, y, w, h = rect(path)
        vis = visible_chain(path)
        entry = {"path": path, "type": n["type"],
                 "rect": [round(x),round(y),round(w),round(h)],
                 "visible": vis, "mouse_filter": mf(path)}
        if vis:
            report["visible_controls"].append(entry)
            if w <= 1 or h <= 1: report["zero_size_visible"].append(entry)
            if w > W*1.05 and h > H*1.05: report["giant"].append(entry)
            if x <= W/2 <= x+w and y <= H/2 <= y+h and mf(path) == 0:
                report["center_blockers"].append(entry)
    report["visible_controls"].sort(key=lambda e: -(e["rect"][2]*e["rect"][3]))
    if summary:
        orph_vis = sum(1 for e in report["visible_controls"]
                       if e["path"].startswith("OrphanRoot") and "/" not in e["path"])
        print("UI_AUDIT giant=%d blockers=%d orphans_visible=%d zero_size=%d"
              % (len(report["giant"]), len(report["center_blockers"]), orph_vis,
                 len(report["zero_size_visible"])))
        # Gate: giant or orphan containers visible = broken layout
        sys.exit(1 if (report["giant"] or orph_vis) else 0)
    out = json.dumps(report, indent=1)
    print(out[:9000])

if __name__ == "__main__":
    main()
