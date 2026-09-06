#!/usr/bin/env python3
"""cs2gd.py - best-effort Unity C# -> Godot 4 GDScript converter (heuristic).

Public-tool style migration assist: converts the mechanical parts of Unity C#
scripts (MonoBehaviour lifecycle, common API calls, braces->indentation) and
leaves clear TODO markers for everything that needs human review.

Usage: python3 cs2gd.py <input.cs> [<output.gd>]
Exit code is always 0 unless the input file is missing (best-effort by design).
"""
import re
import sys


def convert_type(t: str) -> str:
    t = t.strip()
    return {
        "void": "", "string": "String", "bool": "bool", "int": "int",
        "float": "float", "double": "float", "GameObject": "Node3D",
        "Transform": "Node3D", "Vector3": "Vector3", "IEnumerator": "",
    }.get(t, "Variant")


def convert_lines(src: str) -> str:
    out: list[str] = []
    depth = 0
    for raw in src.splitlines():
        line = raw.rstrip()
        stripped = line.strip()

        # strip using/namespace noise
        if re.match(r"^(using\s|namespace\s)", stripped) or stripped in ("{", "}", ");"):
            if stripped == "}" and depth == 0:
                continue
            if re.match(r"^using\s", stripped):
                continue
        # attributes
        if stripped.startswith("["):
            continue

        # closing brace -> dedent
        if stripped.startswith("}"):
            depth = max(0, depth - 1)
            rest = stripped[1:].strip()
            if rest.startswith("else"):
                rest = rest.replace("else if", "elif").replace("else", "else:")
                out.append("  " * depth + rest)
            continue

        # else / elif on their own line
        m = re.match(r"^(else if\s*\(.*\))\s*\{?\s*$", stripped)
        if m:
            cond = re.sub(r"&&", " and ", re.sub(r"\|\|", " or ", m.group(1)[8:-1]))
            out.append("  " * depth + f"elif {cond}:")
            if stripped.endswith("{"):
                depth += 1
            continue
        m = re.match(r"^else\s*\{?\s*$", stripped)
        if m:
            out.append("  " * depth + "else:")
            if stripped.endswith("{"):
                depth += 1
            continue

        body = stripped

        # method declarations -> func
        m = re.match(
            r"^(?:public|private|protected|internal)?\s*(?:static\s+)?"
            r"(?:override\s+)?(void|bool|int|float|string|double|IEnumerator|Task|"
            r"[A-Z][A-Za-z0-9_]*)\s+([A-Za-z_][A-Za-z0-9_]*)\s*\((.*)\)\s*\{?\s*$", body)
        if m:
            ret, name, args = m.groups()
            name = {"Start": "_ready", "Update": "_process",
                    "Awake": "_init", "OnEnable": "_enter_tree",
                    "OnDisable": "_exit_tree", "FixedUpdate": "_physics_process"}.get(name, name)
            if name == "_process":
                args = "_delta"
            elif name == "_physics_process":
                args = "_delta"
            else:
                args = ", ".join(
                    f"{a.split()[-1].lstrip('_')}: {convert_type(' '.join(a.split()[:-1]))}"
                    for a in filter(None, (x.strip() for x in args.split(",")))
                ) if args.strip() else ""
            out.append("  " * depth + f"func {name}({args}):")
            if body.endswith("{"):
                depth += 1
            elif not body.endswith(";"):
                out.append("  " * (depth + 1) + "pass  # TODO: empty body")
            continue

        # class declaration
        m = re.match(r"^(?:public|private|protected|internal)?\s*(?:static\s+)?"
                     r"(?:abstract\s+|sealed\s+)*class\s+([A-Za-z0-9_]+)"
                     r"(?:\s*:\s*([A-Za-z0-9_,\s<>]+))?\s*\{?\s*$", body)
        if m:
            cname, base = m.groups()
            out.append("  " * depth + f"class_name {cname}")
            base = (base or "").split(",")[0].strip()
            if base in ("MonoBehaviour", ""):
                out.append("  " * depth + "extends Node  # TODO: was MonoBehaviour")
            else:
                out.append("  " * depth + f"extends Node  # TODO: base was {base}")
            if body.endswith("{"):
                depth += 1
            continue

        # fields
        m = re.match(r"^(?:public|private|protected|internal)?\s*(?:static\s+)?"
                     r"(?:readonly\s+)?([A-Za-z0-9_<>]+)\s+([A-Za-z_][A-Za-z0-9_]*)"
                     r"\s*(?:=\s*(.+?))?;?$", body)
        if m and not body.startswith(("if", "for", "while", "switch", "return", "print")):
            typ, name, val = m.groups()
            if val:
                val = re.sub(r"(\d+)f\b", r"\1.0", val)
                val = val.replace("new Vector3", "Vector3").replace("new Color", "Color")
                out.append("  " * depth + f"var {name} := {val}")
            else:
                out.append("  " * depth + f"var {name}: {convert_type(typ)}")
            continue

        # control flow
        m = re.match(r"^if\s*\((.*)\)\s*\{?\s*$", body)
        if m:
            cond = m.group(1)
            cond = re.sub(r"&&", " and ", cond)
            cond = re.sub(r"\|\|", " or ", cond)
            cond = re.sub(r"!(?=[A-Za-z_(])", "not ", cond)
            cond = re.sub(r"\bthis\.", "", cond)
            out.append("  " * depth + f"if {cond}:")
            if body.endswith("{"):
                depth += 1
            continue
        m = re.match(r"^foreach\s*\(\s*(?:var|[A-Za-z0-9_<>]+)\s+([A-Za-z0-9_]+)\s+in\s+(.*)\)\s*\{?\s*$", body)
        if m:
            out.append("  " * depth + f"for {m.group(1)} in {m.group(2)}:")
            if body.endswith("{"):
                depth += 1
            continue
        m = re.match(r"^for\s*\(\s*(?:int|var)?\s*([A-Za-z0-9_]+)\s*=\s*0\s*;\s*"
                     r"\1\s*<\s*([^;]+?)\s*;\s*\1\s*\+\+\s*\)\s*\{?\s*$", body)
        if m:
            out.append("  " * depth + f"for {m.group(1)} in range(int({m.group(2)})):")
            if body.endswith("{"):
                depth += 1
            continue
        if re.match(r"^while\s*\(", body):
            body = re.sub(r"^while\s*\((.*)\)\s*\{?\s*$", r"while \1:", body)
            body = re.sub(r"&&", " and ", body)
            body = re.sub(r"\|\|", " or ", body)
            out.append("  " * depth + body)
            if stripped.endswith("{"):
                depth += 1
            continue

        # statements
        s = body
        s = re.sub(r"Debug\.Log(?:Warning|Error)?\s*\(", "print(", s)
        s = re.sub(r"\bthis\.", "", s)
        s = re.sub(r"\bgameObject\b", "self", s)
        s = re.sub(r"\btransform\.position\b", "position", s)
        s = re.sub(r"\btransform\.rotation\b", "quaternion  # TODO: Unity->Godot rotation", s)
        s = re.sub(r"\btransform\.localScale\b", "scale", s)
        s = re.sub(r"\btransform\b", "self  # TODO: was transform", s)
        s = re.sub(r"GetComponent<\s*([A-Za-z0-9_]+)\s*>\s*\(\)",
                   r"get_node(\"TODO_\1\")  # TODO: GetComponent", s)
        s = re.sub(r"FindObjectOfType<\s*([A-Za-z0-9_]+)\s*>\s*\(\)",
                   r"null  # TODO: FindObjectOfType<\1>", s)
        s = re.sub(r"Instantiate\s*\(", "instantiate  # TODO: Instantiate(", s)
        s = re.sub(r"Destroy\s*\(", "queue_free  # TODO: Destroy(", s)
        s = re.sub(r"DontDestroyOnLoad\s*\(", "pass  # TODO: DontDestroyOnLoad(", s)
        s = re.sub(r"new Vector3\(", "Vector3(", s)
        s = re.sub(r"(\d+)f\b", r"\1.0", s)
        s = re.sub(r"&&", " and ", s)
        s = re.sub(r"\|\|", " or ", s)
        s = re.sub(r"!(?=[A-Za-z_(])", "not ", s)
        s = s.replace(";", "")
        if s.strip():
            out.append("  " * depth + s)
        elif not stripped:
            out.append("")

    return "\n".join(out) + "\n"


def main() -> int:
    if len(sys.argv) < 2:
        print("usage: cs2gd.py <input.cs> [output.gd]")
        return 1
    src_path = sys.argv[1]
    try:
        src = open(src_path, encoding="utf-8-sig", errors="replace").read()
    except OSError as e:
        print(f"cs2gd: cannot read {src_path}: {e}")
        return 1
    out_path = sys.argv[2] if len(sys.argv) > 2 else re.sub(r"\.cs$", "", src_path) + ".gd"
    gd = (f"# Auto-converted from {src_path} by cs2gd.py (best-effort).\n"
          f"# Review every TODO before relying on this script.\n\n") + convert_lines(src)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(gd)
    todos = gd.count("TODO")
    print(f"cs2gd: {src_path} -> {out_path} ({todos} TODO markers)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
