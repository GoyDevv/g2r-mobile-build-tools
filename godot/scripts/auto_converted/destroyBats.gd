# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/destroyBats.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name destroyBats
extends Node  # TODO: was MonoBehaviour
  func _ready():
    timer = 2.0

  func _process(_delta):
    if bats.activeSelf:
      timer -= Time.deltaTime
    if timer < 0.0:
      timer = 2.0
      bats.SetActive(false)

  var bats: Node3D

  var timer: float
