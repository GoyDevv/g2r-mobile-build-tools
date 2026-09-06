# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/plankaHitSpot.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name plankaHitSpot
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, true)
    else:
      Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, false)
