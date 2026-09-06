extends SceneTree
## Load-test every converted .tres animation + material resource headless.

func _initialize() -> void:
	call_deferred("_run")

func _run() -> void:
	var dir := DirAccess.open("res://converted/animations")
	if dir != null:
		dir.list_dir_begin()
		var fn := dir.get_next()
		while fn != "":
			if fn.ends_with(".tres"):
				var r: Resource = load("res://converted/animations/" + fn)
				if r == null:
					print("BAD ", fn)
				else:
					var a := r as Animation
					if a == null:
						print("BADTYPE ", fn)
			fn = dir.get_next()
		dir.list_dir_end()
	print("ANIMS_OK")
	quit(0)