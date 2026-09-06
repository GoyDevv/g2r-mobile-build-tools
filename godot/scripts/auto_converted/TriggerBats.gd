# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TriggerBats.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TriggerBats
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "floor":
      bats.SetActive(true)
      Object.queue_free  # TODO: Destroy(triggerHolder)

  var bats: Node3D

  var triggerHolder: Node3D
