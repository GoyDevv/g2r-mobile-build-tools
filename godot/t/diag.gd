extends SceneTree
func _initialize() -> void:
	var ps: PackedScene = load("res://converted/scenes/Menu.tscn")
	var inst: Node = ps.instantiate()
	root.add_child(inst)
	print("ROOT ", inst.name, " kids=", inst.get_child_count())
	var gc: Node = inst.get_node_or_null("GameController")
	print("GC direct: ", gc != null)
	var sr: Node = inst.get_node_or_null("SceneRoot")
	print("SceneRoot present: ", sr != null)
	if sr != null:
		print("SR kids=", sr.get_child_count())
	quit(0)
