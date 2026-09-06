# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/floor3Trigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name floor3Trigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor3 = true
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor1 = false
      ((checkMapFloor)gameController.GetComponent(typeof(checkMapFloor))).playerFloor2 = false

  var gameController: Node3D
