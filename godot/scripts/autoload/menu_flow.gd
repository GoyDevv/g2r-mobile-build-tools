extends Node
## MenuFlow autoload — hand-port of Unity's Menu-scene boot/consent flow:
##   StartTheApp.Start()        -> pick GDPR panel vs main menu by consent
##   CheckingGDPR(.option).cs   -> Accept/Decline hide GDPR, show menu, persist
##
## The converted Menu scene stores Unity's *saved* visibility (GDPR hidden,
## menu visible). This autoload re-applies the correct pair every time the
## Menu scene loads, so a fresh install (no consent yet) gets the GDPR panel
## first, exactly like the original game. Also handles the two seconds the
## loading screen needs to exist before the menu is interactive.

const GDPR := "GDPRmenu"
const MENU_BUTTONS := "MenuButtons"
const MENU_BG := "MenuBackground"

func _ready() -> void:
	# Deferred: the scene tree must be fully loaded before we re-label panels.
	if not get_tree().node_added.is_connected(_on_node_added):
		get_tree().node_added.connect(_on_node_added)

func _on_node_added(n: Node) -> void:
	if n.scene_file_path == "res://converted/scenes/Menu.tscn" and n is Control == false:
		# Scene root itself; wait one frame so all children exist.
		if not n.tree_entered.is_connected(_apply_menu_state):
			n.tree_entered.connect(_apply_menu_state, CONNECT_ONE_SHOT)

func _apply_menu_state() -> void:
	await get_tree().process_frame
	var root := get_tree().current_scene
	if root == null or not root.scene_file_path.ends_with("Menu.tscn"):
		return
	var consented := GameState.get_int("GDPRoption", 0) == 1
	_show(GDPR, not consented)
	_show(MENU_BUTTONS, consented)
	_show(MENU_BG, consented)

func accept_gdpr_button() -> void:
	GameState.set_int("GDPRoption", 1)
	GameState.save_data()
	_finish_gdpr()

func reject_gdpr_button() -> void:
	# Original records either choice identically (see CheckingGDPR.cs).
	GameState.set_int("GDPRoption", 1)
	GameState.save_data()
	_finish_gdpr()

func _finish_gdpr() -> void:
	_show(GDPR, false)
	_show(MENU_BUTTONS, true)
	_show(MENU_BG, true)

func _show(name: String, v: bool) -> void:
	var n := _find(name)
	if n != null:
		n.visible = v

func _find(name: String) -> Node:
	var root := get_tree().current_scene if is_inside_tree() else null
	if root == null:
		return null
	return root.find_child(name, true, false)
