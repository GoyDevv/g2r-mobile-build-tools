extends Node
## Temporary debug hook: introspects the converted UI and simulates a press on
## the PickUp prompt button. Registered as autoload around validation runs only.

func _ready() -> void:
	await get_tree().process_frame
	var scene := get_tree().current_scene
	if scene == null:
		return
	var buttons := 0
	var textures := 0
	var colors := 0
	for c in scene.find_children("*", "", true, false):
		if c is Button:
			buttons += 1
		elif c is TextureRect:
			textures += 1
		elif c is ColorRect:
			colors += 1
	print("UI_PROBE counts: Button=", buttons, " TextureRect=", textures, " ColorRect=", colors)

	var pickup_btn := scene.find_child("PickUpButton", true, false) as Button
	print("UI_PROBE PickUpButton = ", pickup_btn)
	if pickup_btn != null:
		print("UI_PROBE PickUpButton script=", pickup_btn.get_script().resource_path if pickup_btn.get_script() else "none")
		print("UI_PROBE PickUpButton anchors/offsets: L", pickup_btn.offset_left, " T", pickup_btn.offset_top,
				" R", pickup_btn.offset_right, " B", pickup_btn.offset_bottom)
	var mitten := scene.find_child("MittenRing", true, false)
	print("UI_PROBE MittenRing = ", mitten)
	var drop_btn := scene.find_child("DropObjectButton", true, false)
	print("UI_PROBE DropObjectButton = ", drop_btn)
	var pickup := scene.find_child("PickUp", true, false)
	print("UI_PROBE PickUp node = ", pickup, " has set_pick_up: ", pickup != null and pickup.has_method("set_pick_up"))
	if pickup_btn != null and pickup != null:
		pickup_btn.pressed.emit()
		print("UI_PROBE after press: pick_up = ", pickup.get("pick_up"))
	await get_tree().process_frame
	print("UI_DONE")
	get_tree().quit(0)
