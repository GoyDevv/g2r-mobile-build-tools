# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/bedTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name bedTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      button.SetActive(true)

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      button.SetActive(false)

  var button: Node3D
