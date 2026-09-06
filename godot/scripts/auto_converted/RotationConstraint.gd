# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/RotationConstraint.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name RotationConstraint
extends Node  # TODO: was MonoBehaviour
  func _ready():
    thisTransform = self  # TODO: was transform
    var constraintAxis := this.axis
    if constraintAxis != ConstraintAxis.X:
      if constraintAxis != ConstraintAxis.Y:
        if constraintAxis == ConstraintAxis.Z:
          rotateAround = Vector3.forward
      else:
        rotateAround = Vector3.up
    else:
      rotateAround = Vector3.right
    var lhs := Quaternion.AngleAxis(this.thisTransform.localRotation.eulerAngles[(int)this.axis], this.rotateAround)
    minQuaternion = lhs * Quaternion.AngleAxis(min, rotateAround)
    maxQuaternion = lhs * Quaternion.AngleAxis(max, rotateAround)
    range = max - min

  func LateUpdate():
    var localRotation := this.thisTransform.localRotation
    var a := Quaternion.AngleAxis(localRotation.eulerAngles[(int)this.axis], this.rotateAround)
    var num := Quaternion.Angle(a, this.minQuaternion)
    var num2 := Quaternion.Angle(a, this.maxQuaternion)
    if num <= range  and  num2 <= range:
      return
    var eulerAngles := localRotation.eulerAngles
    if num > num2:
      eulerAngles[axis] = maxQuaternion.eulerAngles[axis]
    else:
      eulerAngles[axis] = minQuaternion.eulerAngles[axis]
    thisTransform.localEulerAngles = eulerAngles

  var axis: Variant

  var min: float

  var max: float

  var thisTransform: Node3D

  var rotateAround: Vector3

  var minQuaternion: Variant

  var maxQuaternion: Variant

  var range: float
