extends Node
## Port of the Unity joystick (CNJoystick) used by the original FPS controller.
## Provides the surface consumed by fps_controller_new.gd:
##   position_vec: Vector2 (-1..1), tap_count: int, is_finger_down(): bool
## In Godot this is an input-helper node (no visual): Unity's on-screen joystick
## is replaced by a touch area the same size as the screen (see migration log —
## UI conversion is limited, so the joystick has no sprite).
## Falls back to WASD/arrows when no touch input is present (desktop/testing).

signal joystick_moved(value: Vector2)

@export var touch_radius := 80.0

var position_vec := Vector2.ZERO
var tap_count := 0
var _finger := -1
var _base_pos := Vector2.ZERO
var _was_down := false
var _tap_timer := 0.0

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta: float) -> void:
	_tap_timer = maxf(_tap_timer - delta, 0.0)
	# keyboard fallback (desktop / headless testing)
	var kb := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	if kb != Vector2.ZERO:
		position_vec = kb
		emit_signal("joystick_moved", position_vec)
		return
	if _finger == -1:
		position_vec = Vector2.ZERO

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var t := event as InputEventScreenTouch
		if t.pressed and _finger == -1:
			_finger = t.index
			_base_pos = t.position
			_update(t.position)
			if _tap_timer > 0.0:
				tap_count += 1
			else:
				tap_count = 1
			_tap_timer = 0.4
		elif not t.pressed and t.index == _finger:
			_finger = -1
			position_vec = Vector2.ZERO
			emit_signal("joystick_moved", position_vec)
	elif event is InputEventScreenDrag:
		var d := event as InputEventScreenDrag
		if d.index == _finger:
			_update(d.position)

func _update(world_pos: Vector2) -> void:
	var v := world_pos - _base_pos
	position_vec = v / touch_radius
	position_vec = position_vec.limit_length(1.0)
	emit_signal("joystick_moved", position_vec)

func is_finger_down() -> bool:
	return _finger != -1 or Input.get_vector("move_left", "move_right", "move_forward", "move_back") != Vector2.ZERO

func disable() -> void:
	set_process(false)