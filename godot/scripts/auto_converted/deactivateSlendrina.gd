# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/deactivateSlendrina.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name deactivateSlendrina
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      slendrina.SetActive(false)
      Object.queue_free  # TODO: Destroy(self)

  var slendrina: Node3D
