# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/Joystick.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name Joystick
extends Node  # TODO: was MonoBehaviour
  func _init():
    deadZone = Vector2.zero
    lastFingerId = -1
    firstDeltaTime = 0.5
    guiBoundary = new Boundary()

  func _ready():
    footstepScriptHolder = GameObject.Find("Main Camera")
    gui = (GUITexture)GetComponent(typeof(GUITexture))
    defaultRect = gui.pixelInset
    defaultRect.x = defaultRect.x + position.x * Screen.width
    defaultRect.y = defaultRect.y + position.y * Screen.height
    var x := 0.0
    var vector := base.transform.position
    vector.x = x
    position = vector
    var y := 0.0
    var vector2 := base.transform.position
    vector2.y = y
    position = vector2
    defaultRect.width = 0.13 * Screen.width
    defaultRect.height = defaultRect.width
    defaultRect.x = 0.09 * Screen.width
    defaultRect.y = 0.13 * Screen.height
    var width := 0.13 * (float)Screen.width
    var pixelInset := this.joystickRing.pixelInset
    pixelInset.width = width
    joystickRing.pixelInset = pixelInset
    var width2 := this.defaultRect.width
    var pixelInset2 := this.joystickRing.pixelInset
    pixelInset2.height = width2
    joystickRing.pixelInset = pixelInset2
    var x2 := 0.09 * (float)Screen.width
    var pixelInset3 := this.joystickRing.pixelInset
    pixelInset3.x = x2
    joystickRing.pixelInset = pixelInset3
    var y2 := 0.13 * (float)Screen.height
    var pixelInset4 := this.joystickRing.pixelInset
    pixelInset4.y = y2
    joystickRing.pixelInset = pixelInset4
    if touchPad:
      if gui.texture:
        touchZone = defaultRect
    else:
      guiTouchOffset.x = defaultRect.width * 0.5
      guiTouchOffset.y = defaultRect.height * 0.5
      guiCenter.x = defaultRect.x + guiTouchOffset.x
      guiCenter.y = defaultRect.y + guiTouchOffset.y
      guiBoundary.min.x = defaultRect.x - guiTouchOffset.x
      guiBoundary.max.x = defaultRect.x + guiTouchOffset.x
      guiBoundary.min.y = defaultRect.y - guiTouchOffset.y
      guiBoundary.max.y = defaultRect.y + guiTouchOffset.y

  func Disable():
    self.SetActive(false)
    Joystick.enumeratedJoysticks = false

  func ResetJoystick():
    if not havestopped:
      havestopped = true
      ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
    gui.pixelInset = defaultRect
    lastFingerId = -1
    position = Vector2.zero
    fingerDownPos = Vector2.zero
    if touchPad:
      var a := 0.025
      var color := this.gui.color
      color.a = a
      gui.color = color

  func IsFingerDown():
    return lastFingerId != -1

  func LatchedFinger(fingerId: int):
    if lastFingerId == fingerId:
      ResetJoystick()

  func _process(_delta):
    if not Joystick.enumeratedJoysticks:
      Joystick.joysticks = (Joystick[])Object.FindObjectsOfType(typeof(Joystick))
      Joystick.enumeratedJoysticks = true

    #if UNITY_EDITOR
    var touchCount := InputHelper.GetTouches().Count
    if tapTimeWindow > 0.0:
      tapTimeWindow -= Time.deltaTime
      ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walk()
      havestopped = false
    else:
      tapCount = 0
    if touchCount == 0:
      ResetJoystick()
    else:
      for i in range(int(touchCount)):
        var touch := InputHelper.GetTouches()[i]
        var vector := touch.position - this.guiTouchOffset
        var flag := false
        if touchPad:
          if touchZone.Contains(touch.position):
            flag = true
        elif (this.gui.HitTest(touch.position):
          flag = true
        if flag  and  (lastFingerId == -1  or  lastFingerId != touch.fingerId):
          if touchPad:
            var a := 0.15
            var color := this.gui.color
            color.a = a
            gui.color = color
            lastFingerId = touch.fingerId
            fingerDownPos = touch.position
            fingerDownTime = Time.time
          lastFingerId = touch.fingerId
          if tapTimeWindow > 0.0:
            tapCount++
          else:
            tapCount = 1
            tapTimeWindow = Joystick.tapTimeDelta
          for joystick in Joystick.joysticks:
            if joystick != this:
              joystick.LatchedFinger(touch.fingerId)
        if lastFingerId == touch.fingerId:
          if touch.tapCount > tapCount:
            tapCount = touch.tapCount
          if touchPad:
            position.x = Mathf.Clamp((touch.position.x - fingerDownPos.x) / (touchZone.width / 2.0), -1.0, 1.0)
            position.y = Mathf.Clamp((touch.position.y - fingerDownPos.y) / (touchZone.height / 2.0), -1.0, 1.0)
          else:
            ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walk()
            var x := Mathf.Clamp(vector.x, this.guiBoundary.min.x * 1.09, this.guiBoundary.max.x * 1.09)
            var pixelInset := this.gui.pixelInset
            pixelInset.x = x
            gui.pixelInset = pixelInset
            var y := Mathf.Clamp(vector.y, this.guiBoundary.min.y, this.guiBoundary.max.y * 1.09)
            var pixelInset2 := this.gui.pixelInset
            pixelInset2.y = y
            gui.pixelInset = pixelInset2
          if touch.phase == TouchPhase.Ended  or  touch.phase == TouchPhase.Canceled:
            ResetJoystick()

    #else
    var touchCount := UnityEngine.Input.touchCount
    if tapTimeWindow > 0.0:
      tapTimeWindow -= Time.deltaTime
      ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walk()
      havestopped = false
    else:
      tapCount = 0
    if touchCount == 0:
      ResetJoystick()
    else:
      for i in range(int(touchCount)):
        var touch := UnityEngine.Input.GetTouch(i)
        var vector := touch.position - this.guiTouchOffset
        var flag := false
        if touchPad:
          if touchZone.Contains(touch.position):
            flag = true
        elif (this.gui.HitTest(touch.position):
          flag = true
        if flag  and  (lastFingerId == -1  or  lastFingerId != touch.fingerId):
          if touchPad:
            var a := 0.15
            var color := this.gui.color
            color.a = a
            gui.color = color
            lastFingerId = touch.fingerId
            fingerDownPos = touch.position
            fingerDownTime = Time.time
          lastFingerId = touch.fingerId
          if tapTimeWindow > 0.0:
            tapCount++
          else:
            tapCount = 1
            tapTimeWindow = Joystick.tapTimeDelta
          for joystick in Joystick.joysticks:
            if joystick != this:
              joystick.LatchedFinger(touch.fingerId)
        if lastFingerId == touch.fingerId:
          if touch.tapCount > tapCount:
            tapCount = touch.tapCount
          if touchPad:
            position.x = Mathf.Clamp((touch.position.x - fingerDownPos.x) / (touchZone.width / 2.0), -1.0, 1.0)
            position.y = Mathf.Clamp((touch.position.y - fingerDownPos.y) / (touchZone.height / 2.0), -1.0, 1.0)
          else:
            ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).walk()
            var x := Mathf.Clamp(vector.x, this.guiBoundary.min.x * 1.09, this.guiBoundary.max.x * 1.09)
            var pixelInset := this.gui.pixelInset
            pixelInset.x = x
            gui.pixelInset = pixelInset
            var y := Mathf.Clamp(vector.y, this.guiBoundary.min.y, this.guiBoundary.max.y * 1.09)
            var pixelInset2 := this.gui.pixelInset
            pixelInset2.y = y
            gui.pixelInset = pixelInset2
          if touch.phase == TouchPhase.Ended  or  touch.phase == TouchPhase.Canceled:
            ResetJoystick()

    #endif
    if not touchPad:
      position.x = (gui.pixelInset.x + guiTouchOffset.x - guiCenter.x) / guiTouchOffset.x
      position.y = (gui.pixelInset.y + guiTouchOffset.y - guiCenter.y) / guiTouchOffset.y
    var num := Mathf.Abs(this.position.x)
    var num2 := Mathf.Abs(this.position.y)
    if num < deadZone.x:
      position.x = 0.0
    elif (this.normalize:
      position.x = Mathf.Sign(position.x) * (num - deadZone.x) / (1.0 - deadZone.x)
    if num2 < deadZone.y:
      position.y = 0.0
    elif (this.normalize:
      position.y = Mathf.Sign(position.y) * (num2 - deadZone.y) / (1.0 - deadZone.y)

  private static Joystick[] joysticks

  var enumeratedJoysticks: bool

  var tapTimeDelta := 0.3

  var touchPad: bool

  var touchZone: Variant

  var deadZone: Variant

  var normalize: bool

  var position: Variant

  var tapCount: int

  var lastFingerId: int

  var tapTimeWindow: float

  var fingerDownPos: Variant

  var fingerDownTime: float

  var firstDeltaTime: float

  var gui: Variant

  var defaultRect: Variant

  var guiBoundary: Variant

  var guiTouchOffset: Variant

  var guiCenter: Variant

  var havestopped: bool

  var joystickRing: Variant

  var footstepScriptHolder: Node3D

  var JoystickBase: Node3D

  var joystickCircle: Node3D
