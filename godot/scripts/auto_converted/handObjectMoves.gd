# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/handObjectMoves.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name handObjectMoves
extends Node  # TODO: was MonoBehaviour
  func _ready():
    vectOffset = position - goFollow.position

  func _process(_delta):
    position = goFollow.position + vectOffset
    quaternion  # TODO: Unity->Godot rotation = Quaternion.Slerp(quaternion  # TODO: Unity->Godot rotation, goFollow.quaternion  # TODO: Unity->Godot rotation, speed * Time.deltaTime)

  var vectOffset: Vector3

  var goFollow: Node3D

  var speed := 3.0
