extends SceneTree
func _init() -> void:
	var anim := Animation.new()
	anim.length = 1.5
	anim.loop_mode = Animation.LOOP_LINEAR
	# rotation track on node path "Root/Bone"
	var tr := anim.add_track(Animation.TYPE_ROTATION_3D)
	anim.track_set_path(tr, NodePath("Root/Bone"))
	var t0 := anim.rotation_track_insert_key(tr, 0.0, Quaternion(0, 0, 0, 1))
	var t1 := anim.rotation_track_insert_key(tr, 1.0, Quaternion(0, 0.7071068, 0, 0.7071068))
	var t2 := anim.rotation_track_insert_key(tr, 1.5, Quaternion(0, 1.5707964, 0, 1.5707964))
	# position track
	var tp := anim.add_track(Animation.TYPE_POSITION_3D)
	anim.track_set_path(tp, NodePath("Root/Head"))
	anim.position_track_insert_key(tp, 0.0, Vector3(0, 0, 0))
	anim.position_track_insert_key(tp, 1.5, Vector3(1, 2, 3))
	# value track (float)
	var tv := anim.add_track(Animation.TYPE_VALUE)
	anim.track_set_path(tv, NodePath("Mat:shader_param/emission_energy_multiplier"))
	anim.track_insert_key(tv, 0.0, 0.5)
	anim.track_insert_key(tv, 1.0, 2.0)
	var err := ResourceSaver.save(anim, "res://scripts/anim_sample.tres")
	print("saved err=", err)
	quit()
