extends Node3D
## Port of playerDead.cs — the "game controller" death handling. Original script
## shows a death screen / resets the day; EnemyAIGranny checks
## end_scene_running before spawning ragdolls.

signal player_died

var end_scene_running := false
var death_timer := 0.0
var _triggered := false

func _ready() -> void:
	add_to_group("unity_player_dead")

func trigger_death() -> void:
	if _triggered:
		return
	_triggered = true
	end_scene_running = true
	emit_signal("player_died")
	var gs := get_tree().get_first_node_in_group("unity_game_state")
	if gs and gs.has_method("on_player_death"):
		gs.call("on_player_death")
	# original flow: after a delay reload the day scene / go to game over
	await get_tree().create_timer(2.0).timeout
	end_scene_running = false
	_triggered = false
	var gs2 := get_tree().get_first_node_in_group("unity_game_state")
	if gs2 and gs2.has_method("on_player_death_done"):
		gs2.call("on_player_death_done")