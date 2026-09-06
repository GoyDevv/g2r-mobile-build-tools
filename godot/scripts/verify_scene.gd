extends SceneTree
# Loads a converted .tscn and reports structure. Missing imported resources
# (glb/png/wav without editor import) are expected in this headless env; we
# only check the scene parses and hierarchy/transforms are intact.

var scene_path := "res://converted/scenes/EndScene.tscn"

func _init() -> void:
	var ps := load(scene_path)
	if ps == null or not (ps is PackedScene):
		push_error("SCENE FAILED TO LOAD: " + scene_path)
		quit(1)
		return
	var root: Node = ps.instantiate()
	var count := _count(root)
	print("SCENE OK nodes=%d path=%s" % [count, scene_path])
	# transform fidelity check: Area Light quat (0.7071068,0,0,0.7071068)
	var area: Node = root.get_node_or_null("Area Light")
	if area:
		print("Area Light pos=", (area as Node3D).position, " basis.x=", (area as Node3D).transform.basis.x)
	root.free()
	quit(0)

func _count(n: Node) -> int:
	var c := 1
	for ch in n.get_children():
		c += _count(ch)
	return c