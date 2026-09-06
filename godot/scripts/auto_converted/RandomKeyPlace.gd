# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/RandomKeyPlace.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name RandomKeyPlace
extends Node  # TODO: was MonoBehaviour
  func _ready():
    number = Random.Range(1, 4)
    if number == 1:
      keyPlace1.SetActive(true)
    elif (this.number == 2:
      keyPlace2.SetActive(true)
    elif (this.number == 3:
      keyPlace3.SetActive(true)

  var keyPlace1: Node3D

  var keyPlace2: Node3D

  var keyPlace3: Node3D

  var number: int
