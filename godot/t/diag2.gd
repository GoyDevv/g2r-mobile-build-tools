extends SceneTree
func _initialize() -> void:
	var ps: PackedScene = load("res://converted/scenes/Menu.tscn")
	var inst: Node = ps.instantiate()
	root.add_child(inst)
	var names: Array = []
	for c in inst.get_children():
		names.append(c.name)
	print("CHILDREN ", names)
	var fc: Node = inst.find_child("GameController", true, false)
	print("find GC: ", fc != null)
	quit(0)
