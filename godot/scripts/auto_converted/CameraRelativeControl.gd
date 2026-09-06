# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CameraRelativeControl.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CameraRelativeControl
extends Node  # TODO: was MonoBehaviour
  func _init():
    speed = 5.0
    jumpSpeed = 8.0
    inAirMultiplier = 0.25
    rotationSpeed = new Vector2(50.0, 25.0)

  func _ready():
    thisTransform = (Transform)GetComponent(typeof(Transform))
    character = (CharacterController)GetComponent(typeof(CharacterController))
    animationController = (AnimationController)GetComponent(typeof(AnimationController))
    animationController.maxForwardSpeed = speed
    var gameObject := GameObject.Find("PlayerSpawn")
    if gameObject:
      thisTransform.position = self.position

  func FaceMovementDirection():
    var vector := this.character.velocity
    vector.y = 0.0
    if vector.magnitude > 0.1:
      thisTransform.forward = vector.normalized

  func OnEndGame():
    moveJoystick.Disable()
    rotateJoystick.Disable()
    enabled = false

  func _process(_delta):
    var vector := this.cameraTransform.TransformDirection(Vector3(this.moveJoystick.position.x, 0.0, this.moveJoystick.position.y))
    vector.y = 0.0
    vector.Normalize()
    var vector2 := new Vector2(Mathf.Abs(this.moveJoystick.position.x), Mathf.Abs(this.moveJoystick.position.y))
    vector *= speed * ((vector2.x <= vector2.y) ? vector2.y : vector2.x)
    if character.isGrounded:
      if rotateJoystick.tapCount == 2:
        velocity = character.velocity
        velocity.y = jumpSpeed
    else:
      velocity.y = velocity.y + Physics.gravity.y * Time.deltaTime
      vector.x *= inAirMultiplier
      vector.z *= inAirMultiplier
    vector += velocity
    vector += Physics.gravity
    vector *= Time.deltaTime
    character.Move(vector)
    if character.isGrounded:
      velocity = Vector3.zero
    FaceMovementDirection()
    var a := this.rotateJoystick.position
    a.x *= rotationSpeed.x
    a.y *= rotationSpeed.y
    a *= Time.deltaTime
    cameraPivot.Rotate(0.0, a.x, 0.0, Space.World)
    cameraPivot.Rotate(a.y, 0.0, 0.0)

  var moveJoystick: Variant

  var rotateJoystick: Variant

  var cameraPivot: Node3D

  var cameraTransform: Node3D

  var speed: float

  var jumpSpeed: float

  var inAirMultiplier: float

  var rotationSpeed: Variant

  var thisTransform: Node3D

  var character: Variant

  var animationController: Variant

  var velocity: Vector3
