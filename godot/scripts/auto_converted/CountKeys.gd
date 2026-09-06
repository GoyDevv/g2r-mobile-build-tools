# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CountKeys.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CountKeys
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    keyCounterParent.get_node(\"TODO_GUIText\")  # TODO: GetComponent.text = keys.ToString()

  func countUpkeys():
    keys++

  func countDownkeys():
    keys--

  var keys: int

  var keyCounterParent: Node3D
