extends Button
## Generic click bridge for converted Unity UI buttons whose original wiring was
## added at runtime (Start() { btn1.onClick.AddListener(...) }). The converter
## records the resolved target on metadata/unity_click_target (a node name) and
## the method on metadata/unity_click_method. On press we look the target up by
## name and call the method if it exists (guarded: unp converted targets are
## silently skipped and reported once).

var _warned := false

func _ready() -> void:
	if not pressed.is_connected(_fire):
		pressed.connect(_fire)

func _fire() -> void:
	var root := get_tree().current_scene if is_inside_tree() else null
	if root == null:
		return
	if not has_meta("unity_click_method"):
		return
	var method: String = get_meta("unity_click_method")
	var tgt: Node = null
	if has_meta("unity_click_target"):
		var tname: String = get_meta("unity_click_target")
		if not tname.is_empty():
			tgt = root.find_child(tname, true, false)
			if tgt == null:
				tgt = _find_sanitized(root, tname)
	if tgt == null:
		tgt = self
	if tgt != null and tgt.has_method(method):
		tgt.call(method)
	else:
		# Fallback: some Unity click handlers lived on controller objects whose
		# logic is ported as autoloads (e.g. MenuFlow for the GDPR flow).
		var handled := false
		for auto in get_tree().root.get_children():
			if auto.has_method(method):
				auto.call(method)
				handled = true
				break
		if not handled and not _warned:
		_warned = true
		var who: String = tgt.name if tgt != null else "?"
		push_warning("ui_click_bridge: no handler " + who + "." + method
				+ " (button " + name + ")")

func _find_sanitized(root: Node, base: String) -> Node:
	var query := base.replace(" ", "_")
	for c in root.find_children("*", "", true, false):
		if c.name == query or c.name.begins_with(query + "_"):
			return c
	return null
