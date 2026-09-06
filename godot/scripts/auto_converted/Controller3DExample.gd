# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/Controller3DExample.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name Controller3DExample
extends Node  # TODO: was MonoBehaviour
  func _ready():
    _characterController = get_node(\"TODO_CharacterController\")  # TODO: GetComponent
    _mainCameraTransform = Camera.main.get_node(\"TODO_Transform\")  # TODO: GetComponent
    _transformCache = get_node(\"TODO_Transform\")  # TODO: GetComponent
    _playerTransform = _transformCache.Find("Cocoon")

  func _process(_delta):
    var movement := Vector3(this.MovementJoystick.GetAxis("Horizontal"), 0.0, this.MovementJoystick.GetAxis("Vertical"))
    CommonMovementMethod(movement)

  func MoveWithEvent(inputMovement: Vector3):
    var movement := Vector3(inputMovement.x, 0.0, inputMovement.y)
    CommonMovementMethod(movement)

  func CommonMovementMethod(movement: Vector3):
    movement = _mainCameraTransform.TransformDirection(movement)
    movement.y = 0.0
    movement.Normalize()
    FaceDirection(movement)
    _characterController.Move(movement * movementSpeed * Time.deltaTime)

  func FaceDirection(direction: Vector3):
    StopCoroutine("RotateCoroutine")
    StartCoroutine("RotateCoroutine", direction)

  func RotateCoroutine(direction: Vector3):
    if direction == Vector3.zero:
      var break: Variant
    var lookRotation := Quaternion.LookRotation(direction)
    do {
    _playerTransform.rotation = Quaternion.Lerp(_playerTransform.rotation, lookRotation, Time.deltaTime * 15.0)
    yield return null
  while ((direction - this._playerTransform.forward).sqrMagnitude > 0.2f);
  var break: Variant

public const float ROTATE_SPEED = 15.0

var movementSpeed := 5.0

var MovementJoystick: Variant

var _characterController: Variant

var _mainCameraTransform: Node3D

var _transformCache: Node3D

var _playerTransform: Node3D
