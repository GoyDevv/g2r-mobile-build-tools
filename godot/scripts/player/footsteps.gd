extends Node3D
## Port of Footsteps.cs — the player controller sets is_walking /
## walk_grus / walk_water each frame; this script steps sounds accordingly.

@export var step_interval := 0.55
@export var min_interval := 0.3

var is_walking := false:
	set(v):
		is_walking = v
		if v and not _playing:
			_start()
		elif not v:
			_stop()
var walk_grus := false
var walk_water := false

var _playing := false
var _timer := 0.0
var _step := 0
var _pool: Array[AudioStreamPlayer3D] = []
var _base_pitch := 1.0

func _ready() -> void:
	for ch in get_children():
		if ch is AudioStreamPlayer3D:
			_pool.append(ch)
	if _pool.is_empty():
		# create a hidden player pool so the script works even without scene wiring
		for i in 3:
			var p := AudioStreamPlayer3D.new()
			add_child(p)
			_pool.append(p)
	_base_pitch = _pool[0].pitch_scale if _pool.size() > 0 else 1.0

func _start() -> void:
	_playing = true
	_timer = 0.0

func _stop() -> void:
	_playing = false

func _process(delta: float) -> void:
	if not _playing:
		return
	_timer -= delta
	if _timer <= 0.0:
		_timer = step_interval
		_play_step()

func _play_step() -> void:
	if _pool.is_empty():
		return
	var p := _pool[_step % _pool.size()]
	_step += 1
	p.pitch_scale = _base_pitch * randf_range(0.92, 1.08)
	p.play()

func set_walk_surface(grus: bool, water: bool) -> void:
	walk_grus = grus
	walk_water = water