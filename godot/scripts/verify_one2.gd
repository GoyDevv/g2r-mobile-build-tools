extends SceneTree
func _init() -> void:
	var args := OS.get_cmdline_user_args()
	var p := "res://converted/scenes/EndScene.tscn"
	if args.size() > 0:
		p = "res://converted/scenes/" + args[0]
	var r: Resource = load(p)
	if r == null:
		print("LOAD NULL: ", p)
	else:
		print("LOAD OK: ", p)
	quit(0)
