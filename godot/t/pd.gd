extends SceneTree
func _initialize() -> void:
	for p in ["res://t/p1.tscn", "res://t/p2.tscn"]:
		var ps: PackedScene = load(p)
		var inst: Node = ps.instantiate()
		root.add_child(inst)
		var names: Array = []
		for c in inst.get_children():
			names.append(c.name)
		print(p, " -> ", names)
		inst.queue_free()
	quit(0)
