extends Node3D
## Semantic port of Unity `AnimationController.cs` (Standard-Assets-style root-motion
## helper). Runs a legacy Animation set off the CharacterController's velocity:
##   run/runback/runright/runleft for ground movement, run-land/jump-land/jump for
## airborne transitions, idle when still.
##
## Unity -> Godot mapping:
##   Animation (legacy, clips on one GO) -> AnimationPlayer sibling/parent lookup
##   CharacterController.velocity   -> provided by the FPS controller node (its
##                                     CharacterBody3D.velocity), looked up by node
##   WrapMode.Loop / ClampForever   -> loop_mode on the clip
##   animationTarget["clip"].speed  -> per-play speed_scale (Godot 4.x plays at
##                                     AnimationPlayer.speed_scale)
##   IsPlaying / normalizedTime     -> is_playing() / current_animation_position()
##
## The original is a component on the player model GO next to a CharacterController
## and an Animation component. In the converted scene no such combination exists yet
## (the player rig is instanced), so this port attaches to the same node as the FPS
## controller and drives a model AnimationPlayer if one is present. All lookups are
## optional; the script no-ops cleanly when no AnimationPlayer is found.

const CLIPS := ["run", "runback", "runright", "runleft", "idle", "jump", "jump-land", "run-land", "LOSE"]

@export var max_forward_speed := 6.0
@export var max_backward_speed := 3.0
@export var max_sidestep_speed := 4.0
@export var anim_holder_name := "AnimationPlayer"

var _anim: AnimationPlayer
var _body: Node3D
var _jumping := false
var _min_upward_speed := 2

func _ready() -> void:
	# AnimationPlayer either on this node or under it
	_anim = get_node_or_null(anim_holder_name) as AnimationPlayer
	if _anim == null:
		for c in find_children("*", "AnimationPlayer", true, false):
			_anim = c as AnimationPlayer
			break
	# body supplying velocity: ourselves, or the CharacterBody ancestor
	_body = self
	var p := get_parent()
	while p != null and p is Node3D and not (p is CharacterBody3D):
		p = p.get_parent()
	if p is CharacterBody3D:
		_body = p
	if _anim != null:
		for clip in CLIPS:
			if _anim.has_animation(clip):
				if clip in ["jump", "jump-land", "run-land", "LOSE"]:
					_anim.get_animation(clip).loop_mode = Animation.LOOP_NONE

func set_anim_player(ap: AnimationPlayer) -> void:
	_anim = ap

func on_end_game() -> void:
	set_process(false)
	set_physics_process(false)

func _physics_process(_delta: float) -> void:
	if _anim == null:
		return
	var velocity := Vector3.ZERO
	if _body is CharacterBody3D:
		velocity = (_body as CharacterBody3D).velocity
	elif _body.has_method("get_velocity"):
		velocity = _body.call("get_velocity")
	var flat := velocity
	flat.y = 0.0
	var magnitude := flat.length()
	var up_dot: float = _body.global_transform.basis.y.dot(velocity)

	var grounded := true
	if _body is CharacterBody3D:
		grounded = (_body as CharacterBody3D).is_on_floor()

	if not grounded and up_dot > float(_min_upward_speed):
		_jumping = true

	# still finishing a landing? wait until its normalized time >= 1
	if _anim.is_playing() and _anim.current_animation == "run-land" \
			and _anim.current_animation_position < _clip_length("run-land") \
			and magnitude > 0.0:
		return

	if _anim.is_playing() and _anim.current_animation == "jump-land" \
			and _anim.current_animation_position < _clip_length("jump-land"):
		return

	if _anim.is_playing() and _anim.current_animation == "jump-land" \
			and _anim.current_animation_position >= _clip_length("jump-land"):
		_play("idle")
		return

	if _jumping:
		if grounded:
			if magnitude > 0.0:
				_play("run-land")
			else:
				_play("jump-land")
			_jumping = false
		else:
			_play("jump")
		return

	if magnitude > 0.0:
		var fwd_dot := _body.global_transform.basis.z.dot(flat)
		var right_dot := _body.global_transform.basis.x.dot(flat)
		if absf(fwd_dot) > absf(right_dot):
			if fwd_dot > 0.0:
				_set_run_speed("run", magnitude, max_forward_speed)
				_play("run")
			else:
				_set_run_speed("runback", magnitude, max_backward_speed)
				_play("runback")
		else:
			if right_dot > 0.0:
				_set_run_speed("runright", magnitude, max_sidestep_speed)
				_play("runright")
			else:
				_set_run_speed("runleft", magnitude, max_sidestep_speed)
				_play("runleft")
	else:
		_play("idle")

func _set_run_speed(clip: String, magnitude: float, max_speed: float) -> void:
	var t := clampf(absf(magnitude) / max_speed, 0.0, max_speed)
	if _anim != null and _anim.has_animation(clip):
		_anim.get_animation(clip).speed_scale = lerpf(0.25, 1.0, t)

func _clip_length(clip: String) -> float:
	if _anim != null and _anim.has_animation(clip):
		return _anim.get_animation(clip).length
	return 0.0

func _play(clip: String) -> void:
	if _anim == null or not _anim.has_animation(clip):
		return
	if not (_anim.is_playing() and _anim.current_animation == clip):
		_anim.play(clip, 0.1)
