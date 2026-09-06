# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CanJumpIn.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CanJumpIn
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((openDoors)player.GetComponent(typeof(openDoors))).canJumpIn = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      ((openDoors)player.GetComponent(typeof(openDoors))).canJumpIn = false

  var player: Node3D
