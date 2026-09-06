extends Node
## GameState autoload — replaces Unity PlayerPrefs + BetweenScenesValues statics.
## Difficulty values mirror the Unity project:
##   DiffData: 0=Normal 1=Easy 2=Hard 3=Extreme 4=Easy(?) 5=Extreme(?)  (see migration log)
## Persisted keys (original names kept for parity): DiffData, NightMareOnOff,
## MusicOnOff, sensitivity, etc.

const SAVE_PATH := "user://granny_save.json"

# --- runtime cross-scene values (former BetweenScenesValues statics) ---
var difficulty_easy: bool = false
var difficulty_medium: bool = false
var difficulty_hard: bool = false

# --- current run state ---
var current_day: int = 1            # 1..5
var granny_killed: bool = false
var player_dead: bool = false
var end_scene_running: bool = false

var _values: Dictionary = {}

func _ready() -> void:
	load_data()

# ---------- PlayerPrefs-ish API (key -> Variant) ----------
func get_int(key: String, def: int = 0) -> int:
	var v = _values.get(key)
	return int(v) if v != null else def

func get_float(key: String, def: float = 0.0) -> float:
	var v = _values.get(key)
	return float(v) if v != null else def

func get_string(key: String, def: String = "") -> String:
	var v = _values.get(key)
	return str(v) if v != null else def

func set_int(key: String, value: int) -> void:
	_values[key] = value

func set_float(key: String, value: float) -> void:
	_values[key] = value

func set_string(key: String, value: String) -> void:
	_values[key] = value

func has(key: String) -> bool:
	return _values.has(key)

func save_data() -> void:
	var f := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if f:
		f.store_string(JSON.stringify(_values))
		f.close()

func load_data() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var f := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if f:
		var data: Variant = JSON.parse_string(f.get_as_text())
		f.close()
		if data is Dictionary:
			_values = data

func reset_data() -> void:
	_values.clear()
	save_data()

# ---------- scene flow ----------
func goto_scene(path: String) -> void:
	get_tree().change_scene_to_file(path)

func start_game() -> void:
	current_day = 1
	granny_killed = false
	player_dead = false
	set_int("DiffData", get_int("DiffData", 0))
	goto_scene("res://converted/scenes/Scene.tscn")