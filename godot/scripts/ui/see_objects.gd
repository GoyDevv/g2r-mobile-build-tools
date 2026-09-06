extends Button
## Port of Unity `SeeObjects.cs`: the on-screen "pick up" prompt button.
## Unity wired it in Start() { btn1.onClick.AddListener(TaskOnClick); } where
## btn1 is a Button on the same GO; here the node is a Button and the script
## self-connects `pressed` -> set PickUp.pickUp = true on the PickUp node.

func _ready() -> void:
	if not pressed.is_connected(_on_pressed):
		pressed.connect(_on_pressed)

func _on_pressed() -> void:
	var pickup := _find("PickUp")
	if pickup != null and pickup.has_method("set_pick_up"):
		pickup.call("set_pick_up")

func _find(name: String) -> Node:
	if name.is_empty():
		return null
	var root := get_tree().current_scene if is_inside_tree() else null
	if root == null:
		return null
	return root.find_child(_san(name), true, false)

func _san(name: String) -> String:
	var out := ""
	var prev := false
	for ch in name:
		var keep := (ch >= "a" and ch <= "z") or (ch >= "A" and ch <= "Z") \
				or (ch >= "0" and ch <= "9") or ch == "_" or ch == "." or ch == "-"
		if keep:
			out += ch
			prev = ch == "_"
		elif not prev:
			out += "_"
			prev = true
	while out.length() > 0 and out[0] == "_":
		out = out.substr(1)
	while out.length() > 0 and out[out.length() - 1] == "_":
		out = out.substr(0, out.length() - 1)
	return out
