# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CanJumpOut.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CanJumpOut
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((openDoors)player.GetComponent(typeof(openDoors))).canJumpOut = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      ((openDoors)player.GetComponent(typeof(openDoors))).canJumpOut = false

  var player: Node3D
