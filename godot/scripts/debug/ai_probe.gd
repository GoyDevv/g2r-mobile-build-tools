extends Node
## Temporary debug hook: after the scene starts, enable Granny's AI and print
## the refs it resolved in _bind_refs(). Run via: godot converted/scenes/Scene.tscn
## with this registered as an autoload (added/removed around validation runs).

func _process(_delta: float) -> void:
	var tree := get_tree()
	if tree == null or tree.current_scene == null:
		return
	var ai: Node = tree.current_scene.find_child("GrannyParent", true, false)
	if ai == null or not ai.has_method("enable_ai"):
		return
	ai.call("enable_ai")
	print("AI_PROBE enabled, physics=", ai.is_physics_processing())
	for ref in ["granny_eye", "granny_lock", "animation_holder", "door_ray",
			"check_ground", "game_controller", "player", "player_pos", "nav_agent",
			"all_bed_buttons", "option_button", "granny_hunt_music_holder",
			"granny_eye_color", "bastu_door", "bear_trap_sp", "bedtarget1",
			"player_caught", "animation_holder_ap"]:
		var v: Variant = ai.get(ref)
		var label := "null"
		if v != null:
			label = str(v.name) if v is Node else str(v)
		print("AI_REF ", ref, " -> ", label)
	print("AI_PROBE _ap=", (ai.get("_ap") != null))
	await tree.create_timer(2.0).timeout
	var pos: Vector3 = ai.global_position
	print("AI_PROBE alive pos=", pos)
	print("AI_DONE")
	get_tree().quit(0)