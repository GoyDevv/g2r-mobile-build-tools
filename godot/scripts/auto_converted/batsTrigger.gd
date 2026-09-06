# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/batsTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name batsTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((AIfollow)NOS.GetComponent(typeof(AIfollow))).seePlayer = true
      ((AIfollow)NOS.GetComponent(typeof(AIfollow))).FollowPlayer = true
      bats.SetActive(true)
      nextTrigger.SetActive(true)
      self.SetActive(false)

  var NOS: Node3D

  var nextTrigger: Node3D

  var bats: Node3D
