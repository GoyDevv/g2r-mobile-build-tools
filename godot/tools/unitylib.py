"""Shared helpers for parsing Unity 2018.4 YAML assets and emitting Godot 4 text resources."""
import os, re, sys, json, math

UNITY_SRC = "/sdcard/Download/Granny - Source/Assets"
# Workspace godot project (outside the Unity tree). Overridable via env.
PROJ = os.environ.get("GODOT_PROJ", "/home/migration/granny-godot")
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

HEADER_RE = re.compile(r"^--- !u!(\d+) &(\d+)", re.M)

def load_unity_docs(path):
    """Parse a Unity YAML file into a list of dicts: {cls, anchor, data}."""
    import yaml
    docs = []
    with open(path, "r", errors="ignore") as f:
        content = f.read()
    content = content.replace("\r\n", "\n").replace("\r", "\n")
    marks = list(HEADER_RE.finditer(content))
    for i, m in enumerate(marks):
        cls = int(m.group(1))
        anchor = int(m.group(2))
        end = marks[i + 1].start() if i + 1 < len(marks) else len(content)
        body = content[m.end():end]
        try:
            loader = yaml.CSafeLoader if hasattr(yaml, "CSafeLoader") else yaml.SafeLoader
            data = yaml.load(body, Loader=loader) or {}
        except Exception as e:
            data = {}
            print(f"  [warn] yaml parse fail {path} doc {anchor}: {e}")
        cls_name = None
        if isinstance(data, dict) and len(data) == 1:
            # Unity YAML wraps content in a single key named after the class
            cls_name = next(iter(data.keys()))
            inner = data[cls_name]
            if isinstance(inner, dict):
                data = inner
        docs.append({"cls": cls, "anchor": anchor, "cls_name": cls_name, "data": data})
    return docs

def unescape_unity(s):
    if not isinstance(s, str):
        return s
    def repl(m):
        try:
            return chr(int(m.group(1), 16))
        except Exception:
            return m.group(0)
    return re.sub(r"\\x([0-9a-fA-F]{2})", repl, s)

def vec3(d):
    if not d:
        return (0.0, 0.0, 0.0)
    return (float(d.get("x", 0.0)), float(d.get("y", 0.0)), float(d.get("z", 0.0)))

def vec4(d):
    """Parse Unity quaternion/color: keys x,y,z,w OR r,g,b,a."""
    if not d:
        return (0.0, 0.0, 0.0, 1.0)
    if "r" in d and "g" in d:
        return (float(d.get("r", 0.0)), float(d.get("g", 0.0)), float(d.get("b", 0.0)), float(d.get("a", 1.0)))
    return (float(d.get("x", 0.0)), float(d.get("y", 0.0)), float(d.get("z", 0.0)), float(d.get("w", 1.0)))

def fmt_float(x):
    if x is None:
        return "0.0"
    x = float(x)
    if abs(x) < 1e-14:
        return "0.0"
    return f"{x:.10g}"

def fmt_vec3(v):
    return f"Vector3({fmt_float(v[0])}, {fmt_float(v[1])}, {fmt_float(v[2])})"

def fmt_vec2(v):
    return f"Vector2({fmt_float(v[0])}, {fmt_float(v[1])})"

def fmt_color(c, alpha=True):
    s = f"Color({fmt_float(c[0])}, {fmt_float(c[1])}, {fmt_float(c[2])}"
    if alpha:
        s += f", {fmt_float(c[3])}"
    return s + ")"

def guid_of_meta(meta_path):
    try:
        with open(meta_path, "r", errors="ignore") as f:
            for line in f:
                m = re.match(r"\s*guid:\s*([0-9a-f]{32})", line)
                if m:
                    return m.group(1)
    except Exception:
        pass
    return None

def ensure_dir(p):
    os.makedirs(p, exist_ok=True)
