# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FPSControllerNEW.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FPSControllerNEW
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
    PlayerIsGrounded = true
    startingPitch = 4

  func _ready():
    timeInAir = 0.0
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

  func _physics_process(_delta):
    var raycastHit := default(RaycastHit)
    var vector := this.thisTransform.TransformDirection(Vector3(this.moveTouchPad.position.x, 0.0, this.moveTouchPad.position.y))
    var num := 0
    var eulerAngles := base.transform.eulerAngles
    eulerAngles.x = num
    self  # TODO: was transform.eulerAngles = eulerAngles
    var num2 := 0
    var eulerAngles2 := base.transform.eulerAngles
    eulerAngles2.z = num2
    self  # TODO: was transform.eulerAngles = eulerAngles2
    vector.y = 0.0
    vector.Normalize()
    var vector2 := new Vector2(Mathf.Abs(this.moveTouchPad.position.x), Mathf.Abs(this.moveTouchPad.position.y))
    if vector2.y > vector2.x:
      if moveTouchPad.position.y > -0.3  and  moveTouchPad.position.y < 0.4:
        vector *= forwardSpeed * vector2.y
        if day2:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation2"].speed = 0.6
        elif (this.day3:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation3"].speed = 0.6
        else:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation"].speed = 0.6
      elif (this.moveTouchPad.position.y >= 0.4f  and  this.moveTouchPad.position.y < 0.8f:
        vector *= forwardSpeed * vector2.y
        if playerCrouch:
          if day2:
            headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation2"].speed = 0.6
          elif (this.day3:
            headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation3"].speed = 0.6
          else:
            headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation"].speed = 0.6
        elif (this.day2:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation2"].speed = 0.7
        elif (this.day3:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation3"].speed = 0.7
        else:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation"].speed = 0.7
      elif (this.moveTouchPad.position.y >= 0.8f  and  this.moveTouchPad.position.y < 1.5f:
        vector *= forwardSpeed * vector2.y
        if playerCrouch:
          if day2:
            headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation2"].speed = 0.6
          elif (this.day3:
            headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation3"].speed = 0.6
          else:
            headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation"].speed = 0.6
        elif (this.day2:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation2"].speed = 1.0
        elif (this.day3:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation3"].speed = 1.0
        else:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation"].speed = 1.0
      elif (this.moveTouchPad.position.y > -1.5f  and  this.moveTouchPad.position.y < -0.3f:
        vector *= backwardSpeed * vector2.y
        if day2:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation2"].speed = 0.6
        elif (this.day3:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation3"].speed = 0.6
        else:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation"].speed = 0.6
    elif (vector2.y < vector2.x:
      vector *= sidestepSpeed * vector2.x
      if playerCrouch:
        if day2:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation2"].speed = 0.6
        elif (this.day3:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation3"].speed = 0.6
        else:
          headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation"].speed = 0.6
      elif (this.day2:
        headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation2"].speed = 0.7
      elif (this.day3:
        headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation3"].speed = 0.7
      else:
        headBobAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["HeadBobAnimation"].speed = 0.7
    elif (vector2.y != 1f:
      if moveTouchPad.position.y == 0.0:
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
      PlayerIsGrounded = true
      velocity = Vector3.zero
      ((playerFallingSound)FallsoundHolder.GetComponent(typeof(playerFallingSound))).playerFallingNot()
      if timeInAir > 0.5:
        timeInAir = 0.0
        fallTimerStarted = false
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).playerLandSound()
        ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerGetCaught = true
        ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerFallDeath = true
        StartCoroutine(((playerCaught)Player.GetComponent(typeof(playerCaught))).fallingDead())
        forwardSpeed = 0.0
        backwardSpeed = 0.0
        sidestepSpeed = 0.0
    else:
      PlayerIsGrounded = false
      if fallTimerStarted:
        timeInAir += Time.deltaTime
        ((playerFallingSound)FallsoundHolder.GetComponent(typeof(playerFallingSound))).playerFalling()
    if character.isGrounded:
      var a := Vector2.zero
      if rotateTouchPad:
        a = rotateTouchPad.position
      else:
        var acceleration := Input.acceleration
        var num3 := Mathf.Abs(acceleration.x)
        if acceleration.z < 0.0  and  acceleration.x < 0.0:
          if num3 >= tiltPositiveYAxis:
            a.y = (num3 - tiltPositiveYAxis) / (1.0 - tiltPositiveYAxis)
          elif (num3 <= this.tiltNegativeYAxis:
            a.y = -(tiltNegativeYAxis - num3) / tiltNegativeYAxis
        if Mathf.Abs(acceleration.y) >= tiltXAxisMinimum:
          a.x = -(acceleration.y - tiltXAxisMinimum) / (1.0 - tiltXAxisMinimum)
      a.x *= rotationSpeed.x
      a.y *= rotationSpeed.y
      a *= Time.deltaTime
      thisTransform.Rotate(0.0, a.x, 0.0, Space.World)
      cameraPivot.Rotate(-a.y, 0.0, 0.0)
    var component := base.GetComponent<CharacterController>()
    var vector3 := component.velocity
    vector3 = Vector3(component.velocity.x, 0.0, component.velocity.z)
    var magnitude := vector3.magnitude
    if magnitude > 0.0:
      ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).isWalking = true
    else:
      ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).isWalking = false
    var vector4 := Vector3(0.0, -1.0, 0.0)
    if Physics.Raycast(checkGround.transform.position, vector4, out raycastHit, 5.0):
      Debug.DrawRay(checkGround.position, vector4, Color.yellow)
      if raycastHit.collider.gameObject.tag == "grus":
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walkGrus = true
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walkWater = false
      if raycastHit.collider.gameObject.tag == "golv":
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walkGrus = false
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walkWater = false
      if raycastHit.collider.gameObject.tag == "water":
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walkWater = true
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walkGrus = false

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

  var rotateControll: Node3D

  var footstepScriptHolder: Node3D

  var headBobAnimHolder: Node3D

  var day2: bool

  var day3: bool

  var playerCrouch: bool

  var PlayerIsGrounded: bool

  var fallTimerStarted: bool

  var timeInAir: float

  var soundHolder: Node3D

  var FallsoundHolder: Node3D

  var granny: Node3D

  var Player: Node3D

  var checkGround: Node3D

  var startingPitch: int

  var audio: Variant
