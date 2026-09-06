# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/carHitGranny.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name carHitGranny
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    Granny = GameObject.Find("GrannyParent")

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "granny"  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyStandBesideCar  and  not noMoreHit:
      noMoreHit = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByCar = true

  var noMoreHit: bool

  var Granny: Node3D
