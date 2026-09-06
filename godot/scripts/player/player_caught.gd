extends Node3D
## Port of playerCaught.cs — driven by EnemyAIGranny (granny_take_player,
## start_fov) and by the player controller (falling_dead).

signal player_caught_triggered

@export var catch_fov := 70.0
@export var normal_fov := 60.0
@export var fov_speed := 8.0

var start_fov := false:
	set(v):
		start_fov = v
		if v and not _fov_active:
			_fov_active = true
var granny_take_player := false:
	set(v):
		granny_take_player = v
		if v:
			_on_caught()
var player_dead := false

var _fov_active := false
var _camera: Camera3D

func _ready() -> void:
	_camera = _find_camera()

func _find_camera() -> Camera3D:
	# look for the main viewport camera (the FPS camera under the player rig)
	for c in get_tree().get_nodes_in_group("unity_main_camera"):
		return c as Camera3D
	return null

func _process(delta: float) -> void:
	if _fov_active and _camera:
		var target := catch_fov if start_fov else normal_fov
		_camera.fov = lerpf(_camera.fov, target, fov_speed * delta)
		if absf(_camera.fov - target) < 0.5:
			_fov_active = false

func _on_caught() -> void:
	emit_signal("player_caught_triggered")

## Replaces the fallingDead coroutine: triggered by the player controller when
## a long fall ends; drives the death flow via playerDead.
func falling_dead() -> void:
	if player_dead:
		return
	player_dead = true
	var dead: Node = get_tree().get_first_node_in_group("unity_player_dead")
	if dead and dead.has_method("trigger_death"):
		dead.call("trigger_death")