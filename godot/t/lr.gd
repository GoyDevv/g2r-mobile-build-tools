extends SceneTree
func _initialize() -> void:
	var ps: PackedScene = load("res://t/f.tscn")
	print("RESULT ", ps != null)
	quit(0)
