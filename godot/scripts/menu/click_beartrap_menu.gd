extends Button
## Port of Unity `clickBeartrapMenu.cs`: menu button that closes the open
## bear-trap visual and plays its sound.

var beartrap_ok := false

func _ready() -> void:
	if not pressed.is_connected(task_on_click):
		pressed.connect(task_on_click)

func task_on_click() -> void:
	if beartrap_ok:
		return
	beartrap_ok = true
	_vis("BeartrapClosed", true)
	_vis("BeartrapOpen", false)
	var sh := _find("Main_Camera")
	if sh != null and sh.has_method("beartrap"):
		sh.call("beartrap")

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
