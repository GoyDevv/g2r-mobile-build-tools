# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/hideTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name hideTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerStay(other: Variant):
    if other.gameObject.tag == "Player":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = true
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerInHole = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerInHole = false

  var granny: Node3D

  var grannyEye: Node3D
