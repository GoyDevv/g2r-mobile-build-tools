extends SceneTree
func _initialize() -> void:
	var ps: PackedScene = load("res://t/p2.tscn")
	var inst: Node = ps.instantiate()
	root.add_child(inst)
	var kid: Node = inst.get_node_or_null("Kid")
	print("Kid present: ", kid != null)
	if kid != null:
		var gnames: Array = []
		for c in kid.get_children():
			gnames.append(c.name)
		print("Kid kids: ", gnames)
	quit(0)
