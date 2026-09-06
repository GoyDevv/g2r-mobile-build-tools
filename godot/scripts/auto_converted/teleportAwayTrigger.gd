# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/teleportAwayTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name teleportAwayTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Maniac":
      NOS.position = teleportPointNOS.position

  var teleportPointNOS: Node3D

  var NOS: Node3D
