# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/SidescrollControl.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name SidescrollControl
extends Node  # TODO: was MonoBehaviour
  func _init():
    forwardSpeed = 4.0
    backwardSpeed = 4.0
    jumpSpeed = 16.0
    inAirMultiplier = 0.25
    canJump = true

  func _ready():
    thisTransform = (Transform)GetComponent(typeof(Transform))
    character = (CharacterController)GetComponent(typeof(CharacterController))
    var gameObject := GameObject.Find("PlayerSpawn")
    if gameObject:
      thisTransform.position = self.position

  func OnEndGame():
    moveTouchPad.Disable()
    jumpTouchPad.Disable()
    enabled = false

  func _process(_delta):
    var vector := Vector3.zero
    if moveTouchPad.position.x > 0.0:
      vector = Vector3.right * forwardSpeed * moveTouchPad.position.x
    else:
      vector = Vector3.right * backwardSpeed * moveTouchPad.position.x
    if character.isGrounded:
      var flag := false
      var joystick := this.jumpTouchPad
      if not joystick.IsFingerDown():
        canJump = true
      if canJump  and  joystick.IsFingerDown():
        flag = true
        canJump = false
      if flag:
        velocity = character.velocity
        velocity.y = jumpSpeed
    else:
      velocity.y = velocity.y + Physics.gravity.y * Time.deltaTime
      vector.x *= inAirMultiplier
    vector += velocity
    vector += Physics.gravity
    vector *= Time.deltaTime
    character.Move(vector)
    if character.isGrounded:
      velocity = Vector3.zero

  var moveTouchPad: Variant

  var jumpTouchPad: Variant

  var forwardSpeed: float

  var backwardSpeed: float

  var jumpSpeed: float

  var inAirMultiplier: float

  var thisTransform: Node3D

  var character: Variant

  var velocity: Vector3

  var canJump: bool
