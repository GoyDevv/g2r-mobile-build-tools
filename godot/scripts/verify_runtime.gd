extends SceneTree
## Headless runtime verification: instantiate each converted scene, report
## script attachment, then smoke-test the Granny AI (enable it, step physics).

func _initialize() -> void:
	call_deferred("_run")

func _run() -> void:
	for path in [
		"res://converted/scenes/Menu.tscn",
		"res://converted/scenes/SplashScreen.tscn",
		"res://converted/scenes/Scene.tscn",
		"res://converted/scenes/EndScene.tscn",
	]:
		var ps: PackedScene = load(path)
		if ps == null:
			print("LOAD_FAIL ", path)
			continue
		var inst := ps.instantiate()
		if inst == null:
			print("INSTANTIATE_FAIL ", path)
			continue
		root.add_child(inst)
		print("OK ", path, " nodes=", inst.get_child_count())
		if path.ends_with("Scene.tscn"):
			_test_scene(inst)
		inst.queue_free()
	print("DONE")
	quit(0)

func _test_scene(scene: Node) -> void:
	var ai := scene.find_child("GrannyParent", true, false)
	if ai == null:
		print("AI_MISSING GrannyParent")
		return
	var script: Script = ai.get_script()
	if script == null:
		print("AI_NO_SCRIPT")
		return
	print("AI_SCRIPT ", script.resource_path)
	if not ai.has_method("enable_ai"):
		print("AI_NO_METHOD enable_ai")
		return
	ai.call("enable_ai")
	print("AI_ENABLED physics=", ai.is_physics_processing())
	# step several physics frames through the AI update
	for i in range(20):
		await physics_frame
	print("AI_ALIVE after 20 frames")
	var player: Node = scene.find_child("Player", true, false)
	if player != null:
		print("PLAYER_SCRIPT ", player.get_script().resource_path if player.get_script() else "none")
		print("PLAYER_TYPE ", player.get_class())
	var gs: Node = root.get_node_or_null("/root/GameState")
	print("GAMESTATE ", gs != null)
	# check the AI's resolved refs (via the ported script internals)
	for ref in ["granny_eye", "animation_holder", "door_ray", "check_ground",
			"game_controller", "player_pos", "nav_agent", "bear_trap_sp"]:
		var v: Variant = ai.get(ref)
		print("REF ", ref, " -> ", v if v != null else "null")