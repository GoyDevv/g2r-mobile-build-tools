# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/floor1Trigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name floor1Trigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor1 = true
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor2 = false
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor3 = false

  var gameController: Node3D
