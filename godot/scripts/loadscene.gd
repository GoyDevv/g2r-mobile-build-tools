extends SceneTree
func _initialize() -> void:
	var ps: PackedScene = load("res://converted/scenes/Scene.tscn")
	print("RESULT ", ps != null)
	quit(0)
