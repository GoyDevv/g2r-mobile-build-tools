# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/turnOffGeyes.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name turnOffGeyes
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      Onvinden = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      Onvinden = false

  var Onvinden: bool
