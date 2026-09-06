# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/SeeObjects.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name SeeObjects
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    ((PickUp)handHolder.GetComponent(typeof(PickUp))).pickUp = true

  var handHolder: Node3D

  var btn1: Variant
