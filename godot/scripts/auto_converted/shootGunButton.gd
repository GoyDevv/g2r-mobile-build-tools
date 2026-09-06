# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/shootGunButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name shootGunButton
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    ((shootGun)shootHolder.GetComponent(typeof(shootGun))).shooting = true

  var shootHolder: Node3D

  var btn1: Variant
