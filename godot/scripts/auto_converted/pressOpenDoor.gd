# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/pressOpenDoor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name pressOpenDoor
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    ((openDoors)doorScriptHolder.GetComponent(typeof(openDoors))).openTheDoor = true
    ((openDoors)doorScriptHolder.GetComponent(typeof(openDoors))).playSound = false

  var doorScriptHolder: Node3D

  var btn1: Variant
