# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/skullTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name skullTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not skullFallen:
      skullFallen = true
      ((Rigidbody)skull.self.GetComponent(typeof(Rigidbody))).isKinematic = false

  var skull: Node3D

  var skullFallen: bool
