extends SceneTree
func _initialize() -> void:
	var ps: PackedScene = load("res://converted/scenes/Scene.tscn")
	var inst := ps.instantiate()
	root.add_child(inst)
	var found: Array = []
	for n in inst.find_children("GrannyParent", "", true, false):
		found.append(n.name)
	print("FOUND ", found.size(), " : ", found)
	quit(0)
