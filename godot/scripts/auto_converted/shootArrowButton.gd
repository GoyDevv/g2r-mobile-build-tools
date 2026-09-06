# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/shootArrowButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name shootArrowButton
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    ((ShootArrow)shootHolder.GetComponent(typeof(ShootArrow))).shooting = true

  var shootHolder: Node3D

  var btn1: Variant
