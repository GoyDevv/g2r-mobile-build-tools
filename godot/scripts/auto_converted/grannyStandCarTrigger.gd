# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/grannyStandCarTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name grannyStandCarTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerStay(other: Variant):
    if other.gameObject.tag == "granny":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).grannyStandBesideCar = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "granny":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).grannyStandBesideCar = false

  var granny: Node3D
