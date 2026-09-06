# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/RandomDunkPlace.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name RandomDunkPlace
extends Node  # TODO: was MonoBehaviour
  func _ready():
    number = Random.Range(1, 5)
    if number == 1:
      dunkPlace1.SetActive(true)
    elif (this.number == 2:
      dunkPlace2.SetActive(true)
    elif (this.number == 3:
      dunkPlace3.SetActive(true)
    elif (this.number == 4:
      dunkPlace4.SetActive(true)

  var dunkPlace1: Node3D

  var dunkPlace2: Node3D

  var dunkPlace3: Node3D

  var dunkPlace4: Node3D

  var number: int
