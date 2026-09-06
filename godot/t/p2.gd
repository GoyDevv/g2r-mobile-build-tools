extends SceneTree
func _initialize() -> void:
	var l := OmniLight3D.new()
	for p in l.get_property_list():
		if "color" in p.name or "energy" in p.name or "range" in p.name or "omni" in p.name:
			print(p.name)
	quit(0)
