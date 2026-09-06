extends SceneTree
func _init() -> void:
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	st.add_vertex(Vector3(0, 0, 0))
	st.add_vertex(Vector3(1, 0, 0))
	st.add_vertex(Vector3(1, 1, 0))
	st.add_index(0)
	st.add_index(1)
	st.add_index(2)
	var m := st.commit()
	var err := ResourceSaver.save(m, "res://scripts/mesh_sample.tres")
	print("saved err=", err)
	quit()