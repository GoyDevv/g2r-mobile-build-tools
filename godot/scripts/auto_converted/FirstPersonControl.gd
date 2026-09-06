# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FirstPersonControl.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FirstPersonControl
extends Node  # TODO: was MonoBehaviour
  func _init():
    forwardSpeed = 4.0
    backwardSpeed = 1.0
    sidestepSpeed = 1.0
    jumpSpeed = 8.0
    inAirMultiplier = 0.25
    rotationSpeed = new Vector2(50.0, 25.0)
    tiltPositiveYAxis = 0.6
    tiltNegativeYAxis = 0.4
    tiltXAxisMinimum = 0.1
    canJump = true

  func _ready():
    thisTransform = (Transform)GetComponent(typeof(Transform))
    character = (CharacterController)GetComponent(typeof(CharacterController))
    var gameObject := GameObject.Find("PlayerSpawn")
    if gameObject:
      thisTransform.position = self.position

  func OnEndGame():
    moveTouchPad.Disable()
    if rotateTouchPad:
      rotateTouchPad.Disable()
    enabled = false

  func _process(_delta):
    var vector := this.thisTransform.TransformDirection(Vector3(this.moveTouchPad.position.x, 0.0, this.moveTouchPad.position.y))
    vector.y = 0.0
    vector.Normalize()
    var vector2 := new Vector2(Mathf.Abs(this.moveTouchPad.position.x), Mathf.Abs(this.moveTouchPad.position.y))
    if vector2.y > vector2.x:
      if moveTouchPad.position.y > 0.0:
        vector *= forwardSpeed * vector2.y
      else:
        vector *= backwardSpeed * vector2.y
    else:
      vector *= sidestepSpeed * vector2.x
    if character.isGrounded:
      var flag := false
      var joystick: Variant
      if rotateTouchPad:
        joystick = rotateTouchPad
      else:
        joystick = moveTouchPad
      if not joystick.IsFingerDown():
        canJump = true
      if canJump  and  joystick.tapCount >= 2:
        flag = true
        canJump = false
      if flag:
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
    if character.isGrounded:
      var a := Vector2.zero
      if rotateTouchPad:
        a = rotateTouchPad.position
      else:
        var acceleration := Input.acceleration
        var num := Mathf.Abs(acceleration.x)
        if acceleration.z < 0.0  and  acceleration.x < 0.0:
          if num >= tiltPositiveYAxis:
            a.y = (num - tiltPositiveYAxis) / (1.0 - tiltPositiveYAxis)
          elif (num <= this.tiltNegativeYAxis:
            a.y = -(tiltNegativeYAxis - num) / tiltNegativeYAxis
        if Mathf.Abs(acceleration.y) >= tiltXAxisMinimum:
          a.x = -(acceleration.y - tiltXAxisMinimum) / (1.0 - tiltXAxisMinimum)
      a.x *= rotationSpeed.x
      a.y *= rotationSpeed.y
      a *= Time.deltaTime
      thisTransform.Rotate(0.0, a.x, 0.0, Space.World)
      cameraPivot.Rotate(-a.y, 0.0, 0.0)

  var moveTouchPad: Variant

  var rotateTouchPad: Variant

  var cameraPivot: Node3D

  var forwardSpeed: float

  var backwardSpeed: float

  var sidestepSpeed: float

  var jumpSpeed: float

  var inAirMultiplier: float

  var rotationSpeed: Variant

  var tiltPositiveYAxis: float

  var tiltNegativeYAxis: float

  var tiltXAxisMinimum: float

  var thisTransform: Node3D

  var character: Variant

  var cameraVelocity: Vector3

  var velocity: Vector3

  var canJump: bool
