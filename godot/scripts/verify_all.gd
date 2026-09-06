extends SceneTree
func _init() -> void:
	var dir := DirAccess.open("res://converted/scenes")
	var files: Array[String] = []
	if dir:
		for f in dir.get_files():
			if f.ends_with(".tscn"):
				files.append(f)
	files.sort()
	for f in files:
		_check("res://converted/scenes/" + f)
	quit(0)

func _check(p: String) -> void:
	var ps: Resource = load(p)
	if ps == null or not (ps is PackedScene):
		print("LOAD NULL: ", p)
		return
	var root: Node = (ps as PackedScene).instantiate()
	if root == null:
		print("INSTANTIATE NULL: ", p)
		return
	var c := 0
	for n in _walk(root):
		c += 1
	print("LOAD OK nodes=%d: %s" % [c, p])
	root.free()

func _walk(n: Node) -> Array:
	var out: Array = [n]
	for ch in n.get_children():
		out += _walk(ch)
	return out