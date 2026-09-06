# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/teddyFalls.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name teddyFalls
extends Node  # TODO: was MonoBehaviour
  func _ready():
    objectResetPos = GameObject.Find("ObjectResetPoint").self  # TODO: was transform
    if GameObject.Find("Player"):
      player = GameObject.Find("Player").self  # TODO: was transform
      Physics.IgnoreCollision(ParentObject.get_node(\"TODO_Collider\")  # TODO: GetComponent, player.get_node(\"TODO_CharacterController\")  # TODO: GetComponent, true)

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      Physics.IgnoreCollision(ParentObject.get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_CharacterController\")  # TODO: GetComponent, true)
    elif (other.gameObject.tag == "resetfloor":
      ParentObject.position = objectResetPos.position

  var objectResetPos: Node3D

  var ParentObject: Node3D

  var player: Node3D
