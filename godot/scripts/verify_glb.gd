extends SceneTree
# Verifies converted .glb files parse via GLTFDocument (no editor import required).

func _init() -> void:
	var dir := DirAccess.open("res://assets/meshes")
	if dir == null:
		push_error("cannot open res://assets/meshes")
		quit(1)
		return
	var files: Array[String] = []
	for f in dir.get_files():
		if f.ends_with(".glb"):
			files.append(f)
	files.sort()
	var ok := 0
	var bad := 0
	for f in files:
		var err := _check("res://assets/meshes/" + f)
		if err == OK:
			ok += 1
		else:
			bad += 1
	print("GLB CHECK ok=%d bad=%d total=%d" % [ok, bad, files.size()])
	quit(0 if bad == 0 else 1)

func _check(path: String) -> int:
	var gltf := GLTFDocument.new()
	var state := GLTFState.new()
	var err := gltf.append_from_file(path, state, 0, "")
	if err != OK:
		push_error("GLB FAIL %s err=%d" % [path, err])
		return err
	var root := Node3D.new()
	var scene_root := gltf.generate_scene(state)
	if scene_root == null:
		push_error("GLB null scene %s" % path)
		return ERR_CANT_CREATE
	root.add_child(scene_root)
	root.free()
	return OK
