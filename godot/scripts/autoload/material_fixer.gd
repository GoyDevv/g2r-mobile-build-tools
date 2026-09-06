extends Node
## MaterialFixer — the converter stores material guids in each mesh node's
## metadata (unity_materials). When the .glb instance loads, this walks the
## instanced subtree and assigns converted StandardMaterial3D resources.
## In headless/import-free environments the tres fails to load -> falls back to
## a white material so the scene still runs for logic tests.

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta: float) -> void:
	# cheap: scan root nodes once; scenes are changed wholesale in this game
	if get_tree().current_scene != null:
		_fix(get_tree().current_scene)
	set_process(false)

func _fix(root: Node) -> void:
	for child in root.find_children("*", "", true, false):
		if not child.has_meta("unity_materials"):
			continue
		var guids: Array = child.get_meta("unity_materials")
		var mat: Material = _load_material(guids[0] if guids.size() > 0 else "")
		var meshes: Array = child.find_children("*", "MeshInstance3D", true, false)
		for m in meshes:
			(m as MeshInstance3D).material_override = mat
		if meshes.is_empty():
			child.set_meta("material_fallback", true)

func _load_material(guid: String) -> Material:
	if guid.is_empty():
		return null
	var db := load("res://tools/materials.json") if ResourceLoader.exists("res://tools/materials.json") else null
	if db == null:
		return null
	var path: Variant = db.get(guid)
	if path == null:
		return null
	var m: Resource = load(path) if ResourceLoader.exists(path) else null
	return m as Material