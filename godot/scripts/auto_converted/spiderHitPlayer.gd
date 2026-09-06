# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/spiderHitPlayer.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name spiderHitPlayer
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).huntPlayer = false
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).playerDead()
      ((playerCaught)Player.GetComponent(typeof(playerCaught))).spiderBitePlayer = true

  var Spider: Node3D

  var Player: Node3D
