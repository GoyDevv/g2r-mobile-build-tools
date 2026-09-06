extends SceneTree
func _init() -> void:
	var args := OS.get_cmdline_user_args()
	var p := "res://scripts/bisect/b1.tscn"
	if args.size() > 0:
		p = "res://scripts/" + args[0]
	var r: Resource = load(p)
	print("LOAD " + ("OK" if r != null else "NULL") + ": " + p)
	quit(0)
