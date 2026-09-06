extends Node3D
## Port of Unity `splashScreenStart.cs`: timed intro sequence that swaps the
## developer splash sprite twice, then loads the Menu scene.
## (Sprite/Image UI not converted yet -> dvloper visuals are guarded.)

func _ready() -> void:
	_sequence()

func _sequence() -> void:
	await get_tree().create_timer(3.4).timeout
	await get_tree().create_timer(2.0).timeout
	await get_tree().create_timer(0.05).timeout
	await get_tree().create_timer(5.0).timeout
	GameState.goto_scene("res://converted/scenes/Menu.tscn")
