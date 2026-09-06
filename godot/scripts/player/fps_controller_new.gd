extends CharacterBody3D
## Semantic port of Unity FPSControllerNEW.cs.
## Movement from a virtual joystick (or keyboard fallback), head-bob animation
## speeds, double-tap jump, gravity/in-air multiplier, fall-death hook and
## ground-surface detection feeding Footsteps.

# --- Unity serialized fields (kept with snake_case) ---
@export var forward_speed := 4.0
@export var backward_speed := 1.0
@export var sidestep_speed := 1.0
@export var jump_speed := 8.0
@export var in_air_multiplier := 0.25
@export var rotation_speed := Vector2(50.0, 25.0)
@export var tilt_positive_y_axis := 0.6
@export var tilt_negative_y_axis := 0.4
@export var tilt_x_axis_minimum := 0.1
@export var day2 := false
@export var day3 := false
@export var player_crouch := false
@export var starting_pitch := 4.0

var player_is_grounded := true
var fall_timer_started := false
var time_in_air := 0.0
var can_jump := true
var enabled_movement := true

# --- scene wiring (fallback: resolved by node name at runtime) ---
@export var move_touch_pad_path: NodePath
@export var rotate_touch_pad_path: NodePath
@export var camera_pivot_path: NodePath
@export var head_bob_anim_holder_path: NodePath
@export var footstep_script_holder_path: NodePath
@export var sound_holder_path: NodePath
@export var fallsound_holder_path: NodePath
@export var granny_path: NodePath
@export var player_path: NodePath
@export var check_ground_path: NodePath

var move_touch_pad: Node
var rotate_touch_pad: Node
var camera_pivot: Node3D
var head_bob_anim_holder: Node
var footstep_script_holder: Node
var sound_holder: Node
var fallsound_holder: Node
var granny: Node
var player: Node3D
var check_ground: Node3D

var _velocity := Vector3.ZERO
var _headbob_anim: AnimationPlayer
var _camera: Camera3D

func _ready() -> void:
	_move()
	_spawn_at_player_spawn()
	_bind_refs()
	head_bob_anim_holder = get_node_or_null(head_bob_anim_holder_path) if not head_bob_anim_holder_path.is_empty() else _find("HeadBobHolder")
	if head_bob_anim_holder:
		_headbob_anim = head_bob_anim_holder.get_node_or_null("AnimationPlayer") as AnimationPlayer
		if _headbob_anim == null:
			_headbob_anim = _first_animation_player(head_bob_anim_holder)
	_setup_camera()

func _move() -> void:
	pass

func _spawn_at_player_spawn() -> void:
	var spawn := _find("PlayerSpawn") as Node3D
	if spawn:
		global_position = spawn.global_position

func _bind_refs() -> void:
	camera_pivot = get_node_or_null(camera_pivot_path) as Node3D if not camera_pivot_path.is_empty() else _find("CameraPivot") as Node3D
	if camera_pivot == null:
		camera_pivot = _find("Main Camera") as Node3D
	move_touch_pad = get_node_or_null(move_touch_pad_path) if not move_touch_pad_path.is_empty() else _find("MoveJoystick")
	rotate_touch_pad = get_node_or_null(rotate_touch_pad_path) if not rotate_touch_pad_path.is_empty() else _find("RotateJoystick")
	footstep_script_holder = get_node_or_null(footstep_script_holder_path) if not footstep_script_holder_path.is_empty() else _find("FootstepHolder")
	sound_holder = get_node_or_null(sound_holder_path) if not sound_holder_path.is_empty() else _find("SoundHolder")
	fallsound_holder = get_node_or_null(fallsound_holder_path) if not fallsound_holder_path.is_empty() else _find("FallsoundHolder")
	granny = get_node_or_null(granny_path) if not granny_path.is_empty() else _find("Granny")
	player = get_node_or_null(player_path) as Node3D if not player_path.is_empty() else self
	check_ground = get_node_or_null(check_ground_path) as Node3D if not check_ground_path.is_empty() else _find("CheckGround") as Node3D

func _setup_camera() -> void:
	if camera_pivot:
		_camera = camera_pivot.get_node_or_null("Camera3D") as Camera3D
		if _camera == null:
			_camera = _first_camera(camera_pivot)

func _find(name: String) -> Node:
	if name.is_empty():
		return null
	var r := get_tree().current_scene
	if r == null:
		return null
	return r.find_child(_san(name), true, false)

func _san(name: String) -> String:
	# mirror converter sanitization: spaces (and other invalid chars) became underscores
	return name.replace(" ", "_")

func _first_camera(n: Node) -> Camera3D:
	for c in n.find_children("*", "Camera3D", true, false):
		return c as Camera3D
	return null

func _first_animation_player(n: Node) -> AnimationPlayer:
	for c in n.find_children("*", "AnimationPlayer", true, false):
		return c as AnimationPlayer
	return null

func _physics_process(delta: float) -> void:
	if not enabled_movement:
		return
	# Unity FixedUpdate: rotation locked to world X/Z (no roll/pitch on body)
	var input_vec := _input_vector()
	var dir := _world_move_dir(input_vec)

	# gravity
	if not is_on_floor():
		_velocity.y += ProjectSettings.get_setting("physics/3d/default_gravity", -9.8) * delta

	# jump: double tap on the joystick
	if is_on_floor():
		var j := move_touch_pad
		if j == null:
			j = _find("MoveJoystick")
		if j and not j.call("is_finger_down"):
			can_jump = true
		if can_jump and j and j.get("tap_count") != null and int(j.get("tap_count")) >= 2:
			_velocity.y = jump_speed
			can_jump = false
	else:
		dir.x *= in_air_multiplier
		dir.z *= in_air_multiplier

	# horizontal movement from joystick magnitude
	var flat := Vector3(dir.x, 0.0, dir.z)
	var speed := _speed_for(input_vec)
	velocity = flat * speed + Vector3(0.0, _velocity.y, 0.0)
	move_and_slide()

	# --- ground/fall handling (mirrors the original) ---
	if is_on_floor():
		player_is_grounded = true
		_velocity = Vector3.ZERO
		_call_method(fallsound_holder, "player_falling_not")
		if time_in_air > 0.5:
			time_in_air = 0.0
			fall_timer_started = false
			_call_method(sound_holder, "player_land_sound")
			_set_granny_caught(true)
			fall_death()
			forward_speed = 0.0
			backward_speed = 0.0
			sidestep_speed = 0.0
	else:
		player_is_grounded = false
		if fall_timer_started:
			time_in_air += delta
			_call_method(fallsound_holder, "player_falling")

	# rotation: joystick / accelerometer / mouse look fallback
	_apply_rotation(delta, input_vec)

	# footstep flags
	var moving := velocity.length_squared() > 0.01
	_set_footsteps(moving)

	# head bob speed
	_update_headbob(moving, input_vec)

	# ground surface tags (grus / golv / water) via check_ground raycast
	_update_surface()

func _input_vector() -> Vector2:
	if move_touch_pad and move_touch_pad.get("position_vec") != null:
		return move_touch_pad.get("position_vec")
	return Input.get_vector("move_left", "move_right", "move_forward", "move_back")

func _world_move_dir(v: Vector2) -> Vector3:
	var fwd := -global_transform.basis.z
	var right := global_transform.basis.x
	var d := (fwd * v.y + right * v.x)
	d.y = 0.0
	return d.normalized() if d.length_squared() > 0.0 else d

func _speed_for(v: Vector2) -> float:
	var ax := absf(v.x)
	var ay := absf(v.y)
	if ay > ax:
		if v.y > 0.0:
			return forward_speed * ay
		return backward_speed * ay
	return sidestep_speed * ax

func _apply_rotation(delta: float, v: Vector2) -> void:
	# mouse look when no joystick present (desktop/testing)
	if Input.get_connected_joypads().size() == 0 and move_touch_pad == null:
		var speed := 0.12
		var mv := Input.get_last_mouse_velocity()
		if mv != Vector2.ZERO:
			rotate_y(-mv.x * speed * delta * 60.0)
			if camera_pivot:
				camera_pivot.rotate_x(-mv.y * speed * delta * 60.0)
				var e := camera_pivot.rotation.x
				camera_pivot.rotation.x = clampf(e, -1.5, 1.5)
			return
	var rv := Vector2.ZERO
	if rotate_touch_pad and rotate_touch_pad.get("position_vec") != null:
		rv = rotate_touch_pad.get("position_vec")
	rv *= rotation_speed * delta
	rotate_y(-rv.x)
	if camera_pivot:
		camera_pivot.rotate_x(rv.y)
		var e := camera_pivot.rotation.x
		camera_pivot.rotation.x = clampf(e, -1.5, 1.5)

func _update_headbob(moving: bool, v: Vector2) -> void:
	if _headbob_anim == null:
		return
	var clip := "HeadBobAnimation"
	if day2:
		clip = "HeadBobAnimation2"
	elif day3:
		clip = "HeadBobAnimation3"
	if not moving or not _headbob_anim.has_animation(clip):
		return
	_headbob_anim.play(clip)
	var speed := 0.6
	var ax := absf(v.x)
	var ay := absf(v.y)
	if ay > ax:
		if ay >= 0.8:
			speed = 1.0
		elif ay >= 0.4:
			speed = 0.7 if not player_crouch else 0.6
		else:
			speed = 0.6
	else:
		speed = 0.7 if not player_crouch else 0.6
	_headbob_anim.speed_scale = speed

func _set_footsteps(moving: bool) -> void:
	if footstep_script_holder == null:
		return
	var fs = footstep_script_holder
	if fs.has_method("set_walking"):
		fs.call("set_walking", moving)

func _update_surface() -> void:
	if check_ground == null or footstep_script_holder == null:
		return
	var space := get_world_3d().direct_space_state
	var q := PhysicsRayQueryParameters3D.create(check_ground.global_position, check_ground.global_position + Vector3.DOWN * 5.0)
	var hit := space.intersect_ray(q)
	if hit.is_empty():
		return
	var coll: Node = hit["collider"]
	if coll == null or not coll is Node:
		return
	var tag := _unity_tag(coll)
	var fs = footstep_script_holder
	if tag == "grus":
		if fs.has_method("set_walk_surface"):
			fs.call("set_walk_surface", true, false)
	elif tag == "water":
		if fs.has_method("set_walk_surface"):
			fs.call("set_walk_surface", false, true)
	elif tag == "golv":
		if fs.has_method("set_walk_surface"):
			fs.call("set_walk_surface", false, false)

func _unity_tag(n: Node) -> String:
	if n.has_meta("unity_tag"):
		return n.get_meta("unity_tag")
	return "Untagged"

func _set_granny_caught(v: bool) -> void:
	if granny and granny.has_method("set_player_get_caught"):
		granny.call("set_player_get_caught", v)

func _call_method(node: Node, m: String) -> void:
	if node and node.has_method(m):
		node.call(m)

func fall_death() -> void:
	var caught: Node = _find("playerCaught")
	if caught == null:
		caught = get_tree().get_first_node_in_group("unity_player_caught")
	if caught and caught.has_method("falling_dead"):
		caught.call("falling_dead")

func on_end_game() -> void:
	enabled_movement = false