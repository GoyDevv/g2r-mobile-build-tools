extends Button
## Port of Unity `ClickPlayButton.cs`: main-menu PLAY toggles the background /
## option panels and plays the click sound.

var _pressed_once := false

func _ready() -> void:
	if not pressed.is_connected(task_on_click):
		pressed.connect(task_on_click)

func task_on_click() -> void:
	if _pressed_once:
		return
	_pressed_once = true
	_vis("Menubackground", false)
	_vis("optionbackground", true)
	_vis("allButtons", false)
	_vis("OptionButtons", true)
	_vis("iapButton", false)
	var ljud := _find("ljudHolder")
	if ljud != null and ljud.has_method("click_button"):
		ljud.call("click_button")

func _vis(name: String, v: bool) -> void:
	var n := _find(name)
	if n != null:
		n.visible = v

func _find(name: String) -> Node:
	if name.is_empty():
		return null
	var root := get_tree().current_scene if is_inside_tree() else null
	if root == null:
		return null
	return root.find_child(name, true, false)
