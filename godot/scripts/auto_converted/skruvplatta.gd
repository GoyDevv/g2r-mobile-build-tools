# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/skruvplatta.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name skruvplatta
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if skruv1  and  skruv2  and  not skruvBorta:
      skruvBorta = true
      StartCoroutine(plattaFaller())

  func plattaFaller():
    yield return new WaitForSeconds(1.0)
    ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = false
    var break: Variant

  func Screw1Bort():
    yield return new WaitForSeconds(0.8)
    Object.queue_free  # TODO: Destroy(Screw1)
    var break: Variant

  func Screw2Bort():
    yield return new WaitForSeconds(0.8)
    Object.queue_free  # TODO: Destroy(Screw2)
    var break: Variant

  var skruv1: bool

  var skruv2: bool

  var Screw1: Node3D

  var Screw2: Node3D

  var skruvBorta: bool
