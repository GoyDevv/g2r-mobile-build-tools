# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/MomTeleport.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name MomTeleport
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not ((AIfollow)mom.GetComponent(typeof(AIfollow))).seePlayer:
      mom.SetActive(false)
      mom.position = teleportPoint.position
      mom.SetActive(true)

  var mom: Node3D

  var teleportPoint: Node3D
