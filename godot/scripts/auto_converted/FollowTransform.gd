# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FollowTransform.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FollowTransform
extends Node  # TODO: was MonoBehaviour
  func _ready():
    thisTransform = self  # TODO: was transform

  func _process(_delta):
    thisTransform.position = targetTransform.position
    if faceForward:
      thisTransform.forward = targetTransform.forward

  var targetTransform: Node3D

  var faceForward: bool

  var thisTransform: Node3D
