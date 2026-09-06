extends SceneTree
func _initialize() -> void:
	var ps: PackedScene = load("res://converted/scenes/Scene.tscn")
	var inst: Node = ps.instantiate()
	root.add_child(inst)
	print("ROOT ", inst.name, " direct kids=", inst.get_child_count())
	var ai: Node = inst.find_child("GrannyParent", true, false)
	print("AI found: ", ai != null)
	if ai != null:
		print("AI script: ", ai.get_script().resource_path if ai.get_script() else "none")
	var p: Node = inst.find_child("Player", true, false)
	print("Player: ", p != null, " script=", (p.get_script().resource_path if p and p.get_script() else "none"))
	var g6: Node = inst.find_child("GrannyTest6_1", true, false)
	print("GrannyTest6_1: ", g6 != null, " kids=", (g6.get_child_count() if g6 else -1))
	quit(0)
