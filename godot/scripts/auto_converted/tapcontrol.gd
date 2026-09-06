# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/tapcontrol.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name tapcontrol
extends Node  # TODO: was MonoBehaviour
  public tapcontrol() {
  inAirMultiplier = 0.25
  minimumDistanceToMove = 1.0
  minimumTimeUntilMove = 0.25
  rotateEpsilon = 1.0
  state = ControlState.WaitingForFirstTouch
  fingerDown = new int[2]
  fingerDownPosition = new Vector2[2]
  fingerDownFrame = new int[2]

func _ready():
  thisTransform = self  # TODO: was transform
  zoomCamera = (ZoomCamera)cameraObject.GetComponent(typeof(ZoomCamera))
  cam = cameraObject.get_node(\"TODO_Camera\")  # TODO: GetComponent
  character = (CharacterController)GetComponent(typeof(CharacterController))
  animationController = (AnimationController)GetComponent(typeof(AnimationController))
  animationController.maxForwardSpeed = speed
  ResetControlState()
  var gameObject := GameObject.Find("PlayerSpawn")
  if gameObject:
    thisTransform.position = self.position

func OnEndGame():
  enabled = false

func FaceMovementDirection():
  var vector := this.character.velocity
  vector.y = 0.0
  if vector.magnitude > 0.1:
    thisTransform.forward = vector.normalized

func CameraControl(touch0: Variant, touch1: Variant):
  if rotateEnabled  and  state == ControlState.RotatingCamera:
    var a := touch1.position - touch0.position
    var lhs := a / a.magnitude
    var a2 := touch1.position - touch1.deltaPosition - (touch0.position - touch0.deltaPosition)
    var rhs := a2 / a2.magnitude
    var num := Vector2.Dot(lhs, rhs)
    if num < 1.0:
      var lhs2 := Vector3(a.x, a.y)
      var rhs2 := Vector3(a2.x, a2.y)
      var z := Vector3.Cross(lhs2, rhs2).normalized.z
      var num2 := Mathf.Acos(num)
      rotationTarget += num2 * 57.29578 * z
      if rotationTarget < 0.0:
        rotationTarget += 360.0
      elif (this.rotationTarget >= 360f:
        rotationTarget -= 360.0
  elif (this.zoomEnabled  and  this.state == ControlState.ZoomingCamera:
    var magnitude := (touch1.position - touch0.position).magnitude
    var magnitude2 := (touch1.position - touch1.deltaPosition - (touch0.position - touch0.deltaPosition)).magnitude
    var num3 := magnitude - magnitude2
    zoomCamera.zoom = zoomCamera.zoom + num3 * zoomRate * Time.deltaTime

func CharacterControl():


  var raycastHit := default(RaycastHit)

  #if UNITY_EDITOR


  var touchCount := InputHelper.GetTouches().Count
  if touchCount == 1  and  state == ControlState.MovingCharacter:
    var touch := InputHelper.GetTouches()[0]
    if character.isGrounded  and  jumpButton.HitTest(touch.position):
      velocity = character.velocity
      velocity.y = jumpSpeed
    elif (!this.jumpButton.HitTest(touch.position)  and  touch.phase != TouchPhase.Began:
      var ray := this.cam.ScreenPointToRay(Vector3(touch.position.x, touch.position.y))
      if Physics.Raycast(ray, out raycastHit):
        var magnitude := (base.transform.position - raycastHit.point).magnitude
        if magnitude > minimumDistanceToMove:
          targetLocation = raycastHit.point
        moving = true
  #else
  var touchCount := UnityEngine.Input.touchCount
  if touchCount == 1  and  state == ControlState.MovingCharacter:
    var touch := UnityEngine.Input.GetTouch(0)
    if character.isGrounded  and  jumpButton.HitTest(touch.position):
      velocity = character.velocity
      velocity.y = jumpSpeed
    elif (!this.jumpButton.HitTest(touch.position)  and  touch.phase != TouchPhase.Began:
      var ray := this.cam.ScreenPointToRay(Vector3(touch.position.x, touch.position.y))
      if Physics.Raycast(ray, out raycastHit):
        var magnitude := (base.transform.position - raycastHit.point).magnitude
        if magnitude > minimumDistanceToMove:
          targetLocation = raycastHit.point
        moving = true
  #endif
  var vector := Vector3.zero
  if moving:
    vector = targetLocation - thisTransform.position
    vector.y = 0.0
    var magnitude2 := vector.magnitude
    if magnitude2 < 1.0:
      moving = false
    else:
      vector = vector.normalized * speed
  if not character.isGrounded:
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

func ResetControlState():
  state = ControlState.WaitingForFirstTouch
  fingerDown[0] = -1
  fingerDown[1] = -1

func _process(_delta):
  var touch := default(Touch)
  var touch2 := default(Touch)
  var touch3 := default(Touch)

  #if UNITY_EDITOR
  var touchCount := InputHelper.GetTouches().Count
  if touchCount == 0:
    ResetControlState()
  else:
    Touch[] touches = InputHelper.GetTouches().ToArray()
    var flag := false
    var flag2 := false
    if state == ControlState.WaitingForFirstTouch:
      for i in range(int(touchCount)):
        var touch4 := touches[i]
        if touch4.phase != TouchPhase.Ended  and  touch4.phase != TouchPhase.Canceled:
          state = ControlState.WaitingForSecondTouch
          firstTouchTime = Time.time
          fingerDown[0] = touch4.fingerId
          fingerDownPosition[0] = touch4.position
          fingerDownFrame[0] = Time.frameCount
          break
    if state == ControlState.WaitingForSecondTouch:
      for i in range(int(touchCount)):
        var touch4 := touches[i]
        if touch4.phase != TouchPhase.Canceled:
          if touchCount >= 2  and  touch4.fingerId != fingerDown[0]:
            state = ControlState.WaitingForMovement
            fingerDown[1] = touch4.fingerId
            fingerDownPosition[1] = touch4.position
            fingerDownFrame[1] = Time.frameCount
            break
          if touchCount == 1:
            var vector := touch4.position - this.fingerDownPosition[0]
            if touch4.fingerId == fingerDown[0]  and  (Time.time > firstTouchTime + minimumTimeUntilMove  or  touch4.phase == TouchPhase.Ended):
              state = ControlState.MovingCharacter
              break
    if state == ControlState.WaitingForMovement:
      for i in range(int(touchCount)):
        var touch4 := touches[i]
        if touch4.phase == TouchPhase.Began:
          if touch4.fingerId == fingerDown[0]  and  fingerDownFrame[0] == Time.frameCount:
            touch2 = touch4
            flag = true
          elif (touch4.fingerId != this.fingerDown[0]  and  touch4.fingerId != this.fingerDown[1]:
            fingerDown[1] = touch4.fingerId
            touch3 = touch4
            flag2 = true
        if touch4.phase == TouchPhase.Moved  or  touch4.phase == TouchPhase.Stationary  or  touch4.phase == TouchPhase.Ended:
          if touch4.fingerId == fingerDown[0]:
            touch2 = touch4
            flag = true
          elif (touch4.fingerId == this.fingerDown[1]:
            touch3 = touch4
            flag2 = true
      if flag:
        if flag2:
          var a := this.fingerDownPosition[1] - this.fingerDownPosition[0]
          var a2 := touch3.position - touch2.position
          var lhs := a / a.magnitude
          var rhs := a2 / a2.magnitude
          var num := Vector2.Dot(lhs, rhs)
          if num < 1.0:
            var num2 := Mathf.Acos(num)
            if num2 > rotateEpsilon * 0.0174532924:
              state = ControlState.RotatingCamera
          if state == ControlState.WaitingForMovement:
            var f := a.magnitude - a2.magnitude
            if Mathf.Abs(f) > zoomEpsilon:
              state = ControlState.ZoomingCamera
      else:
        state = ControlState.WaitingForNoFingers
    if state == ControlState.RotatingCamera  or  state == ControlState.ZoomingCamera:
      for i in range(int(touchCount)):
        var touch4 := touches[i]
        if touch4.phase == TouchPhase.Moved  or  touch4.phase == TouchPhase.Stationary  or  touch4.phase == TouchPhase.Ended:
          if touch4.fingerId == fingerDown[0]:
            touch2 = touch4
            flag = true
          elif (touch4.fingerId == this.fingerDown[1]:
            touch3 = touch4
            flag2 = true
      if flag:
        if flag2:
          CameraControl(touch2, touch3)
      else:
        state = ControlState.WaitingForNoFingers
  #else
  var touchCount := UnityEngine.Input.touchCount
  if touchCount == 0:
    ResetControlState()
  else:
    Touch[] touches = Input.touches
    var flag := false
    var flag2 := false
    if state == ControlState.WaitingForFirstTouch:
      for i in range(int(touchCount)):
        var touch4 := touches[i]
        if touch4.phase != TouchPhase.Ended  and  touch4.phase != TouchPhase.Canceled:
          state = ControlState.WaitingForSecondTouch
          firstTouchTime = Time.time
          fingerDown[0] = touch4.fingerId
          fingerDownPosition[0] = touch4.position
          fingerDownFrame[0] = Time.frameCount
          break
    if state == ControlState.WaitingForSecondTouch:
      for i in range(int(touchCount)):
        var touch4 := touches[i]
        if touch4.phase != TouchPhase.Canceled:
          if touchCount >= 2  and  touch4.fingerId != fingerDown[0]:
            state = ControlState.WaitingForMovement
            fingerDown[1] = touch4.fingerId
            fingerDownPosition[1] = touch4.position
            fingerDownFrame[1] = Time.frameCount
            break
          if touchCount == 1:
            var vector := touch4.position - this.fingerDownPosition[0]
            if touch4.fingerId == fingerDown[0]  and  (Time.time > firstTouchTime + minimumTimeUntilMove  or  touch4.phase == TouchPhase.Ended):
              state = ControlState.MovingCharacter
              break
    if state == ControlState.WaitingForMovement:
      for i in range(int(touchCount)):
        var touch4 := touches[i]
        if touch4.phase == TouchPhase.Began:
          if touch4.fingerId == fingerDown[0]  and  fingerDownFrame[0] == Time.frameCount:
            touch2 = touch4
            flag = true
          elif (touch4.fingerId != this.fingerDown[0]  and  touch4.fingerId != this.fingerDown[1]:
            fingerDown[1] = touch4.fingerId
            touch3 = touch4
            flag2 = true
        if touch4.phase == TouchPhase.Moved  or  touch4.phase == TouchPhase.Stationary  or  touch4.phase == TouchPhase.Ended:
          if touch4.fingerId == fingerDown[0]:
            touch2 = touch4
            flag = true
          elif (touch4.fingerId == this.fingerDown[1]:
            touch3 = touch4
            flag2 = true
      if flag:
        if flag2:
          var a := this.fingerDownPosition[1] - this.fingerDownPosition[0]
          var a2 := touch3.position - touch2.position
          var lhs := a / a.magnitude
          var rhs := a2 / a2.magnitude
          var num := Vector2.Dot(lhs, rhs)
          if num < 1.0:
            var num2 := Mathf.Acos(num)
            if num2 > rotateEpsilon * 0.0174532924:
              state = ControlState.RotatingCamera
          if state == ControlState.WaitingForMovement:
            var f := a.magnitude - a2.magnitude
            if Mathf.Abs(f) > zoomEpsilon:
              state = ControlState.ZoomingCamera
      else:
        state = ControlState.WaitingForNoFingers
    if state == ControlState.RotatingCamera  or  state == ControlState.ZoomingCamera:
      for i in range(int(touchCount)):
        var touch4 := touches[i]
        if touch4.phase == TouchPhase.Moved  or  touch4.phase == TouchPhase.Stationary  or  touch4.phase == TouchPhase.Ended:
          if touch4.fingerId == fingerDown[0]:
            touch2 = touch4
            flag = true
          elif (touch4.fingerId == this.fingerDown[1]:
            touch3 = touch4
            flag2 = true
      if flag:
        if flag2:
          CameraControl(touch2, touch3)
      else:
        state = ControlState.WaitingForNoFingers
  #endif

  CharacterControl()

func LateUpdate():
  var y := Mathf.SmoothDampAngle(this.cameraPivot.eulerAngles.y, this.rotationTarget, ref this.rotationVelocity, 0.3)
  var eulerAngles := this.cameraPivot.eulerAngles
  eulerAngles.y = y
  cameraPivot.eulerAngles = eulerAngles

var cameraObject: Node3D

var cameraPivot: Node3D

var jumpButton: Variant

var speed: float

var jumpSpeed: float

var inAirMultiplier: float

var minimumDistanceToMove: float

var minimumTimeUntilMove: float

var zoomEnabled: bool

var zoomEpsilon: float

var zoomRate: float

var rotateEnabled: bool

var rotateEpsilon: float

var zoomCamera: Variant

var cam: Variant

var thisTransform: Node3D

var character: Variant

var animationController: Variant

var targetLocation: Vector3

var moving: bool

var rotationTarget: float

var rotationVelocity: float

var velocity: Vector3

var state: Variant

private int[] fingerDown

private Vector2[] fingerDownPosition

private int[] fingerDownFrame

var firstTouchTime: float
