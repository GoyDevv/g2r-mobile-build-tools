# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/explodeTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name explodeTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Granny = GameObject.Find("GrannyParent")
    gameController = GameObject.Find("GameController")
    yield return new WaitForSeconds(1.0)
    grannyHit = true
    var break: Variant

  func OnTriggerEnter(other: Variant):
    if not grannyHit:
      if other.gameObject.tag == "granny":
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByGun = true
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = false
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
        grannyHit = true
      elif (other.gameObject.tag == "Player":
        ((playerCaught)other.GetComponent(typeof(playerCaught))).explodingPlayer = true
        ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).stuckTimer()
        grannyHit = true

  var Granny: Node3D

  var gameController: Node3D

  var grannyHit: bool
