extends SceneTree
var cases := [
	"res://scripts/min1.tscn",
	"res://scripts/min2.tscn",
	"res://scripts/min3.tscn",
	"res://scripts/min4.tscn",
]
func _init() -> void:
	for p in cases:
		var r: Resource = load(p)
		if r == null:
			print("LOAD NULL: ", p)
		else:
			print("LOAD OK: ", p)
	quit(0)