# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/gardeTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name gardeTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false

  var granny: Node3D
