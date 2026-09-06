# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/BastuTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name BastuTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = true
    if other.gameObject.tag == "granny":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
    if other.gameObject.tag == "granny":
      if not ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuBomNere:
        ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0

  var granny: Node3D
