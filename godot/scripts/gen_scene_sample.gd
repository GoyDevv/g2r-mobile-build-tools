extends SceneTree
func _init() -> void:
	var root := Node3D.new()
	root.name = "Root"
	# rotation 90 deg around Y + scale 2, origin (1,2,3)
	var b := Basis(Vector3(0, 1, 0), deg_to_rad(90.0))
	root.transform = Transform3D(b.scaled(Vector3(2, 3, 4)), Vector3(1, 2, 3))
	var child := Node3D.new()
	child.name = "Child"
	child.transform = Transform3D(Basis.IDENTITY, Vector3(0.5, -1, 2))
	root.add_child(child)
	var ap := AnimationPlayer.new()
	ap.name = "AnimationPlayer"
	root.add_child(ap)
	var lib := AnimationLibrary.new()
	lib.add_animation("Walk", load("res://scripts/anim_sample.tres"))
	lib.add_animation("idle", load("res://scripts/anim_sample.tres"))
	ap.add_animation_library("", lib)
	var ps := PackedScene.new()
	ps.pack(root)
	var err := ResourceSaver.save(ps, "res://scripts/scene_sample.tscn")
	print("saved err=", err)
	quit()
