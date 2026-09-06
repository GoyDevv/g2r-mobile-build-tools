extends Button
## Port of Unity `BackToMenu.cs`: pressed from the in-game pause/exit UI,
## persists the sensitivity slider value and returns to the Menu scene.
## (saveSensitivityData/backgroundSound/FetchAds are sub-controllers; calls are
## guarded until those scripts are ported.)

var button_clicked := false

func _ready() -> void:
	if not pressed.is_connected(task_on_click):
		pressed.connect(task_on_click)

func task_on_click() -> void:
	if button_clicked:
		return
	button_clicked = true
	var saved := _find("saveSensitivity")
	if saved != null and saved.has_method("get_slider_value"):
		GameState.set_int("slideData", int(saved.call("get_slider_value")))
	var sound_holder := _find("SoundHolder")
	if sound_holder != null and sound_holder.has_method("button_click"):
		sound_holder.call("button_click")
	GameState.set_int("teddyInPlace", 0)
	GameState.save_data()
	GameState.goto_scene("res://converted/scenes/Menu.tscn")

func _find(name: String) -> Node:
	if name.is_empty():
		return null
	var root := get_tree().current_scene if is_inside_tree() else null
	if root == null:
		return null
	return root.find_child(name, true, false)
