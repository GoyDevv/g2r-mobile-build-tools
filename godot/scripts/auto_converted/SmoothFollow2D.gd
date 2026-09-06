# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/SmoothFollow2D.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name SmoothFollow2D
extends Node  # TODO: was MonoBehaviour
  func _init():
    smoothTime = 0.3

  func _ready():
    thisTransform = self  # TODO: was transform

  func _process(_delta):
    var x := Mathf.SmoothDamp(this.thisTransform.position.x, this.target.position.x, ref this.velocity.x, this.smoothTime)
    var position := this.thisTransform.position
    position.x = x
    thisTransform.position = position
    var y := Mathf.SmoothDamp(this.thisTransform.position.y, this.target.position.y, ref this.velocity.y, this.smoothTime)
    var position2 := this.thisTransform.position
    position2.y = y
    thisTransform.position = position2

  var target: Node3D

  var smoothTime: float

  var thisTransform: Node3D

  var velocity: Variant
