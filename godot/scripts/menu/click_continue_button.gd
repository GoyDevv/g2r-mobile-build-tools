extends Button
## Port of Unity `ClickContinueButton.cs` + `ClickContinueButton2.cs` (both
## wired to the same ContinueButton in the original scene). On press: show the
## loading screen, hide the menu panels, play the click sound and load the game.

var _pressed_once := false

func _ready() -> void:
	if not pressed.is_connected(task_on_click):
		pressed.connect(task_on_click)

func task_on_click() -> void:
	if _pressed_once:
		return
	_pressed_once = true
	_vis("LoadindScreen", true)      # ClickContinueButton.LoadingScreen
	_vis("TextScreen", false)        # ClickContinueButton.button
	_vis("OptionMenuParent", false)  # ClickContinueButton2.allButtons
	_vis("MenuOptionBackground", false)  # ClickContinueButton2.optionBackground
	_vis("MenuButtons", false)       # ClickContinueButton2.allButtons (menu root)
	var ljud := _find("Main_Camera")
	if ljud != null and ljud.has_method("click_button"):
		ljud.call("click_button")
	GameState.goto_scene("res://converted/scenes/Scene.tscn")

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