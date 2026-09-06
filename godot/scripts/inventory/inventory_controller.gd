extends Node3D
## Semantic port of Unity `InventoryController.cs` (819 lines). Holds the player's
## carried-item state and the drop logic, and owns the on-screen hint texts.
##
## Unity -> Godot mapping:
##   GetComponent<InventoryController>(gameController) -> this script is attached to
##     the GameController node (converter wiring via ported_scripts.json).
##   public GameObject haveX bool fields   -> _items flag dict keyed by item id
##   Object.Instantiate(newX, dropPoint)  -> load res://converted/prefabs/<X>.tscn,
##     instantiate at the DropPoint node (looked up by name).
##   UI (dropObjectButton/placeObjectButton/text nodes) -> looked up by name; they
##     are Unity Canvas children that the scene converter does not emit yet, so all
##     UI toggles are guarded no-ops until UI conversion lands.
##
## Cross-component calls that the original made through GetComponent<...> on
## GameController/Granny are dispatched via guarded _call (absent ports are skipped;
## see migration log).

# --- items: id -> {hand node name, drop prefab tscn (optional), special handling}
const DROP_ORDER := [
	"avbitare", "hammare", "vas", "safekey", "exitkey", "hanglockkey", "padlockcode",
	"armborst", "weaponkey", "screwdriver", "planka", "battery", "tb1", "tb2", "tb3",
	"tb4", "vas2", "playhousekey", "melon", "teddy", "kugg1", "kugg2", "message",
	"brunnsvev", "oldshotgun", "gundel1", "gundel2", "gundel3", "carkey", "topplock",
	"carbattery", "gascan", "wrench", "sparkplug", "meat", "specialkey", "book",
	"pepperspray", "remote", "birdseed", "freezetrap",
]

const ITEMS := {
	"avbitare": {"hand": "AvbitareHand", "drop": "Avbitare"},
	"hammare": {"hand": "HammerHand", "drop": "Hammer"},
	"vas": {"hand": "VasHand", "drop": "Vas"},
	"vas2": {"hand": "Vas2Hand", "drop": "Vas2"},
	"safekey": {"hand": "SafeKeyHand", "drop": "SafeKey"},
	"exitkey": {"hand": "HouseKeyHand", "drop": "HouseKey"},
	"hanglockkey": {"hand": "HanglockKeyHand", "drop": "HanglockKey"},
	"padlockcode": {"hand": "CodePlattaHand", "drop": "CodePlatta"},
	"armborst": {"hand": "ArmborstHand", "drop": "Armborst", "ui_off": ["ArrowButton", "ArrowRay", "StunnSyringe"]},
	"weaponkey": {"hand": "VapennyckelHand", "drop": "Vapennyckel"},
	"screwdriver": {"hand": "ScrewdriverHand", "drop": "Screwdriver"},
	"planka": {"hand": "PlankaHand", "drop": "PlankaWalk", "place_reset": true},
	"battery": {"hand": "BatteryHand", "drop": "Battery"},
	"tb1": {"hand": "TB1Hand", "drop": "TB1"},
	"tb2": {"hand": "TB2Hand", "drop": "TB2"},
	"tb3": {"hand": "TB3Hand", "drop": "TB3"},
	"tb4": {"hand": "TB4Hand", "drop": "TB4"},
	"playhousekey": {"hand": "playHouseKey", "drop": "playHouseKey"},
	"melon": {"hand": "MelonHand", "drop": "MelonPickUp"},
	"teddy": {"hand": "TeddyHand", "drop": "Teddy", "granny_flag": "set_player_have_teddy"},
	"kugg1": {"hand": "Kugg1Hand", "drop": "Kugg1Object"},
	"kugg2": {"hand": "Kugg2Hand", "drop": "Kugg2Object"},
	"message": {"hand": "TextMessageHand", "drop": "TextMessage"},
	"brunnsvev": {"hand": "BrunnsVevHand", "drop": "BrunnsVevPickup"},
	"oldshotgun": {"hand": "OldShotgunHand", "drop": "ShotgunDrop_Prefab", "ui_off": ["GunButton", "GunRay_MainCamera"]},
	"gundel1": {"hand": "ShotgunHandP1", "drop": "ShotgunP1"},
	"gundel2": {"hand": "ShotgunHandP2", "drop": "ShotgunP2"},
	"gundel3": {"hand": "ShotgunHandP3", "drop": "ShotgunP3"},
	"carkey": {"hand": "CarkeyHand", "drop": "Carkey", "car_flag": "set_player_have_car_key"},
	"topplock": {"hand": "TopplockHand", "drop": "Topplock"},
	"carbattery": {"hand": "CarBatteryHand", "drop": "CarBattery"},
	"gascan": {"hand": "BensindunkHand", "drop": "Bensindunk"},
	"wrench": {"hand": "WrenchHand", "drop": "Wrench"},
	"sparkplug": {"hand": "SparkPlugHand", "drop": "SparkPlug"},
	"meat": {"hand": "MeatHand", "drop": "Meat"},
	"specialkey": {"hand": "SpecialKeyHand", "drop": "SpecialKey"},
	"book": {"hand": "BookHand", "drop": "Book"},
	"pepperspray": {"hand": "PepperSprayHand", "drop": "PepperSpray"},
	"remote": {"hand": "RemoteControlHand", "drop": "RemoteControl"},
	"birdseed": {"hand": "BirdSeedBoxHand", "drop": "BirdSeedBox"},
	"freezetrap": {"hand": "FreezeTrapHand", "drop": "FreezeTrap"},
}

# texts shown / hidden by NoText / NoObjectText (Unity Canvas children)
const NEED_TEXTS := [
	"NeedPadlockKeyText", "NeedHammerText", "NeedSafeKeyText", "NeedCuttingPliersText",
	"NeedMasterKeyText", "NeedPadlockCodeText", "NeedCrossbowText", "CantOpenDoorYet",
	"NeedWeaponKeyText", "NeedScrewdriverText", "NeedBatteryText", "SaknasBitarAvTavlan",
	"NeedPlayhouseKeyText", "DangerousCuttingToolText", "SomethingMissingHereText",
	"SomethingInsideMelon", "NeedWinchHandleText", "NeedFindSwitchText", "NeedShotgunText",
	"ShotgunLoadedText", "NeedCarKeyText", "NeedCarBatteryText", "NeedGasolineText",
	"NeedEnginePartText", "NeedWrenchText", "NeedSparkPlugText", "EmptyPlateText",
	"NeedSpecialKey", "NeedRemoteControlText", "MaybePlaceSomethingHere", "MaybeUsePlanksText",
]
const OBJECT_TEXTS := [
	"CuttingPliersText", "HammerText", "SafeKeyText", "MasterKeyText", "PadlockCodeText",
	"CrossbowText", "TranquilizerDartText", "WeaponKeyText", "screwdriverText", "PlankText",
	"BatteryText", "PieceOfPaintingText", "PlayhouseKeyText", "MelonText", "TeddyText",
	"CogwheelText", "WinchHandleText", "PartofShotgunText", "ShotgunText", "AmmoText",
	"CarKeyText", "EnginePartText", "SparkPlugText", "GasolineCanText", "CarBatteryText",
	"WrenchText", "MeatText", "SpecialKeyText", "BookText", "PeppersprayText",
	"RemoteControlText", "BirdSeedText", "EmptyBowlText", "FreezeTrapText", "PadlockKeyText",
]

var _flags: Dictionary = {}
var old_shotgun_loaded := false
var armborst_arrow_ok := false
var have_arrow := false
var place_object := false
var planka_highlighted := false

var _granny: Node
var _text_timer := 0.0
var _text_timer_on_off := false

func _ready() -> void:
	_granny = _find("GrannyParent")

func _process(delta: float) -> void:
	if _text_timer_on_off:
		_text_timer += delta
		if _text_timer > 3.0:
			_text_timer_on_off = false
			_text_timer = 0.0
			no_text()
			no_object_text()

# --- item flags ------------------------------------------------------------
func have(item: String) -> bool:
	if item == "arrow":
		return have_arrow
	return _flags.get(item, false)

func set_have(item: String, v: bool) -> void:
	if item == "arrow":
		have_arrow = v
		return
	_flags[item] = v
	if v:
		var info: Dictionary = ITEMS.get(item, {})
		if info.has("hand"):
			var hand := _find(info["hand"])
			if hand != null:
				hand.visible = true
	elif item == "teddy":
		_call(_granny, "set_player_have_teddy", false)
	elif item == "carkey":
		_call(game_controller(), "set_player_have_car_key", false)

func set_armborst_arrow_ok(v: bool) -> void:
	armborst_arrow_ok = v

func set_old_shotgun_loaded(v: bool) -> void:
	old_shotgun_loaded = v

func is_old_shotgun_loaded() -> bool:
	return old_shotgun_loaded

func have_any() -> bool:
	for item in DROP_ORDER:
		if _flags.get(item, false):
			return true
	return have_arrow

func current_item() -> String:
	for item in DROP_ORDER:
		if _flags.get(item, false):
			return item
	return ""

# --- drop logic (Unity CheckInventory) --------------------------------------
func check_inventory() -> void:
	var held := current_item()
	if held == "":
		return
	_drop(held)

func _drop(item: String) -> void:
	_flags[item] = false
	var info: Dictionary = ITEMS[item]
	var hand := _find(info["hand"])
	if hand != null:
		hand.visible = false
	# hide UI bits bound to this item
	for ui in info.get("ui_off", []):
		var n := _find(ui)
		if n != null:
			n.visible = false
	if info.has("place_reset"):
		place_object = false
		_vis("PlaceObjectButton", false)
	if item == "armborst":
		if armborst_arrow_ok:
			_spawn_drop("StunnSyringe")
			have_arrow = false
			armborst_arrow_ok = false
	if item == "oldshotgun":
		_vis("GunButton", false)
		_vis("GunRay_MainCamera", false)
	if info.has("granny_flag"):
		_call(_granny, info["granny_flag"], false)
	if info.has("car_flag"):
		_call(game_controller(), info["car_flag"], false)
	var drop: String = info.get("drop", "")
	if drop != "":
		_spawn_drop(drop)
	_vis("DropObjectButton", false)
	# Unity ends CheckInventory with textTimerOnOff = true
	_text_timer_on_off = true

func _spawn_drop(prefab_name: String) -> void:
	var drop_point := _find("DropPoint")
	if drop_point == null:
		return
	var scene := load("res://converted/prefabs/%s.tscn" % prefab_name) as PackedScene
	if scene == null:
		push_warning("InventoryController: drop prefab missing: %s" % prefab_name)
		return
	var inst := scene.instantiate()
	var root := get_tree().current_scene
	if root == null:
		return
	root.add_child(inst)
	inst.global_position = drop_point.global_position
	inst.global_rotation = drop_point.global_rotation

# --- plank placement --------------------------------------------------------
func place_planka_hole() -> void:
	if not planka_highlighted:
		return
	planka_highlighted = false
	_vis("plankaHighlight", false)
	_vis("placePlankaTrigger", false)
	_vis("PlankaOverHole", true)
	_flags["planka"] = false
	place_object = false
	_vis("PlaceObjectButton", false)
	_vis("DropObjectButton", false)
	_vis("MittenRing", false)

func set_planka_highlighted(v: bool) -> void:
	planka_highlighted = v

# --- hint texts -------------------------------------------------------------
func no_text() -> void:
	for t in NEED_TEXTS:
		_vis(t, false)

func no_object_text() -> void:
	_vis("PickUpButton", false)
	_vis("MittenRing", false)
	for t in OBJECT_TEXTS:
		_vis(t, false)

func planktext_timer() -> void:
	_text_timer_on_off = true
	_vis("MaybeUsePlanksText", true)

# --- helpers ----------------------------------------------------------------
func game_controller() -> Node:
	return self

func _vis(name: String, v: bool) -> void:
	var n := _find(name)
	if n != null:
		n.visible = v

func _find(name: String) -> Node:
	if name.is_empty():
		return null
	var root := get_tree().current_scene if is_inside_tree() else null
	if root == null:
		return null
	var query := _san(name)
	# prefer children of the GameController subtree first (UI/canvas lives elsewhere)
	for c in root.find_children("*", "", true, false):
		if c.name == query or c.name.begins_with(query + "_"):
			return c
	return null

func _san(name: String) -> String:
	# mirrors the converter's node-name sanitization exactly
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

func _call(node: Node, method: String, arg: Variant = null) -> void:
	if node == null or not node.has_method(method):
		return
	if arg == null:
		node.call(method)
	else:
		node.call(method, arg)
