extends Node3D
## Semantic port of Unity `EnemyAIGranny.cs` (2155 lines) — Granny's house AI.
##
## Unity -> Godot mapping used here (see migration log for the full table):
##   NavMeshAgent          -> NavigationAgent3D (child "NavigationAgent3D"; movement
##                            driven manually along get_next_path_position(), which
##                            reproduces agent motion without a CharacterBody).
##                            NOTE: requires a baked NavigationRegion3D (manual step).
##   Time.deltaTime        -> get_physics_process_delta_time() in _physics_process
##   transform.LookAt      -> _face_position() (yaw-only, like the original)
##   Vector3.RotateTowards -> _face_position() clamped to turn_speed * delta
##   Animation.CrossFade   -> AnimationPlayer.play(name, blend, speed)
##   StartCoroutine        -> async funcs with await create_timer()
##   PlayerPrefs.GetInt    -> GameState autoload (get_int)
##   Physics.Raycast       -> direct_space_state.intersect_ray
##   OnTriggerStay/Exit    -> proximity distance check (the trigger sphere is a
##                            StaticBody collider in the conversion; distance check
##                            is equivalent and avoids scene surgery)
##   gameObject.tag        -> metadata/unity_tag + groups (emitted by converter)
##
## Object references from the Unity serialized fields are resolved by node name
## (first inside this subtree, then scene-wide) so the port works against the
## converted scene without manual wiring. The AI component is disabled at scene
## load in the original (m_Enabled: 0); call enable_ai() from the day controller.

# ---------------------------------------------------------------------------
# State (former serialized public fields; Unity defaults, scene overrides set
# in _ready via exported values where the original scene differed).
# ---------------------------------------------------------------------------
@export var off_screen_dot := 0.2          # scene: 0.2
@export var waypoint_start := true
@export var timer_on_off := true
@export var attack_distance := 3.5         # scene: 3.5
@export var turn_speed := 10.0             # scene "speed": 10 rad/s
@export var bastu_timer_max := 15.0        # scene: 15
@export var bastu_door_timer_max := 20.0   # scene: 20
@export var player_caught_last_time := true
@export var blind_timer_max := 30.0

# --- hit/hunt flags ---
var hit_by_arrow := false
var hit_by_gun := false
var hit_by_car := false
var hit_by_pepper := false
var hit_by_pepper_start := false
var freeze := false
var bastu_killed := false
var ragdoll_spawn := false
var see_player := false
var see_player_timer := false
var granny_is_follow := false
var hunt_player := false
var granny_look_under_bed := false
var granny_stand_beside_car := false
var player_get_caught := false
var player_fall_death := false
var player_in_hole := false
var player_hiding := false
var player_hiding_under_bed := false
var player_hiding_in_coffin := false
var player_hiding_in_coffin_backyard := false
var player_hiding_in_car := false
var player_start_car := false
var player_have_teddy := false
var player_in_prison := false
var prison_door_closed := false
var player_near_granny := false
var granny_gonna_smack := false
var granny_hear_player := false
var granny_hear_object := false
var granny_see_door := false
var granny_see_locked_door := false
var stop_see_locked_door := false
var see_stairs := false
var dropping_beartrap := false
var sound_playing := false
var granny_searching := false
var granny_search := false
var granny_moving := false
var attacking_player := false
var start_timer_search := false
var start_walk := false
var stop_walk := false
var reset_safe_timer := false
var granny_eye_color_timer_on := false
var granny_pepper_react := false
var bastu_switch_on := false
var bastu_bom_nere := false
var bastu_time_off := false
var start_bastu_safe_timer := false
var waypoint_wait_time := false
var granny_in_bastu := false
var dont_hit_player := false

# --- timers ---
var timer := 0.0
var timer_see := 0.0
var timer_search := 0.0
var timer_bed := 0.0
var safe_timer := 0.0
var see_closed_door_timer := 0.0
var granny_eye_color_timer := 0.0
var blind_timer := 30.0
var bastu_timer := 15.0
var bastu_door_timer := 20.0
var bastu_safe_timer := 0.0

# --- navigation / movement ---
var target: Node3D
var nav_speed := 1.2          # current desired agent speed (NavMeshAgent.speed)
var grannys_var_speed := 4.3  # difficulty-based chase speed
var grannys_anim_speed := 2.0 # difficulty-based walk anim speed
var number := 1.0             # random waypoint selector
var distance := 0.0           # player-eye distance
var distance_waypoint := 0.0  # distance to target
var _velocity_vec := Vector3.ZERO
var _ai_enabled := false      # original component starts disabled (m_Enabled: 0)
var _waypoint_stop := false   # Unity "waypointStop"

# --- node references (resolved by name in _bind_refs) ---
var granny_eye: Node3D
var granny_lock: Node3D
var animation_holder: Node3D
var door_ray: Node3D
var check_ground: Node3D
var game_controller: Node
var player: Node3D
var player_go: Node3D          # Unity "Player" GO (the visible player object)
var player_pos: Node3D         # Unity "Main Camera"
var nav_agent: NavigationAgent3D
var all_bed_buttons: Node
var option_button: Node
var player_huka_knapp: Node
var player_huka_knapp_parent: Node
var teddy_music_holder: Node
var granny_hunt_music_holder: Node
var granny_sounds: Node
var player_sounds: Node
var spider: Node
var granny_eye_color: Node3D
var coffin_lock: Node3D
var coffin_lock_by: Node3D
var coffin_head1: Node3D
var coffin_head2: Node3D
var car_head: Node3D
var bastu_door: Node3D
var bastu_bom: Node3D
var bastu_door_carv: NavigationObstacle3D
var sound_holder1: Node
var sound_holder2: Node
var sound_holder3: Node
var start_car_button: Node
var forward_button: Node
var reverse_button: Node
var engine_on_sound: Node
var engine_off_sound: Node
var engine_start_sound: Node
var object_holder: Node
var granny_close_trigger: Node
var bear_trap_sp: Node3D

# bed / coffin / car hide spots (Unity wired the bed targets to the bed cams)
var bedtarget1: Node3D
var bedtarget2: Node3D
var bedtarget3: Node3D
var coffintarget4: Node3D
var coffintarget_by: Node3D
var cartarget: Node3D
var player_coffin_pos: Node3D
var player_coffin_by_pos: Node3D
var player_car_pos: Node3D

var _ap: AnimationPlayer

# ---------------------------------------------------------------------------
# Lifecycle
# ---------------------------------------------------------------------------
func _ready() -> void:
	_bind_refs()
	# difficulty profile (PlayerPrefs DiffData: 0=Normal 1=Easy 2=Hard 3=Extreme 4=Easier 5=Extreme)
	match GameState.get_int("DiffData"):
		1:
			grannys_var_speed = 3.0
			grannys_anim_speed = 1.5
		2:
			grannys_var_speed = 5.0
			grannys_anim_speed = 2.7
		3, 5:
			grannys_var_speed = 7.0
			grannys_anim_speed = 3.3
		_:
			grannys_var_speed = 4.3
			grannys_anim_speed = 2.0
	_pick_new_target()
	if nav_agent != null:
		nav_agent.max_speed = 1.2
		nav_agent.path_desired_distance = 1.0
		nav_agent.target_desired_distance = 1.0
	set_physics_process(false)   # original component starts disabled; enable_ai() turns it on

func _physics_process(delta: float) -> void:
	if not _ai_enabled:
		return
	rotation.x = 0.0
	rotation.z = 0.0
	_nav_step(delta)

	if target != null:
		distance_waypoint = target.global_position.distance_to(global_position)
	if granny_eye != null and player_pos != null:
		distance = player_pos.global_position.distance_to(granny_eye.global_position)

	_update_teddy_eyes()

	if not _disabled_by_state():
		if player_get_caught and player_fall_death:
			_set_nav_speed(0.0)
			_cross_fade("idle")

	if not player_get_caught:
		_update_patrol(delta)
		_update_hit_reactions()
		_update_walk_idle_anim()
		_update_waypoint_timers(delta)
		_update_hearing_chase(delta)
		_handle_door_ray(delta)
		_handle_ground_ray()
		_handle_attack()
		_handle_hiding_checks()
		_granny_decisions()

	if player_near_granny and not player_get_caught and not player_hiding:
		_face_position(player_pos.global_position, delta)

	_update_bastu(delta)
	_update_pepper(delta)

# ---------------------------------------------------------------------------
# Unity FixedUpdate sections
# ---------------------------------------------------------------------------
func _disabled_by_state() -> bool:
	return hit_by_arrow or hit_by_gun or bastu_killed or hit_by_car or hit_by_pepper_start or freeze

func _update_teddy_eyes() -> void:
	if GameState.get_int("DiffData") == 4:
		return
	if player_have_teddy and not freeze:
		_set_eye_color(Color(0.2264151, 0.0, 0.0))
		granny_eye_color_timer_on = true
		granny_eye_color_timer = 0.0
		_call(teddy_music_holder, "set_start_fade", true)
	elif granny_eye_color_timer_on:
		granny_eye_color_timer += get_physics_process_delta_time()
		if granny_eye_color_timer > 7.0:
			granny_eye_color_timer_on = false
			granny_eye_color_timer = 0.0
			_set_eye_color(Color(0.5882353, 0.5882353, 0.5882353))
			_call(teddy_music_holder, "set_start_fade", false)

func _update_patrol(delta: float) -> void:
	if _disabled_by_state():
		return
	if target == null:
		target = _find_by_name("Nav1") as Node3D
	if not granny_is_follow and not granny_look_under_bed and not player_get_caught:
		safe_timer += delta
		if safe_timer >= 80.0:
			safe_timer = 0.0
			if target == null or target.name != "Player":
				granny_hear_object = false
				granny_hear_player = false
				number = float(randi_range(1, 32))
				_pick_new_target()

func _update_hit_reactions() -> void:
	if player_get_caught:
		return
	if hit_by_arrow:
		_call(granny_hunt_music_holder, "set_granny_dead", true)
		if not ragdoll_spawn:
			ragdoll_spawn = true
			_set_nav_speed(0.0)
			_untag_self()
			_cross_fade("arrowHit", 0.8)
			_granny_hit_by_arrow()
			hunt_player = false
	elif hit_by_gun:
		_call(granny_hunt_music_holder, "set_granny_dead", true)
		if not ragdoll_spawn:
			ragdoll_spawn = true
			_set_nav_speed(0.0)
			_granny_hit_by_gun()
			hunt_player = false
	elif hit_by_car:
		_call(granny_hunt_music_holder, "set_granny_dead", true)
		if not ragdoll_spawn:
			ragdoll_spawn = true
			_set_nav_speed(0.0)
			_untag_self()
			_granny_hit_by_car()
			hunt_player = false
	elif freeze:
		_call(granny_hunt_music_holder, "set_granny_dead", true)
		if not ragdoll_spawn:
			ragdoll_spawn = true
			_set_nav_speed(0.0)
			_untag_self()
			_cross_fade("freezeTrap", 1.0)
			_granny_freeze()
			hunt_player = false

func _update_walk_idle_anim() -> void:
	if _disabled_by_state() or granny_look_under_bed:
		return
	if _velocity_vec != Vector3.ZERO:
		stop_walk = false
		granny_moving = true
		if not start_walk:
			if not granny_is_follow:
				if not granny_see_door and not granny_see_locked_door and not dropping_beartrap:
					_cross_fade("Walk", 0.9)
					_set_nav_speed(1.2)
			elif see_player:
				_cross_fade("Walk", grannys_anim_speed)
				_set_stopping_distance(2.0)
	elif _velocity_vec == Vector3.ZERO and not _disabled_by_state() and not granny_look_under_bed:
		start_walk = false
		granny_moving = false
		if not stop_walk:
			stop_walk = true
			if not attacking_player:
				if not granny_search and not hunt_player:
					if _velocity_vec == Vector3.ZERO:
						if granny_hear_player or granny_hear_object:
							_cross_fade("Look")
						else:
							_cross_fade("idle")

func _update_waypoint_timers(delta: float) -> void:
	if _disabled_by_state():
		return
	if target != null and not granny_look_under_bed:
		_nav_set_destination(target.global_position)
		if not see_player and not granny_is_follow and not granny_searching:
			if prison_door_closed:
				if waypoint_start and not _waypoint_stop:
					_begin_waypoint_wait()
			elif distance_waypoint < 5.0:
				if waypoint_start and not _waypoint_stop:
					_begin_waypoint_wait()
			elif distance_waypoint > 3.0 and not _waypoint_stop:
				waypoint_start = true
				_waypoint_stop = false
	if _waypoint_stop and not _disabled_by_state() and not start_timer_search \
			and (not granny_hear_object or not granny_hear_player):
		timer += delta
	if timer >= 10.0 and not granny_look_under_bed and not _disabled_by_state():
		_waypoint_stop = false
		waypoint_start = true
		timer = 0.0
		if not granny_is_follow:
			number = float(randi_range(1, 32))
			if not granny_hear_player or not granny_hear_object:
				_pick_new_target()

func _begin_waypoint_wait() -> void:
	waypoint_start = false
	_waypoint_stop = true
	timer = 0.0
	if target != null and (target.name.begins_with("TempNavObjects") or target.name.begins_with("TempNav")):
		start_timer_search = true
		granny_searching = true
		_cleaning()

func _update_hearing_chase(delta: float) -> void:
	if _disabled_by_state():
		return
	if see_player:
		if not granny_look_under_bed:
			granny_hear_player = false
			granny_hear_object = false
			timer_see = 0.0
			safe_timer = 0.0
			if not hunt_player:
				hunt_player = true
				if GameState.get_int("NightMareOnOff") == 1:
					_call(granny_hunt_music_holder, "set_start_fade", true)
				if not granny_is_follow:
					granny_is_follow = true
					_follow_player()
	elif player_have_teddy:
		if GameState.get_int("DiffData") != 4 and not granny_look_under_bed and not _disabled_by_state():
			granny_hear_player = false
			granny_hear_object = false
			timer_see = 0.0
			safe_timer = 0.0
			if not hunt_player:
				hunt_player = true
				if GameState.get_int("NightMareOnOff") == 1:
					_call(granny_hunt_music_holder, "set_start_fade", true)
				if not granny_is_follow:
					granny_is_follow = true
					_follow_player()
	elif player_start_car and GameState.get_int("DiffData") != 4 and not granny_look_under_bed \
			and not _disabled_by_state():
		granny_hear_player = false
		granny_hear_object = false
		timer_see = 0.0
		safe_timer = 0.0
		see_player = true
		if not hunt_player:
			hunt_player = true
			if GameState.get_int("NightMareOnOff") == 1:
				_call(granny_hunt_music_holder, "set_start_fade", true)
			if not granny_is_follow:
				granny_is_follow = true
				_follow_player()

	if granny_is_follow and not _disabled_by_state():
		if not see_player:
			see_player_timer = true
		else:
			see_player_timer = false
			timer_see = 0.0
			safe_timer = 0.0
	if see_player_timer and not _disabled_by_state():
		timer_see += delta
		if timer_see >= 6.0:
			see_player_timer = false
			granny_is_follow = false
			hunt_player = false
			if GameState.get_int("NightMareOnOff") == 1:
				_call(granny_hunt_music_holder, "set_start_fade", false)
			timer_see = 0.0
			safe_timer = 0.0
			start_timer_search = true
			granny_searching = true

	if start_timer_search and not granny_look_under_bed and not _disabled_by_state():
		if granny_searching:
			_set_nav_speed(0.0)
			if not granny_search and _velocity_vec == Vector3.ZERO:
				_cross_fade("Look")
		timer_search += delta
		if timer_search >= 8.0:
			if _velocity_vec != Vector3.ZERO:
				_cross_fade("Walk")
			else:
				_cross_fade("idle")
			_set_anim_speed("Walk", 0.9)
			granny_hear_player = false
			granny_hear_object = false
			if not granny_is_follow:
				start_timer_search = false
				granny_searching = false
				granny_search = false
				timer_search = 0.0
				if not granny_see_door and not granny_see_locked_door:
					_set_nav_speed(1.2)
				number = float(randi_range(1, 32))
				if not granny_hear_player or not granny_hear_object:
					_pick_new_target()
					if GameState.get_int("DiffData") != 4:
						_drop_bear_trap()
					if player_in_prison and prison_door_closed:
						_call(granny_sounds, "granny_skrattar")
					else:
						_call(granny_sounds, "start_granny_sound")

func _handle_door_ray(delta: float) -> void:
	if GameState.get_int("DiffData") == 4:
		return
	if door_ray == null:
		return
	var space := get_world_3d().direct_space_state
	var from := door_ray.global_position
	var to := from + (-door_ray.global_transform.basis.z) * 3.0
	var q := PhysicsRayQueryParameters3D.create(from, to)
	var hit := space.intersect_ray(q)
	var hit_node: Node = hit.get("collider") if not hit.is_empty() else null
	if hit_node == null:
		granny_see_door = false
		granny_see_locked_door = false
		stop_see_locked_door = false
		if not _disabled_by_state() and _velocity_vec != Vector3.ZERO:
			_cross_fade("Walk")
		return
	if _disabled_by_state():
		return
	if _is_tag(hit_node, "innerdoorClosed"):
		_granny_sees_openable_door(hit_node, delta, "InnerdoorOpen", true)
	elif _is_tag(hit_node, "innerdoorLocked"):
		_granny_sees_locked_door(hit_node, delta, "InnerdoorLocked", "InnerdoorOpen", true)
	elif _is_tag(hit_node, "steeldoorLocked"):
		_granny_sees_locked_door(hit_node, delta, "InnerdoorLocked", "InnerdoorOpen", false)
	elif _is_tag(hit_node, "bastudoorLocked"):
		_granny_sees_locked_door(hit_node, delta, "", "", false)
	elif _is_tag(hit_node, "smalldoorClosed"):
		_granny_sees_openable_door(hit_node, delta, "SmallDoorOpen", false)
	elif _is_tag(hit_node, "garde1Closed"):
		_granny_sees_garde1(hit_node, delta)
	elif _is_tag(hit_node, "Untagged"):
		granny_see_door = false
		granny_see_locked_door = false
		stop_see_locked_door = false
		if _velocity_vec != Vector3.ZERO:
			_cross_fade("Walk")

func _granny_sees_openable_door(hit_node: Node, delta: float, open_anim: String, stop_on_sight: bool) -> void:
	granny_see_door = true
	if not see_player:
		if player_have_teddy or player_start_car:
			_cross_fade("idle")
		elif stop_on_sight:
			_set_nav_speed(0.0)
	see_closed_door_timer += delta
	if _velocity_vec == Vector3.ZERO:
		_cross_fade("idle")
	if see_closed_door_timer >= 2.0:
		_play_anim_on(hit_node, open_anim)
		if not granny_is_follow:
			_set_nav_speed(1.2)
			if _velocity_vec != Vector3.ZERO:
				_cross_fade("Walk", 0.9)
			else:
				_cross_fade("idle")
		else:
			_set_nav_speed(grannys_var_speed)
			if _velocity_vec != Vector3.ZERO:
				_cross_fade("Walk", grannys_anim_speed)
			else:
				_cross_fade("idle")
		see_closed_door_timer = 0.0

func _granny_sees_locked_door(hit_node: Node, delta: float, locked_anim: String, open_anim: String, reset_stop: bool) -> void:
	if stop_see_locked_door:
		return
	granny_see_locked_door = true
	see_closed_door_timer += delta
	if granny_see_locked_door and not see_player:
		if player_have_teddy or player_start_car:
			_cross_fade("idle")
		else:
			_set_nav_speed(0.0)
	if _velocity_vec == Vector3.ZERO:
		_cross_fade("idle")
		_set_nav_speed(0.0)
	if locked_anim != "" and see_closed_door_timer <= 2.0:
		_play_anim_on(hit_node, locked_anim)
	if see_closed_door_timer >= 4.0:
		if open_anim != "":
			_play_anim_on(hit_node, open_anim)
		if not granny_is_follow:
			_set_nav_speed(1.2)
			if _velocity_vec != Vector3.ZERO:
				_cross_fade("Walk", 0.9)
			else:
				_cross_fade("idle")
		else:
			_set_nav_speed(grannys_var_speed)
			if _velocity_vec != Vector3.ZERO:
				_cross_fade("Walk", grannys_anim_speed)
			else:
				_cross_fade("idle")
		if granny_see_locked_door and see_closed_door_timer >= 10.0:
			granny_see_locked_door = false
			stop_see_locked_door = reset_stop
			see_closed_door_timer = 0.0
			granny_hear_player = false
			granny_hear_object = false
			number = float(randi_range(1, 32))
			_pick_new_target()

func _granny_sees_garde1(hit_node: Node, delta: float) -> void:
	granny_see_door = true
	if granny_is_follow:
		if not see_player:
			if player_hiding:
				_set_nav_speed(0.0)
				see_closed_door_timer += delta
				if _velocity_vec == Vector3.ZERO:
					_cross_fade("idle")
				if see_closed_door_timer >= 2.0:
					_play_anim_on(hit_node, "Garde1Open")
					if _velocity_vec != Vector3.ZERO:
						_cross_fade("Walk", 0.9)
					else:
						_cross_fade("idle")
					see_closed_door_timer = 0.0
			see_player_timer = true
		else:
			see_player_timer = false
			timer_see = 0.0
			safe_timer = 0.0

func _handle_ground_ray() -> void:
	if check_ground == null:
		return
	var space := get_world_3d().direct_space_state
	var from := check_ground.global_position
	var q := PhysicsRayQueryParameters3D.create(from, from + Vector3.DOWN * 5.0)
	var hit := space.intersect_ray(q)
	if hit.is_empty():
		return
	var hit_node: Node = hit.get("collider")
	if hit_node == null:
		return
	if hit_node.name == "StairColliderC":
		if not see_stairs:
			see_stairs = true
			attack_distance = 4.5
	elif hit_node.name == "Golv" and see_stairs:
		see_stairs = false
		attack_distance = 4.0
		_call(animation_holder, "set_walk_grus", false)
	if _is_tag(hit_node, "grus"):
		_call(animation_holder, "set_walk_grus", true)
	elif _is_tag(hit_node, "golv"):
		_call(animation_holder, "set_walk_grus", false)

func _handle_attack() -> void:
	if distance < attack_distance and see_player and not granny_look_under_bed \
			and not player_hiding_in_coffin and not player_hiding_in_coffin_backyard \
			and not player_hiding_in_car and not _disabled_by_state() and not player_in_hole \
			and not player_get_caught:
		player_get_caught = true
		attacking_player = true
		_player_caught()
		_face_position(player_pos.global_position, 999.0)

func _handle_hiding_checks() -> void:
	if player_get_caught or _disabled_by_state():
		return
	if distance_waypoint < 4.0 and player_hiding_under_bed and granny_is_follow:
		if not granny_look_under_bed and _velocity_vec != Vector3.ZERO:
			_cross_fade("idle")
		_set_nav_speed(0.0)
		_face_player_bed()
		if not granny_look_under_bed:
			timer_bed += get_physics_process_delta_time()
		if timer_bed >= 3.0 and player_hiding_under_bed:
			_set_visible(option_button, false)
			_cross_fade("lookBed")
			granny_look_under_bed = true
			timer_bed = 0.0
			safe_timer = 0.0
			_set_visible(all_bed_buttons, false)
			_bed_eye_hook()
	elif distance_waypoint < 4.0 and player_hiding_in_coffin and granny_is_follow:
		_set_nav_speed(0.0)
		_face_player_bed()
		if _velocity_vec != Vector3.ZERO:
			_cross_fade("idle")
		if not granny_look_under_bed:
			timer_bed += get_physics_process_delta_time()
		if timer_bed >= 3.0 and player_hiding_in_coffin:
			_set_visible(option_button, false)
			timer_bed = 0.0
			safe_timer = 0.0
			_set_visible(all_bed_buttons, false)
			_player_caught()
	elif distance_waypoint < 4.0 and player_hiding_in_coffin_backyard and granny_is_follow:
		_set_nav_speed(0.0)
		_face_player_bed()
		if _velocity_vec != Vector3.ZERO:
			_cross_fade("idle")
		if not granny_look_under_bed:
			timer_bed += get_physics_process_delta_time()
		if timer_bed >= 3.0 and player_hiding_in_coffin_backyard:
			_set_visible(option_button, false)
			timer_bed = 0.0
			safe_timer = 0.0
			_set_visible(all_bed_buttons, false)
			_player_caught()
	elif distance_waypoint < 4.0 and player_hiding_in_car and granny_is_follow and granny_stand_beside_car:
		if not _read(game_controller, "car_moving", false):
			_set_nav_speed(0.0)
			_face_player_bed()
			if _velocity_vec != Vector3.ZERO:
				_cross_fade("idle")
			if not granny_look_under_bed:
				timer_bed += get_physics_process_delta_time()
			if timer_bed >= 3.0 and player_hiding_in_car:
				_set_visible(option_button, false)
				timer_bed = 0.0
				safe_timer = 0.0
				_set_visible(all_bed_buttons, false)
				_set_visible(start_car_button, false)
				_set_visible(forward_button, false)
				_set_visible(reverse_button, false)
				_player_caught()
	elif not player_hiding_under_bed and not player_hiding_in_coffin \
			and not player_hiding_in_coffin_backyard and not player_hiding_in_car and granny_is_follow:
		_follow_player()

	if granny_hear_player and not see_player and not granny_is_follow:
		var tn := _find_by_name("TempNav") as Node3D
		if tn != null:
			target = tn
		if not granny_see_door and not granny_see_locked_door:
			_set_nav_speed(grannys_var_speed)
		_set_anim_speed("Walk", grannys_anim_speed)
		granny_hear_object = false
		dropping_beartrap = false
	if granny_hear_object and not see_player and not granny_is_follow:
		var tno := _find_by_name("TempNavObjects") as Node3D
		if tno != null:
			target = tno
		else:
			target = _find_by_name("Nav1") as Node3D
		if not granny_see_door and not granny_see_locked_door:
			_set_nav_speed(grannys_var_speed)
		_set_anim_speed("Walk", grannys_anim_speed)
		granny_hear_player = false
		dropping_beartrap = false
		if not reset_safe_timer:
			reset_safe_timer = true
			safe_timer = 0.0

	if player_hiding_under_bed and see_player and granny_is_follow:
		if _bed_cam_active("BedCam1"):
			target = bedtarget1
		elif _bed_cam_active("BedCam2"):
			target = bedtarget2
		elif _bed_cam_active("BedCam3"):
			target = bedtarget3
		see_player = false
		_set_stopping_distance(2.0)
		dropping_beartrap = false
	elif player_hiding_in_coffin and see_player and granny_is_follow:
		target = coffintarget4
	elif player_hiding_in_coffin_backyard and see_player and granny_is_follow:
		target = coffintarget_by
	elif player_hiding_in_car and see_player and granny_is_follow:
		target = cartarget

func _bed_cam_active(cam_name: String) -> bool:
	var cam := _find_by_name(cam_name)
	return cam != null and cam.visible

func _bed_eye_hook() -> void:
	# bed eyes look at granny + bed sound; original also starts EndDayUnderBed
	if _bed_cam_active("BedCam1"):
		_call(_find_by_name("BedCam1"), "set_look_at_granny", true)
		if not sound_playing:
			sound_playing = true
			_call(sound_holder1, "player_caught")
	elif _bed_cam_active("BedCam2"):
		_call(_find_by_name("BedCam2"), "set_look_at_granny", true)
		if not sound_playing:
			sound_playing = true
			_call(sound_holder2, "player_caught")
	elif _bed_cam_active("BedCam3"):
		_call(_find_by_name("BedCam3"), "set_look_at_granny", true)
		if not sound_playing:
			sound_playing = true
			_call(sound_holder3, "player_caught")
	sound_playing = false
	_call(game_controller, "end_day_under_bed")

func _granny_decisions() -> void:
	if _disabled_by_state():
		return
	if granny_is_follow:
		if distance < 4.0:
			if target != null:
				_face_position(target.global_position, get_physics_process_delta_time())
			else:
				_face_position(player_pos.global_position, get_physics_process_delta_time())
		elif distance > 6.0:
			player_near_granny = false
	elif distance > 6.0 and target != player and not granny_gonna_smack:
		player_near_granny = false

func _update_bastu(delta: float) -> void:
	if granny_in_bastu and bastu_switch_on and bastu_bom_nere and not freeze:
		bastu_timer -= delta
		bastu_door_timer -= delta
		if bastu_timer <= 0.0:
			granny_in_bastu = false
			bastu_killed = true
			_granny_hit_by_arrow()
		if not bastu_time_off and bastu_door_timer <= 0.0:
			bastu_time_off = true
			_mark_tag(bastu_door, "innerdoorLocked")
			_set_bastu_carv(true)
	if granny_in_bastu and not bastu_switch_on and bastu_bom_nere and not freeze:
		if not bastu_time_off:
			bastu_door_timer -= delta
			if bastu_door_timer <= 0.0:
				bastu_time_off = true
				_mark_tag(bastu_door, "innerdoorLocked")
				_set_bastu_carv(true)
				start_bastu_safe_timer = true
		if start_bastu_safe_timer:
			bastu_safe_timer += delta
			if bastu_safe_timer >= 30.0:
				start_bastu_safe_timer = false
				_play_anim_on(bastu_door, "InnerdoorOpen")
	if granny_in_bastu and not bastu_switch_on and not bastu_bom_nere:
		bastu_door_timer = 20.0

func _update_pepper(delta: float) -> void:
	if hit_by_pepper and not player_get_caught:
		hunt_player = false
		if GameState.get_int("NightMareOnOff") == 1:
			_call(granny_hunt_music_holder, "set_start_fade", false)
		_set_visible(granny_lock, true)
		see_player = false
		granny_is_follow = false
		player_near_granny = false
		_set_self_collision(false)
		_call(granny_eye, "set_enabled", false)
		blind_timer -= delta
		if blind_timer < 0.0:
			_set_self_collision(true)
			_call(granny_eye, "set_enabled", true)
			_set_visible(granny_close_trigger, false)
			_set_visible(granny_lock, false)
			hit_by_pepper = false
			blind_timer = blind_timer_max
			granny_pepper_react = false
		if not granny_pepper_react:
			granny_pepper_react = true
			_granny_hit_by_pepper()
	elif player_get_caught and hit_by_pepper:
		_set_visible(granny_lock, false)
		_set_self_collision(true)
		_call(granny_eye, "set_enabled", true)
		blind_timer = blind_timer_max
	if hit_by_pepper_start:
		if not _is_playing("pepperHit"):
			hit_by_pepper_start = false
			_pepper_anim_done()

# ---------------------------------------------------------------------------
# Granny action helpers (Unity methods)
# ---------------------------------------------------------------------------
func _granny_hit_by_pepper() -> void:
	_set_nav_speed(0.0)
	_cross_fade("pepperHit")

func _pepper_anim_done() -> void:
	_pick_new_target()

func _granny_hit_by_arrow() -> void:
	await get_tree().create_timer(3.0).timeout
	if _read(game_controller, "end_scene_running", false):
		return
	_spawn_prefab("GrannyRagdoll", global_position, global_rotation)
	_granny_disappear()
	_show_gone_text(false)

func _granny_hit_by_car() -> void:
	if _read(game_controller, "end_scene_running", false):
		return
	_spawn_prefab("GrannyRagdoll", global_position, global_rotation)
	_granny_disappear()
	_show_gone_text(false)

func _granny_hit_by_gun() -> void:
	if _read(game_controller, "end_scene_running", false):
		return
	_spawn_prefab("GrannyRagdollShoot", global_position, global_rotation)
	_granny_disappear()
	_show_gone_text(true)

func _granny_freeze() -> void:
	await get_tree().create_timer(2.5).timeout
	if _read(game_controller, "end_scene_running", false):
		return
	_spawn_prefab("GrannyFreezeDoll", global_position, global_rotation)
	_granny_disappear()
	_show_gone_text(false)

func _show_gone_text(shot: bool) -> void:
	var diff := GameState.get_int("DiffData")
	var key := ""
	match diff:
		0:
			key = "GrannyIsGone_Normal_ShotText" if shot else "GrannyIsGone_NormalText1"
		1:
			key = "GrannyIsGone_Easy_ShotText" if shot else "GrannyIsGone_EasyText2"
		2:
			key = "GrannyIsGone_Hard_ShotText" if shot else "GrannyIsGone_HardText3"
		3, 5:
			key = "GrannyIsGone_Extreme_ShotText" if shot else "GrannyIsGone_ExtremeText4"
	_call(_find_by_name(key), "set_text_on_off", true)

func _granny_disappear() -> void:
	_set_visible(animation_holder, false)
	_set_visible(granny_lock, false)

func _drop_bear_trap() -> void:
	await get_tree().create_timer(10.0).timeout
	if granny_is_follow or hit_by_arrow or hit_by_gun or granny_in_bastu or bastu_killed \
			or hit_by_car or hit_by_pepper_start or freeze:
		return
	_set_nav_speed(0.0)
	dropping_beartrap = true
	await get_tree().create_timer(1.0).timeout
	var trap_name := "BearTrapOrganic" if GameState.get_int("NightMareOnOff") == 1 else "BearTrap"
	if bear_trap_sp != null:
		_spawn_prefab(trap_name, bear_trap_sp.global_position, bear_trap_sp.global_rotation)
	await get_tree().create_timer(1.0).timeout
	dropping_beartrap = false
	_set_nav_speed(1.2)
	if _velocity_vec != Vector3.ZERO:
		_cross_fade("Walk")
	else:
		_cross_fade("idle")

func _player_caught() -> void:
	if _disabled_by_state() or player_in_hole:
		return
	_set_nav_speed(0.0)
	if player_caught_last_time:
		if not player_hiding_under_bed:
			if player_hiding_in_coffin:
				_pull_player_out(coffintarget4, player_coffin_pos, coffin_head1, coffin_lock, Vector3(-153.846, 0.0, 0.0), false)
			elif player_hiding_in_coffin_backyard:
				_pull_player_out(coffintarget_by, player_coffin_by_pos, coffin_head2, coffin_lock_by, Vector3(165.669, 0.0, 0.0), false)
			elif player_hiding_in_car:
				_pull_player_out(cartarget, player_car_pos, car_head, null, Vector3.ZERO, true)
			else:
				_smack_player_standing()
	elif not player_hiding_under_bed:
		_call(player_huka_knapp, "stand_up")
		_set_visible(player_huka_knapp_parent, false)
		if _velocity_vec == Vector3.ZERO:
			_cross_fade("idle")
		_call(player, "set_start_fov", true)
		_call(player, "set_granny_take_player", true)
		granny_gonna_smack = false

func _pull_player_out(bed_target: Node3D, out_pos: Node3D, head_node: Node3D, lock_node: Node3D, lock_rot: Vector3, is_car: bool) -> void:
	if player != null and out_pos != null:
		player.global_position = out_pos.global_position
	_set_visible(player_go, true)
	_set_visible(head_node, false)
	if lock_node != null:
		lock_node.rotation_degrees = lock_rot
	_set_nav_speed(0.0)
	if dont_hit_player:
		_cross_fade("idle")
		return
	_call(player_huka_knapp, "stand_up")
	_set_visible(player_huka_knapp_parent, false)
	_cross_fade("Hit")
	_call(player, "set_start_fov", true)
	_call(player, "set_granny_take_player", true)
	if is_car:
		_call(player_sounds, "car_out")
		player_start_car = false
		_set_visible(engine_on_sound, false)
		_set_visible(engine_off_sound, true)
		_set_visible(engine_start_sound, false)
		granny_stand_beside_car = false
		_set_visible(object_holder, true)
		await get_tree().create_timer(0.6).timeout
		await get_tree().create_timer(0.3).timeout
		_call(game_controller, "player_hit")
		granny_gonna_smack = false
		_set_visible(engine_off_sound, false)
		return
	if GameState.get_int("NightMareOnOff") == 1:
		_call(granny_hunt_music_holder, "set_granny_smack_player", true)
		_call(granny_hunt_music_holder, "set_player_caught", true)
	await get_tree().create_timer(0.6).timeout
	await get_tree().create_timer(0.3).timeout
	_call(game_controller, "player_hit")
	granny_gonna_smack = false

func _smack_player_standing() -> void:
	player_near_granny = false
	granny_gonna_smack = false
	_set_nav_speed(0.0)
	if dont_hit_player:
		_cross_fade("idle")
		return
	_call(player_huka_knapp, "stand_up")
	_set_visible(player_huka_knapp_parent, false)
	_cross_fade("Hit")
	_call(player, "set_start_fov", true)
	_call(player, "set_granny_take_player", true)
	if GameState.get_int("NightMareOnOff") == 1:
		_call(granny_hunt_music_holder, "set_granny_smack_player", true)
		_call(granny_hunt_music_holder, "set_player_caught", true)
	if spider != null and spider.visible:
		_call(spider, "granny_caught_player")
	await get_tree().create_timer(0.6).timeout
	_call(player_sounds, "player_get_hit")
	await get_tree().create_timer(0.3).timeout
	_call(game_controller, "player_hit")

func _follow_player() -> void:
	if _disabled_by_state():
		return
	dropping_beartrap = false
	if not granny_see_door and not granny_see_locked_door:
		_set_nav_speed(grannys_var_speed)
	_set_stopping_distance(2.0)
	if _velocity_vec != Vector3.ZERO:
		_cross_fade("Walk")
	else:
		_cross_fade("idle")
	_set_anim_speed("Walk", grannys_anim_speed)
	target = player
	granny_searching = false
	start_timer_search = false
	timer_search = 0.0

func _pick_new_target() -> void:
	if _disabled_by_state():
		return
	dropping_beartrap = false
	if not granny_hear_player:
		_free_named("TempNav")
	if not granny_hear_object:
		for n in get_tree().get_nodes_in_group("unity_noiseobject"):
			n.queue_free()
		_cleaning()
	_set_anim_speed("Walk", 0.9)
	if target != null:
		_nav_set_destination(target.global_position)
	_set_nav_speed(1.2)
	waypoint_wait_time = false
	safe_timer = 0.0
	# 32-waypoint roulette -> Nav1..Nav16 (Unity pairs numbers: 1,2->Nav1 ... 31,32->Nav16)
	var idx := int(ceilf(number / 2.0))
	var nav := _find_by_name("Nav%d" % idx) as Node3D
	if nav != null:
		target = nav
		_nav_set_destination(nav.global_position)

func _cleaning() -> void:
	await get_tree().create_timer(15.0).timeout
	_call(game_controller, "clean_up")

func _face_position(pos: Vector3, delta: float) -> void:
	var to := pos - global_position
	if to.length_squared() < 0.0001:
		return
	var flat := Vector3(to.x, 0.0, to.z)
	var target_yaw := atan2(-flat.x, -flat.z)
	var cur := rotation.y
	var diff := wrapf(target_yaw - cur, -PI, PI)
	rotation.y = cur + clampf(diff, -turn_speed * delta, turn_speed * delta)

func _face_player_bed() -> void:
	var t: Node3D = null
	if _bed_cam_active("BedCam1"):
		t = bedtarget1
	elif _bed_cam_active("BedCam2"):
		t = bedtarget2
	elif _bed_cam_active("BedCam3"):
		t = bedtarget3
	elif player_hiding_in_coffin:
		t = coffintarget4
	elif player_hiding_in_coffin_backyard:
		t = coffintarget_by
	elif player_hiding_in_car:
		t = cartarget
	if t != null:
		_face_position(t.global_position, get_physics_process_delta_time())

# ---------------------------------------------------------------------------
# External control (called from other ported scripts / triggers)
# ---------------------------------------------------------------------------
func enable_ai() -> void:
	_ai_enabled = true
	set_physics_process(true)

func disable_ai() -> void:
	_ai_enabled = false

func set_player_get_caught(v: bool) -> void:
	player_get_caught = v

func set_player_fall_death(v: bool) -> void:
	player_fall_death = v

func set_see_player(v: bool) -> void:
	see_player = v

func set_hit_by_arrow(v: bool) -> void:
	hit_by_arrow = v

func set_hit_by_gun(v: bool) -> void:
	hit_by_gun = v

func set_hit_by_car(v: bool) -> void:
	hit_by_car = v

func set_hit_by_pepper(v: bool) -> void:
	hit_by_pepper = v

func set_hit_by_pepper_start(v: bool) -> void:
	hit_by_pepper_start = v

func set_freeze(v: bool) -> void:
	freeze = v

func set_granny_hear_player(v: bool) -> void:
	granny_hear_player = v

func set_granny_hear_object(v: bool) -> void:
	granny_hear_object = v

func set_player_hiding(v: bool) -> void:
	player_hiding = v

func set_player_hiding_under_bed(v: bool) -> void:
	player_hiding_under_bed = v

func set_player_hiding_in_coffin(v: bool) -> void:
	player_hiding_in_coffin = v

func set_player_hiding_in_coffin_backyard(v: bool) -> void:
	player_hiding_in_coffin_backyard = v

func set_player_hiding_in_car(v: bool) -> void:
	player_hiding_in_car = v

func set_player_have_teddy(v: bool) -> void:
	player_have_teddy = v

func set_player_start_car(v: bool) -> void:
	player_start_car = v

func set_granny_stand_beside_car(v: bool) -> void:
	granny_stand_beside_car = v

func set_player_in_prison(v: bool) -> void:
	player_in_prison = v

func set_prison_door_closed(v: bool) -> void:
	prison_door_closed = v

func set_player_in_hole(v: bool) -> void:
	player_in_hole = v

func set_granny_in_bastu(v: bool) -> void:
	granny_in_bastu = v

func set_bastu_switch_on(v: bool) -> void:
	bastu_switch_on = v

func set_bastu_bom_nere(v: bool) -> void:
	bastu_bom_nere = v

func set_dont_hit_player(v: bool) -> void:
	dont_hit_player = v

# ---------------------------------------------------------------------------
# Internals: refs, nav, anims, helpers
# ---------------------------------------------------------------------------
func _bind_refs() -> void:
	granny_eye = _find_by_name("GrannyEyes") as Node3D
	granny_lock = _find_by_name("EyesLock") as Node3D
	animation_holder = _find_by_name("GrannyTest6") as Node3D
	door_ray = _find_by_name("GrannyHeadPos") as Node3D
	check_ground = _find_by_name("GroundChecker") as Node3D
	game_controller = _find_by_name("GameController")
	player = _find_by_name("Player") as Node3D
	player_go = player
	player_pos = _find_by_name("Main_Camera") as Node3D
	all_bed_buttons = _find_by_name("AllBedButtons")
	option_button = _find_by_name("OptionButtonParent")
	player_huka_knapp = _find_by_name("PlayerHukarSigButton")
	player_huka_knapp_parent = _find_by_name("PlayerHukarSigButtonParent")
	teddy_music_holder = _find_by_name("TeddyHuntMusic")
	granny_hunt_music_holder = _find_by_name("GrannyHuntMusic")
	granny_sounds = granny_eye
	player_sounds = _find_by_name("SoundEffects")
	spider = _find_by_name("SpiderParent")
	granny_eye_color = _find_by_name("Eyes") as Node3D
	coffin_lock = _find_by_name("CoffinLock") as Node3D
	coffin_lock_by = _find_by_name("MeatBoxLock") as Node3D
	coffin_head1 = _find_by_name("coffinHead1") as Node3D
	coffin_head2 = _find_by_name("coffinHead2") as Node3D
	car_head = _find_by_name("carHead") as Node3D
	bastu_door = _find_by_name("BastuDoor") as Node3D
	bastu_bom = _find_by_name("BastuBom") as Node3D
	if bastu_door != null:
		bastu_door_carv = bastu_door.get_node_or_null("NavigationObstacle3D") as NavigationObstacle3D
	sound_holder1 = _find_by_name("SoundEffects")
	sound_holder2 = _find_by_name("SoundEffects_1")
	sound_holder3 = _find_by_name("SoundEffects_2")
	start_car_button = _find_by_name("StartCarButton")
	forward_button = _find_by_name("ForwardButton")
	reverse_button = _find_by_name("ReverseButton")
	engine_on_sound = _find_by_name("EngineOn")
	engine_off_sound = _find_by_name("EngineOff")
	engine_start_sound = _find_by_name("EngineStart")
	object_holder = _find_by_name("HandHoldObjects")
	granny_close_trigger = _find_by_name("GrannyBlindPlayerSens")
	bedtarget1 = _find_by_name("BedCam1") as Node3D
	bedtarget2 = _find_by_name("BedCam2") as Node3D
	bedtarget3 = _find_by_name("BedCam3") as Node3D
	coffintarget4 = _find_by_name("coffinCam1") as Node3D
	coffintarget_by = _find_by_name("coffinCam1") as Node3D
	cartarget = _find_by_name("carCam") as Node3D
	player_coffin_pos = _find_by_name("PlayerOutsideCoffinPos") as Node3D
	player_coffin_by_pos = _find_by_name("PlayerOutsideCoffinPos") as Node3D
	player_car_pos = _find_by_name("PlayerOutsideCarPos") as Node3D
	bear_trap_sp = _find_by_name("BearTrapSpoint") as Node3D
	nav_agent = get_node_or_null("NavigationAgent3D") as NavigationAgent3D
	_ap = null
	if animation_holder != null:
		_ap = animation_holder.get_node_or_null("AnimationPlayer") as AnimationPlayer

func _nav_step(delta: float) -> void:
	if nav_agent == null:
		_velocity_vec = Vector3.ZERO
		return
	if nav_agent.is_navigation_finished():
		_velocity_vec = Vector3.ZERO
		return
	var next := nav_agent.get_next_path_position()
	var to := next - global_position
	var d := to.length()
	if d < 0.001:
		_velocity_vec = Vector3.ZERO
		return
	var step := nav_speed * delta
	var mv := to / d * minf(step, d)
	global_position += mv
	_velocity_vec = mv / maxf(delta, 0.000001)

func _set_nav_speed(v: float) -> void:
	nav_speed = v
	if nav_agent != null:
		nav_agent.max_speed = v

func _set_stopping_distance(v: float) -> void:
	if nav_agent != null:
		nav_agent.path_desired_distance = v
		nav_agent.target_desired_distance = v

func _nav_set_destination(p: Vector3) -> void:
	if nav_agent != null:
		nav_agent.target_position = p

func _cross_fade(clip: String, spd := 0.0) -> void:
	var ap := _anim_player()
	if ap == null or not ap.has_animation(clip):
		return
	ap.play(clip, 0.25, spd if spd > 0.0 else 1.0)

func _set_anim_speed(clip: String, spd: float) -> void:
	var ap := _anim_player()
	if ap == null or not ap.is_playing():
		return
	if ap.current_animation == clip:
		ap.speed_scale = spd

func _is_playing(clip: String) -> bool:
	var ap := _anim_player()
	return ap != null and ap.is_playing() and ap.current_animation == clip

func _anim_player() -> AnimationPlayer:
	return _ap

func _play_anim_on(node: Node, clip: String) -> void:
	if node == null or clip == null or clip.is_empty():
		return
	var ap := node.get_node_or_null("AnimationPlayer") as AnimationPlayer
	if ap == null:
		ap = node as AnimationPlayer
	if ap == null:
		return
	if ap.has_animation(clip):
		ap.play(clip, 0.25)

func _set_eye_color(c: Color) -> void:
	if granny_eye_color == null:
		return
	var mi := granny_eye_color.find_child("*", true, false) as MeshInstance3D
	if mi == null:
		mi = granny_eye_color as MeshInstance3D
	if mi == null:
		return
	if mi.material_override == null:
		mi.material_override = StandardMaterial3D.new()
	mi.material_override.albedo_color = c

func _set_self_collision(enabled: bool) -> void:
	for cs in find_children("*", "CollisionShape3D", true, false):
		(cs as CollisionShape3D).disabled = not enabled

func _set_bastu_carv(v: bool) -> void:
	if bastu_door_carv != null:
		bastu_door_carv.avoidance_enabled = v

func _untag_self() -> void:
	_mark_tag(self, "Untagged")

func _mark_tag(node: Node, tag: String) -> void:
	if node == null:
		return
	node.set_meta("unity_tag", tag)
	for g in node.get_groups():
		if g.begins_with("unity_"):
			node.remove_from_group(g)
	if tag != "Untagged":
		node.add_to_group("unity_" + tag)

func _is_tag(node: Node, tag: String) -> bool:
	if node == null:
		return false
	if node.has_meta("unity_tag"):
		return node.get_meta("unity_tag") == tag
	return node.is_in_group("unity_" + tag)

func _set_visible(node: Node, v: bool) -> void:
	if node != null:
		node.set("visible", v)

func _spawn_prefab(prefab_name: String, pos: Vector3, rot: Vector3) -> void:
	var scene := load("res://converted/prefabs/%s.tscn" % prefab_name) as PackedScene
	if scene == null:
		push_warning("EnemyAIGranny: prefab not found: %s" % prefab_name)
		return
	var inst := scene.instantiate()
	get_tree().current_scene.add_child(inst)
	inst.global_position = pos
	inst.global_rotation = rot

func _free_named(name: String) -> void:
	for n in get_tree().current_scene.find_children("*", "", true, false):
		if n.name == name or n.name.begins_with(name + "_") or n.name == name + "Old":
			n.queue_free()

func _find_by_name(name: String) -> Node:
	if name.is_empty():
		return null
	# prefer own subtree (converted scene may suffix-collide: GrannyTest6_1 etc.)
	var self_match := _find_in_subtree(self, name)
	if self_match != null:
		return self_match
	var scene := get_tree().current_scene
	if scene == null:
		return null
	return _find_in_subtree(scene, name)

func _find_in_subtree(root: Node, base: String) -> Node:
	# converter sanitized node names (spaces -> underscores); match either form
	var query := _san(base)
	for c in root.find_children("*", "", true, false):
		if c.name == query or c.name.begins_with(query + "_"):
			return c
	return null

func _san(name: String) -> String:
	# mirror converter sanitization: invalid chars (e.g. spaces) became underscores
	var out := ""
	for ch in name:
		out += ch if (ch >= "a" and ch <= "z") or (ch >= "A" and ch <= "Z") \
				or (ch >= "0" and ch <= "9") or ch == "_" or ch == "." or ch == "-" else "_"
	return out

func _call(node: Node, method: String, arg: Variant = null) -> void:
	if node == null or not node.has_method(method):
		return
	if arg == null:
		node.call(method)
	else:
		node.call(method, arg)

func _read(node: Node, prop: String, def: Variant) -> Variant:
	if node == null:
		return def
	var v = node.get(prop)
	return v if v != null else def