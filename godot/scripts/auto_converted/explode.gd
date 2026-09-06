# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/explode.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name explode
extends Node  # TODO: was MonoBehaviour
  func explodeNow():
    explosion.SetActive(true)
    parent.get_node(\"TODO_Renderer\")  # TODO: GetComponent.enabled = false

  var explosion: Node3D

  var parent: Node3D
