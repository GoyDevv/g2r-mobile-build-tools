extends Node3D
## Port of soundEffects.cs — a bank of one-shot methods used across the game.
## AudioClips are discovered from child AudioStreamPlayer3D nodes named after
## the Unity fields (PlayerLand, PlayerGetHit, ...) or from a clips dictionary.

var clips: Dictionary = {}

func _ready() -> void:
	for ch in get_children():
		if ch is AudioStreamPlayer3D:
			clips[ch.name] = ch

func _play(clip: String, pitch := 1.0) -> void:
	var p: AudioStreamPlayer3D = clips.get(clip)
	if p:
		p.pitch_scale = pitch
		p.play()

func playerLandSound() -> void:
	_play("PlayerLand")

func playerGetHit() -> void:
	_play("PlayerGetHit")

func playerFalling() -> void:
	_play("PlayerFalling")

func CarOut() -> void:
	_play("CarOut")

func CrossbowLoad() -> void:
	_play("CrossbowLoad")

func loadedPickup() -> void:
	_play("LoadedPickup")

func emptyShotgun() -> void:
	_play("EmptyShotgun")

func loadShotgun() -> void:
	_play("LoadShotgun")

func pickupSound(clip: String) -> void:
	_play(clip)