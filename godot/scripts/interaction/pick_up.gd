extends Node3D
## Semantic port of Unity `PickUp.cs` (2530 lines) — the player's forward-ray
## interaction dispatcher. Every frame a 5 m ray is cast from the camera (Unity
## SeeRay field -> "Main Camera" GO) and the hit object's tag selects the prompt
## and, when the pick-up button fires (pick_up flag), the action.
##
## Unity -> Godot mapping:
##   Physics.Raycast(5 m, ~layerMask) -> direct_space_state.intersect_ray from
##     camera forward; mask: everything (layer 8 exclusions have no Godot analog).
##   gameObject.tag -> node metadata "unity_tag" / "unity_<tag>" group (converter
##     emits these); _tag_of climbs parent chain like Unity's collider->GO lookup.
##   UI GameObjects (pickUpButton, mittenRing, *Text, *Button...) -> looked up by
##     their real scene GO names (see field map in migration log); the converter
##     does not emit Unity Canvas/UI subtrees yet, so UI toggles are guarded.
##   Other MonoBehaviours on GameController (CheckExitDoor, checkTheCar, ...) ->
##     guarded method calls; only already-ported classes respond today.
##   Destroy(obj) -> node.queue_free();  tag write -> _mark_tag().
##   Animation component clips -> _play_anim() finds an AnimationPlayer child.
##
## Serialized refs of the original resolved to their *actual* GO names here
## (e.g. SeeRay->Main Camera, avbitare->AvbitareHand, exitkey->HouseKeyHand,
##  LampaDoor1->Larmlampa2, specialkeyDoor->Vind2Door, playhouseDoor->LekhusDoor,
##  DdoorLock->L1, galler->PrisonGaller, giljotin->KlingTrigger, ...).

const RAY_LENGTH := 5.0

# (button-consumed input; scene UI buttons set these through set_* methods)
var player_taken := false
var pick_up := false
var drop_object := false
var place_object := false

# world/held refs used by the action branches (field name -> GO name in scene)
var _game_controller: Node
var _granny: Node
var _granny_start_pos: Node3D
var _see_ray: Node3D
var _inv: Node                 # GameController node (carries inventory_controller.gd)
var _sound_holder: Node

var _play_sound := false
var _have_seen_melon_text := false
var _old_shotgun_loaded := false
var _text_timer := 0.0
var _text_timer_on_off := false

func _ready() -> void:
	_game_controller = _find("GameController")
	_inv = _game_controller
	_granny = _find("GrannyParent")
	_granny_start_pos = _find("GrannyStartPos") as Node3D
	_see_ray = _find("Main_Camera") as Node3D
	_sound_holder = _find("SoundEffects")

func _process(delta: float) -> void:
	if _see_ray == null or _see_ray.is_inside_tree() == false:
		return
	var cam := _see_ray
	var space := cam.get_world_3d().direct_space_state
	var from: Vector3 = cam.global_position
	var to: Vector3 = from - cam.global_transform.basis.z * RAY_LENGTH
	var q := PhysicsRayQueryParameters3D.create(from, to)
	q.collide_with_areas = true
	var hit := space.intersect_ray(q)
	if player_taken:
		_vis("PickUpButton", false)
		return
	if hit.is_empty():
		_vis("PickUpButton", false)
		_vis("MittenRing", false)
		_call_inv("no_object_text")
	else:
		var hit_node: Node = hit.get("collider")
		var tag := _tag_of(hit_node)
		_handle_tag(hit_node, tag)
	# trailing hint-text countdown (Unity Update tail)
	if _text_timer_on_off:
		_text_timer += delta
		if _text_timer > 3.0:
			_text_timer_on_off = false
			_text_timer = 0.0
			_call_inv("no_text")

func set_player_taken(v: bool) -> void:
	player_taken = v

# --- input entry points (scene UI buttons would call these) -----------------
func set_pick_up() -> void:
	pick_up = true
func set_drop_object() -> void:
	drop_object = true
	_on_drop_object()
func set_place_object() -> void:
	place_object = true
	_on_place_object()

# ===========================================================================
# Tag dispatch (mirrors the Update() else-if chain; Unity order preserved)
# ===========================================================================
func _handle_tag(hit_node: Node, tag: String) -> void:
	if tag == "avbitare":
		_item_pickup(hit_node, "avbitare", "CuttingPliersText", false)
	elif tag == "hammer":
		_item_pickup(hit_node, "hammare", "HammerText", false)
	elif tag == "vas":
		_item_pickup(hit_node, "vas", "", false)
	elif tag == "vas2":
		_item_pickup(hit_node, "vas2", "", false)
	elif tag == "safekey":
		_item_pickup(hit_node, "safekey", "SafeKeyText", true)
	elif tag == "exitkey":
		_item_pickup(hit_node, "exitkey", "MasterKeyText", true)
	elif tag == "hanglockkey":
		_item_pickup(hit_node, "hanglockkey", "PadlockKeyText", true)
	elif tag == "dpadlockCode":
		_item_pickup(hit_node, "padlockcode", "PadlockCodeText", false)
	elif tag == "armborst":
		_pickup_armborst(hit_node)
	elif tag == "arrow":
		_pickup_arrow(hit_node)
	elif tag == "weaponkey":
		_item_pickup(hit_node, "weaponkey", "WeaponKeyText", false)
	elif tag == "screwdriver":
		_item_pickup(hit_node, "screwdriver", "screwdriverText", false)
	elif tag == "plankawalk":
		_item_pickup(hit_node, "planka", "PlankText", false)
	elif tag == "battery":
		_item_pickup(hit_node, "battery", "BatteryText", false)
	elif tag == "tb1":
		_item_pickup(hit_node, "tb1", "PieceOfPaintingText", false)
	elif tag == "tb2":
		_item_pickup(hit_node, "tb2", "PieceOfPaintingText", false)
	elif tag == "tb3":
		_item_pickup(hit_node, "tb3", "PieceOfPaintingText", false)
	elif tag == "tb4":
		_item_pickup(hit_node, "tb4", "PieceOfPaintingText", false)
	elif tag == "playhousekey":
		_item_pickup(hit_node, "playhousekey", "PlayhouseKeyText", true)
	elif tag == "melon":
		_pickup_melon(hit_node)
	elif tag == "teddy":
		_pickup_teddy(hit_node)
	elif tag == "kugg1":
		_item_pickup(hit_node, "kugg1", "CogwheelText", false)
	elif tag == "kugg2":
		_item_pickup(hit_node, "kugg2", "CogwheelText", false)
	elif tag == "message":
		_item_pickup(hit_node, "message", "", false)
	elif tag == "brunnsvevpickup":
		_item_pickup(hit_node, "brunnsvev", "WinchHandleText", false)
	elif tag == "shotgun":
		_pickup_shotgun(hit_node)
	elif tag == "ammo":
		_pickup_ammo(hit_node)
	elif tag == "shotgunp1":
		_item_pickup(hit_node, "gundel1", "PartofShotgunText", false)
	elif tag == "shotgunp2":
		_item_pickup(hit_node, "gundel2", "PartofShotgunText", false)
	elif tag == "shotgunp3":
		_item_pickup(hit_node, "gundel3", "PartofShotgunText", false)
	elif tag == "carkey":
		_pickup_carkey(hit_node)
	elif tag == "topplock":
		_item_pickup(hit_node, "topplock", "EnginePartText", false)
	elif tag == "carbattery":
		_item_pickup(hit_node, "carbattery", "CarBatteryText", false)
	elif tag == "gascan":
		_item_pickup(hit_node, "gascan", "GasolineCanText", false)
	elif tag == "wrench":
		_item_pickup(hit_node, "wrench", "WrenchText", false)
	elif tag == "sparkplug":
		_item_pickup(hit_node, "sparkplug", "SparkPlugText", false)
	elif tag == "meat":
		_item_pickup(hit_node, "meat", "MeatText", false)
	elif tag == "specialkey":
		_item_pickup(hit_node, "specialkey", "SpecialKeyText", false)
	elif tag == "book":
		_item_pickup(hit_node, "book", "BookText", false)
	elif tag == "pepperspray":
		_pickup_pepperspray(hit_node)
	elif tag == "remotecontrol":
		_item_pickup(hit_node, "remote", "RemoteControlText", false)
	elif tag == "birdseed":
		_item_pickup(hit_node, "birdseed", "BirdSeedText", false)
	elif tag == "freezetrap":
		_item_pickup(hit_node, "freezetrap", "FreezeTrapText", false)
	elif tag == "bluekabel":
		_cut_cable(hit_node, "Larmlampa2", "KabelAV", false)
	elif tag == "bluekabelcellar":
		_cut_cable(hit_node, "Larmlampa1", "KabelAv", false)
	elif tag == "bluekabelvind":
		_cut_cable_fan(hit_node)
	elif tag == "planka":
		_break_planka(hit_node)
	elif tag == "plankavind":
		_break_planka_vind(hit_node)
	elif tag == "exitdoor":
		_open_exit_door(hit_node)
	elif tag == "hanglock":
		_unlock_hanglock(hit_node)
	elif tag == "hanglockgarage":
		_unlock_hanglock_garage(hit_node)
	elif tag == "phpadlock":
		_unlock_phpadlock(hit_node)
	elif tag == "dpadlock":
		_unlock_dpadlock(hit_node)
	elif tag == "batteryholder":
		_place_battery(hit_node)
	elif tag == "safedoor":
		_open_safedoor(hit_node)
	elif tag == "vapenskopdoor":
		_open_vapen_door(hit_node)
	elif tag == "tavelbitar":
		_tavelbitar_check(hit_node)
	elif tag == "screw1":
		_screw_out(hit_node, 1, "Screw1Open")
	elif tag == "screw2":
		_screw_out(hit_node, 2, "Screw2Open")
	elif tag == "camera":
		_smash_camera(hit_node)
	elif tag == "giljocutarea":
		_place_melon(hit_node)
	elif tag == "stortkugg":
		_place_kugg(hit_node)
	elif tag == "brunn":
		_place_brunnsvev(hit_node)
	elif tag == "screwout1":
		_screw_out(hit_node, 1, "ELscrew", "SpakBoxLock")
	elif tag == "screwout2":
		_screw_out(hit_node, 2, "ELscrew", "SpakBoxLock")
	elif tag == "screwout3":
		_screw_out(hit_node, 3, "ELscrew", "SpakBoxLock")
	elif tag == "screwout4":
		_screw_out(hit_node, 4, "ELscrew", "SpakBoxLock")
	elif tag == "topplocksskruv":
		_unscrew_topplock(hit_node)
	elif tag == "topplockPlace":
		_place_topplock(hit_node)
	elif tag == "carbatteryPlace":
		_place_carbattery(hit_node)
	elif tag == "fueltankPlace":
		_fueltank_hint(hit_node)
	elif tag == "sparkplugPlace":
		_place_sparkplug(hit_node)
	elif tag == "platevind":
		_place_meat(hit_node)
	elif tag == "vind2lock":
		_open_vind2(hit_node)
	elif tag == "bookplace":
		_place_book(hit_node)
	elif tag == "spak":
		_pull_spak(hit_node)
	elif tag == "lockmotor":
		_lock_motor_hint(hit_node)
	elif tag == "remoteLock":
		_remote_lock_hint(hit_node)
	elif tag == "birdseedplate":
		_fill_birdseed(hit_node)
	elif tag == "sprint1":
		_sprint_bar(hit_node, "sprint1Bort")
	elif tag == "sprint2":
		_sprint_bar(hit_node, "sprint2Bort")
	elif tag == "prisondoorlocked":
		_vis("MittenRing", false)
		pick_up = false
	elif tag == "smalldoorLocked":
		_vis("PickUpButton", false)
		_vis("RemoteControlText", false)
	elif tag == "Untagged" or tag == "golv" or tag == "grus" or tag == "car":
		_vis("PickUpButton", false)
		_vis("MittenRing", false)
		_call_inv("no_object_text")
	else:
		_vis("PickUpButton", false)
		_vis("MittenRing", false)
		_call_inv("no_object_text")
	_audio()

# ===========================================================================
# Pick-ups (inventory items)
# ===========================================================================
func _prompt(text_node: String) -> void:
	_vis("PickUpButton", true)
	_vis("MittenRing", true)
	if text_node != "":
		_vis(text_node, true)

func _item_pickup(hit_node: Node, id: String, text_node: String, key_sound: bool) -> void:
	if _inv == null or not _inv.has_method("have"):
		return
	_prompt(text_node)
	if not pick_up:
		return
	pick_up = false
	_call_inv("check_inventory")
	_call_inv("set_have", id, true)
	_free(hit_node)
	_vis("DropObjectButton", true)
	_vis("MittenRing", false)
	if text_node != "":
		_vis(text_node, false)

func _pickup_armborst(hit_node: Node) -> void:
	_prompt("CrossbowText")
	if not pick_up:
		return
	pick_up = false
	_call_inv("check_inventory")
	_call_inv("set_have", "armborst", true)
	_free(hit_node)
	_vis("ArrowButton", false)
	_vis("StunnSyringe", false)
	_vis("Laddad", false)
	_vis("Oladdad", true)
	_vis("DropObjectButton", true)
	_vis("MittenRing", false)
	_vis("CrossbowText", false)
	_call_sfx("crossbow_load")

func _pickup_arrow(hit_node: Node) -> void:
	_prompt("TranquilizerDartText")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("armborst"):
		_call_inv("no_text")
		_show_need("NeedCrossbowText")
		return
	if _inv_has("arrow"):
		# picking a dart while already loaded: equip and spawn a spare
		_call_inv("set_have", "arrow", true)
		_free(hit_node)
		_equip_dart()
		_spawn_drop_prefab("StunnSyringe")
	else:
		_call_inv("set_have", "arrow", true)
		_free(hit_node)
		_equip_dart()

func _equip_dart() -> void:
	_vis("ArrowButton", true)
	_vis("ArrowRay", true)
	_vis("StunnSyringe", true)
	_vis("Laddad", true)
	_vis("Oladdad", false)
	_vis("MittenRing", false)
	_vis("TranquilizerDartText", false)
	_call_inv("set_armborst_arrow_ok", true)
	_call_sfx("crossbow_load")

func _pickup_melon(hit_node: Node) -> void:
	_prompt("MelonText")
	if not pick_up:
		return
	pick_up = false
	_call_inv("check_inventory")
	_call_inv("set_have", "melon", true)
	_free(hit_node)
	_text_timer = 0.0
	if not _have_seen_melon_text:
		_have_seen_melon_text = true
		_vis("SomethingInsideMelon", true)
		_text_timer_on_off = true
	_vis("DropObjectButton", true)
	_vis("MittenRing", false)
	_vis("MelonText", false)

func _pickup_teddy(hit_node: Node) -> void:
	_prompt("TeddyText")
	if not pick_up:
		return
	pick_up = false
	_call_inv("check_inventory")
	_call_inv("set_have", "teddy", true)
	_free(hit_node)
	_call_granny("set_player_have_teddy", true)
	_vis("DropObjectButton", true)
	_vis("MittenRing", false)
	_vis("TeddyText", false)

func _pickup_carkey(hit_node: Node) -> void:
	_prompt("CarKeyText")
	if not pick_up:
		return
	pick_up = false
	_call_inv("check_inventory")
	_call_inv("set_have", "carkey", true)
	_free(hit_node)
	_call_game_controller("set_player_have_car_key", true)
	_vis("DropObjectButton", true)
	_vis("MittenRing", false)
	_vis("CarKeyText", false)

func _pickup_shotgun(hit_node: Node) -> void:
	_prompt("ShotgunText")
	if not pick_up:
		return
	pick_up = false
	_call_inv("check_inventory")
	_call_inv("set_have", "oldshotgun", true)
	_free(hit_node)
	if _old_shotgun_loaded:
		_vis("Ammo", true)
		_play_anim_on(_find("ShotgunHand"), "Load")
		_vis("GunButton", true)
		_vis("GunRay_MainCamera", true)
		_call_sfx("loaded_pickup")
	else:
		_play_anim_on(_find("ShotgunHand"), "OpenEmpty")
		_vis("GunButton", false)
		_vis("GunRay_MainCamera", false)
		_vis("Ammo", false)
		_call_sfx("empty_shotgun")
	_vis("DropObjectButton", true)
	_vis("MittenRing", false)
	_vis("ShotgunText", false)

func _pickup_ammo(hit_node: Node) -> void:
	_prompt("AmmoText")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("oldshotgun"):
		_call_inv("no_text")
		_show_need("NeedShotgunText")
		return
	if not _old_shotgun_loaded:
		_old_shotgun_loaded = true
		_free(hit_node)
		_vis("GunButton", true)
		_vis("GunRay_MainCamera", true)
		_vis("Ammo", true)
		_play_anim_on(_find("ShotgunHand"), "Load")
		_vis("MittenRing", false)
		_vis("AmmoText", false)
		_call_sfx("load_shotgun")
	else:
		_show_need("ShotgunLoadedText")

func _pickup_pepperspray(hit_node: Node) -> void:
	_prompt("PeppersprayText")
	if not pick_up:
		return
	pick_up = false
	_call_inv("check_inventory")
	_call_inv("set_have", "pepperspray", true)
	_free(hit_node)
	_call(_find("PeppersprayButton"), "set_spray_time", false)
	_vis("PepperSpray", false)
	_vis("PeppersprayButton", true)
	_vis("DropObjectButton", true)
	_vis("MittenRing", false)
	_vis("PeppersprayText", false)

# ===========================================================================
# World interactions
# ===========================================================================
func _cut_cable(hit_node: Node, lamp: String, cut_visual: String, _cellar: bool) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("avbitare"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedCuttingPliersText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_vis(lamp + "_green", false)  # color swap handled by MaterialFixer hook below
		var lamp_node := _find(lamp)
		if lamp_node != null:
			_material_color(lamp_node, Color(0.0, 1.0, 0.0))
		if _call_game_controller("lampa_ok", _lampa_index(lamp)):
			pass
	_free(hit_node)
	_vis(cut_visual, true)

func _lampa_index(lamp: String) -> int:
	return 2 if lamp == "Larmlampa2" else 1

func _cut_cable_fan(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("avbitare"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedCuttingPliersText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		var fan := _find("Fan")
		_stop_anim_on(fan, "FanSpinn")
		_vis("FanCollider", false)
	_free(_find("KabelFan"))
	_vis("KabelAvFan", true)

func _break_planka(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("hammare"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedHammerText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		var plank1 := _game_flag("planka1Bort", false)
		if plank1:
			_call_game_controller("planka_2_bort", true)
			_mark_tag(hit_node, "Untagged")
		else:
			_set_rigid_free(hit_node, true)
			_call_game_controller("planka_1_bort", true)

func _break_planka_vind(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("hammare"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedHammerText")
		_audio()
		return
	_set_rigid_free(hit_node, true)
	_mark_tag(hit_node, "plankawalk")

func _open_exit_door(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("exitkey"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedMasterKeyText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_call_game_controller("open_exit_door")

func _unlock_hanglock(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("hanglockkey"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedPadlockKeyText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_set_rigid_free(hit_node, true)
		_set_rigid_free(_find("Bom"), true)
		_call_game_controller("hang_lock_bort", true)
		_mark_tag(hit_node, "Untagged")

func _unlock_hanglock_garage(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("hanglockkey"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedPadlockKeyText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_set_rigid_free(hit_node, true)
		_call(_find("DoorRay"), "set_garageport_lock", true)
		_mark_tag(hit_node, "Untagged")

func _unlock_phpadlock(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("playhousekey"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedPlayhouseKeyText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_set_rigid_free(hit_node, true)
		_mark_tag(_find("LekhusDoor"), "innerdoorClosed")
		_mark_tag(hit_node, "Untagged")

func _unlock_dpadlock(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("padlockcode"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedPadlockCodeText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_set_rigid_free(hit_node, true)
		_play_anim_on(_find("L1"), "DlockAnim")
		_call_game_controller("dpadlock_bort", true)
		_mark_tag(hit_node, "Untagged")

func _place_battery(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("battery"):
		_call_inv("no_text")
		_text_timer = 0.0
		_text_timer_on_off = true
		_show_need("NeedBatteryText")
		_play_anim_on(_find("BatterySpak"), "BattSpakNotOK")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_play_anim_on(hit_node, "BatteryLockOpen")
		_call_game_controller("battery_lock_ok", true)
		_play_anim_on(_find("BatterySpak"), "BattSpakOK")
		_call_inv("set_have", "battery", false)
		_vis("BatteryInPlace", true)
		_vis("DropObjectButton", false)
		_mark_tag(hit_node, "Untagged")

func _open_safedoor(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("safekey"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedSafeKeyText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_play_anim_on(hit_node, "safeDoorOpen")
		_mark_tag(hit_node, "Untagged")

func _open_vapen_door(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("weaponkey"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedWeaponKeyText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_play_anim_on(hit_node, "VapenDoorOpen")
		_mark_tag(hit_node, "Untagged")

func _tavelbitar_check(hit_node: Node) -> void:
	var all_placed := _game_flag("alla_tavelbitar_on_place", false)
	if not all_placed:
		_vis("PickUpButton", true)
		_vis("MittenRing", true)
		if pick_up:
			pick_up = false
			_show_need("SaknasBitarAvTavlan")
			_text_timer_on_off = true
	else:
		_vis("PickUpButton", false)
		_vis("MittenRing", false)

func _screw_out(hit_node: Node, idx: int, anim: String, comp: String = "Skruvplatta") -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("screwdriver"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedScrewdriverText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_play_anim_on(hit_node, anim)
		_mark_tag(hit_node, "Untagged")
		_call(_find(comp), "set_skruv", idx)
		_call(_find(comp), "screw_bort", idx)

func _smash_camera(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("hammare"):
		_call_inv("no_text")
		_text_timer = 0.0
		_text_timer_on_off = true
		_show_need("NeedHammerText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_vis("Kamera", false)
		_vis("KameraBroken", true)
		if not _game_flag("player_in_prison", false):
			_vis("PlayerPrisonTrigger", false)
			var galler := _find("PrisonGaller")
			if galler != null:
				_enable_colliders(galler, true)
			_vis("GallerColliders", false)
		_mark_tag(hit_node, "Untagged")

func _place_melon(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("melon"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("DangerousCuttingToolText")
		_text_timer_on_off = true
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_vis("CutAreaTriggerText", false)
		_vis("Melon", true)
		_call(_find("KlingTrigger"), "set_melon_in_place", true)
		_call_inv("set_have", "melon", false)
		pick_up = false
		drop_object = false
		_vis("DropObjectButton", false)
		_vis("MittenRing", false)

func _place_kugg(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	var have1 := _inv_has("kugg1")
	var have2 := _inv_has("kugg2")
	if not have1 and not have2:
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("SomethingMissingHereText")
		_text_timer_on_off = true
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		if have1:
			_vis("Kugg1", true)
			_place_gear_done(hit_node, "kugg1")
		elif have2:
			_vis("Kugg2", true)
			_place_gear_done(hit_node, "kugg2")

func _place_gear_done(hit_node: Node, which: String) -> void:
	_call_inv("set_have", which, false)
	pick_up = false
	drop_object = false
	_vis("DropObjectButton", false)
	_vis("MittenRing", false)
	if which == "kugg1":
		_kugg1_ok = true
	elif which == "kugg2":
		_kugg2_ok = true
	if _kugg1_ok and _kugg2_ok:
		_play_anim_on(_find("LekhusToyLock"), "openToyLock")
		_mark_tag(hit_node, "Untagged")

var _kugg1_ok := false
var _kugg2_ok := false

func _place_brunnsvev(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("brunnsvev"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedWinchHandleText")
		_text_timer_on_off = true
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_vis("BrunnsVev", true)
		_vis("PickUpButton", false)
		_call(_find("BrunnsvevRay"), "set_vev_in_place", true)
		_disable_colliders(hit_node)
		_call_inv("set_have", "brunnsvev", false)
		pick_up = false
		drop_object = false
		_vis("DropObjectButton", false)
		_vis("MittenRing", false)

func _unscrew_topplock(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("wrench"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedWrenchText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_call_game_controller("topplock_skruv_add")
		_free(hit_node)

func _place_topplock(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("topplock"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedEnginePartText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_call_game_controller("topplock_ok", true)
		_vis("TopplockInPlace", true)
		_call_inv("set_have", "topplock", false)
		_vis("DropObjectButton", false)
		_free(hit_node)

func _place_carbattery(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("carbattery"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedCarBatteryText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_call_game_controller("car_battery_ok", true)
		_vis("CarBatteryInPlace", true)
		_call_inv("set_have", "carbattery", false)
		_free(hit_node)
		_vis("DropObjectButton", false)

func _fueltank_hint(hit_node: Node) -> void:
	_vis("MittenRing", true)
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("gascan") and not _play_sound:
		_call_inv("no_text")
		_play_sound = true
		_text_timer = 0.0
		_show_need("NeedGasolineText")
		_text_timer_on_off = true

func _place_sparkplug(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("sparkplug"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedSparkPlugText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_call_game_controller("sparkplug_ok", true)
		_vis("SparkPlugOnPlace", true)
		_vis("SparkplugCable", false)
		_call_inv("set_have", "sparkplug", false)
		_vis("DropObjectButton", false)

func _place_meat(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("meat"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("EmptyPlateText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		var spider := _find("SpiderParent")
		if spider != null and spider.visible:
			_call(spider, "set_food_time", true)
		_vis("MeatOnPlate", true)
		_vis("SpiderStartTrigger", false)
		_call_inv("set_have", "meat", false)
		_vis("DropObjectButton", false)
		_free(hit_node)

func _open_vind2(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("specialkey"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("NeedSpecialKey")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_play_anim_on(_find("SpecialKeyLock"), "vind2LockOpen")
		_play_anim_on(_find("Vind2Door"), "vind2DoorOpen")
		_vis("SpecialKeyInPlace", true)
		_call_inv("set_have", "specialkey", false)
		_vis("DropObjectButton", false)
		_mark_tag(hit_node, "Untagged")

func _place_book(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("book"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("MaybePlaceSomethingHere")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_play_anim_on(_find("FakeWall"), "fakeWallMove")
		_vis("BookParent", true)
		_call_inv("set_have", "book", false)
		_vis("DropObjectButton", false)
		_mark_tag(hit_node, "Untagged")
		if _granny != null:
			var hb: bool = _granny.get("hit_by_arrow") if _granny.get("hit_by_arrow") != null else false
			var hp: bool = _granny.get("hit_by_pepper") if _granny.get("hit_by_pepper") != null else false
			var fz: bool = _granny.get("freeze") if _granny.get("freeze") != null else false
			if not hb and not hp and not fz:
				if _granny_start_pos != null:
					_granny.visible = false
					_granny.global_position = _granny_start_pos.global_position
					_granny.visible = true
		_call_game_controller("slendrina_mom_appeared", true)

func _pull_spak(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _play_sound:
		_play_sound = true
		_play_anim_on(hit_node, "Spak")
		_mark_tag(hit_node, "Untagged")
		_call_game_controller("extreme_lock_ok", true)
		_vis("LockActive", false)
		_vis("LockDeActive", true)

func _lock_motor_hint(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	_call_inv("no_text")
	pick_up = false
	_text_timer = 0.0
	_show_need("NeedFindSwitchText")
	_text_timer_on_off = true

func _remote_lock_hint(hit_node: Node) -> void:
	_prompt("")
	if pick_up and not _inv_has("remote"):
		_call_inv("no_text")
		pick_up = false
		_text_timer = 0.0
		_show_need("NeedRemoteControlText")
		_text_timer_on_off = true

func _fill_birdseed(hit_node: Node) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _inv_has("birdseed"):
		_call_inv("no_text")
		_text_timer = 0.0
		_show_need("EmptyBowlText")
		_audio()
		return
	if not _play_sound:
		_play_sound = true
		_mark_tag(hit_node, "Untagged")
		_call(_find("CrowParent"), "set_crow_start_eat", true)

func _sprint_bar(hit_node: Node, flag: String) -> void:
	_prompt("")
	if not pick_up:
		return
	pick_up = false
	if not _play_sound:
		_play_sound = true
		_play_anim_on(hit_node, "sprintAnim")
		_mark_tag(hit_node, "Untagged")
		_call(_find("prisonDoor"), "set_sprint_bort", flag)

# --- drop / place actions ---------------------------------------------------
func _on_drop_object() -> void:
	drop_object = false
	if _inv != null and _inv.has_method("check_inventory"):
		_inv.call("check_inventory")

func _on_place_object() -> void:
	place_object = false
	if _inv != null and _inv.has_method("place_planka_hole"):
		_inv.call("place_planka_hole")

# ===========================================================================
# helpers
# ===========================================================================
func _audio() -> void:
	_play_sound = false

func _show_need(text_node: String) -> void:
	_vis(text_node, true)
	_text_timer_on_off = true

func _inv_has(id: String) -> bool:
	if _inv == null or not _inv.has_method("have"):
		return false
	return _inv.call("have", id)

func _game_flag(prop: String, def: bool) -> bool:
	if _game_controller == null:
		return def
	var v = _game_controller.get(prop)
	return bool(v) if v != null else def

func _material_color(node: Node, c: Color) -> void:
	for mi in node.find_children("*", "MeshInstance3D", true, false):
		if mi.material_override == null:
			mi.material_override = StandardMaterial3D.new()
		mi.material_override.albedo_color = c

func _set_rigid_free(node: Node, free: bool) -> void:
	if node == null:
		return
	for rb in node.find_children("*", "RigidBody3D", true, false):
		rb.freeze = not free
	if node is RigidBody3D:
		node.freeze = not free

func _enable_colliders(node: Node, enabled: bool) -> void:
	for cs in node.find_children("*", "CollisionShape3D", true, false):
		(cs as CollisionShape3D).disabled = not enabled

func _disable_colliders(node: Node) -> void:
	_enable_colliders(node, false)

func _stop_anim_on(node: Node, clip: String) -> void:
	var ap := _anim_player_of(node)
	if ap != null and ap.has_animation(clip) and ap.current_animation == clip:
		ap.stop()

func _play_anim_on(node: Node, clip: String) -> void:
	var ap := _anim_player_of(node)
	if ap != null and ap.has_animation(clip):
		ap.play(clip, 0.2)

func _anim_player_of(node: Node) -> AnimationPlayer:
	if node == null:
		return null
	var ap := node.get_node_or_null("AnimationPlayer") as AnimationPlayer
	if ap == null:
		for c in node.find_children("*", "AnimationPlayer", true, false):
			return c as AnimationPlayer
	return ap

func _vis(name: String, v: bool) -> void:
	var n := _find(name)
	if n != null:
		n.visible = v

func _free(node: Node) -> void:
	if node != null and is_instance_valid(node):
		node.queue_free()

func _spawn_drop_prefab(prefab_name: String) -> void:
	var dp := _find("DropPoint")
	if dp == null:
		return
	var scene := load("res://converted/prefabs/%s.tscn" % prefab_name) as PackedScene
	if scene == null:
		return
	var inst := scene.instantiate()
	var root := get_tree().current_scene
	if root == null:
		return
	root.add_child(inst)
	inst.global_position = dp.global_position
	inst.global_rotation = dp.global_rotation

func _tag_of(node: Node) -> String:
	var n := node
	for _i in 8:
		if n == null:
			return "Untagged"
		if n.has_meta("unity_tag"):
			return n.get_meta("unity_tag")
		for g in n.get_groups():
			if g.begins_with("unity_"):
				return g.substr(6)
		n = n.get_parent()
	return "Untagged"

func _mark_tag(node: Node, tag: String) -> void:
	if node == null:
		return
	node.set_meta("unity_tag", tag)
	for g in node.get_groups():
		if g.begins_with("unity_"):
			node.remove_from_group(g)
	if tag != "Untagged":
		node.add_to_group("unity_" + tag)

func _find(name: String) -> Node:
	if name.is_empty():
		return null
	var root := get_tree().current_scene if is_inside_tree() else null
	if root == null:
		return null
	var query := _san(name)
	for c in root.find_children("*", "", true, false):
		if c.name == query or c.name.begins_with(query + "_"):
			return c
	return null

func _san(name: String) -> String:
	var out := ""
	var prev := false
	for ch in name:
		var keep := (ch >= "a" and ch <= "z") or (ch >= "A" and ch <= "Z") \
				or (ch >= "0" and ch <= "9") or ch == "_" or ch == "." or ch == "-"
		if keep:
			out += ch
			prev = ch == "_"
		elif not prev:
			out += "_"
			prev = true
	while out.length() > 0 and out[0] == "_":
		out = out.substr(1)
	while out.length() > 0 and out[out.length() - 1] == "_":
		out = out.substr(0, out.length() - 1)
	return out

func _call(node: Node, method: String, a: Variant = null, b: Variant = null) -> bool:
	if node == null or not node.has_method(method):
		return false
	if b != null:
		node.call(method, a, b)
	elif a != null:
		node.call(method, a)
	else:
		node.call(method)
	return true

func _call_inv(method: String, a: Variant = null, b: Variant = null) -> bool:
	return _call(_inv, method, a, b)

func _call_granny(method: String, a: Variant = null, b: Variant = null) -> bool:
	return _call(_granny, method, a, b)

func _call_game_controller(method: String, a: Variant = null, b: Variant = null) -> bool:
	return _call(_game_controller, method, a, b)

func _call_sfx(method: String) -> void:
	if _sound_holder != null and _sound_holder.has_method(method):
		_sound_holder.call(method)
