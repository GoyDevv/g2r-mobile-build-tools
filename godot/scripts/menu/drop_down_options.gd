extends Node3D
## Port of Unity `dropDownOptions.cs`: maps the difficulty Dropdown index
## (0=Extreme 1=Hard 2=Normal 3=Easy 4=Practise) to PlayerPrefs DiffData /
## fogOnExtreme and the matching mode flags. Dropdown UI not converted, so the
## port exposes set_diff_value(value) that a future UI dropdown can call.

var easy_mode_on := false
var normal_mode_on := false
var hard_mode_on := false
var extreme_mode_on := false
var practise_mode_on := false

func _ready() -> void:
	Engine.time_scale = 1.0
	# restore the dropdown position from the saved difficulty
	var saved := GameState.get_int("DiffData", 0)
	match saved:
		0: _dropdown_value = 2
		1: _dropdown_value = 3
		2: _dropdown_value = 1
		3: _dropdown_value = 0
		4: _dropdown_value = 4

var _dropdown_value := 2

func get_dropdown_value() -> int:
	return _dropdown_value

func set_dropdown_value(v: int) -> void:
	_dropdown_value = v

func diff_options() -> void:
	normal_mode_on = false
	easy_mode_on = false
	hard_mode_on = false
	extreme_mode_on = false
	practise_mode_on = false
	match _dropdown_value:
		0:
			extreme_mode_on = true
			GameState.set_int("DiffData", 3)
			GameState.set_int("fogOnExtreme", 1)
		1:
			hard_mode_on = true
			GameState.set_int("DiffData", 2)
			GameState.set_int("fogOnExtreme", 0)
		2:
			normal_mode_on = true
			GameState.set_int("DiffData", 0)
			GameState.set_int("fogOnExtreme", 0)
		3:
			easy_mode_on = true
			GameState.set_int("DiffData", 1)
			GameState.set_int("fogOnExtreme", 0)
		4:
			practise_mode_on = true
			GameState.set_int("DiffData", 4)
			GameState.set_int("fogOnExtreme", 0)
	GameState.save_data()
