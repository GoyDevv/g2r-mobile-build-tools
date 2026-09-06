# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/RandomKofotPlace.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name RandomKofotPlace
extends Node  # TODO: was MonoBehaviour
  func _ready():
    number = Random.Range(1, 4)
    if number == 1:
      kofotPlace1.SetActive(true)
    elif (this.number == 2:
      kofotPlace2.SetActive(true)
    elif (this.number == 3:
      kofotPlace3.SetActive(true)

  var kofotPlace1: Node3D

  var kofotPlace2: Node3D

  var kofotPlace3: Node3D

  var number: int
