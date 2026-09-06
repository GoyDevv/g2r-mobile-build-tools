# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/floor2Trigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name floor2Trigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor2 = true
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor1 = false
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor3 = false

  var gameController: Node3D
