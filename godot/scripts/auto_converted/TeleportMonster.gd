# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TeleportMonster.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TeleportMonster
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not ((AIfollow)monster.GetComponent(typeof(AIfollow))).seePlayer:
      monster.SetActive(false)
      monster.position = teleportPoint.position
      monster.SetActive(true)

  var monster: Node3D

  var teleportPoint: Node3D
