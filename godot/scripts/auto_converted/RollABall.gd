# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/RollABall.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name RollABall
extends Node  # TODO: was MonoBehaviour
  func _init():
    tilt = Vector3.zero

  func _ready():
    circ = 6.28318548 * get_node(\"TODO_Collider\")  # TODO: GetComponent.bounds.extents.x
    previousPosition = position

  func _process(_delta):
    tilt.x = -Input.acceleration.y
    tilt.z = Input.acceleration.x
    get_node(\"TODO_Rigidbody\")  # TODO: GetComponent.AddForce(tilt * speed * Time.deltaTime)

  func LateUpdate():
    var a := base.transform.position - this.previousPosition
    a = Vector3(a.z, 0.0, -a.x)
    self  # TODO: was transform.Rotate(a / circ * 360.0, Space.World)
    previousPosition = position

  var tilt: Vector3

  var speed: float

  var circ: float

  var previousPosition: Vector3
