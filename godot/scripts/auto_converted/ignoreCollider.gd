# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ignoreCollider.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ignoreCollider
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      Physics.IgnoreCollision(trap.get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_CharacterController\")  # TODO: GetComponent, true)

  var trap: Node3D
