# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/SwipeScript.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name SwipeScript
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):

    #if UNITY_EDITOR
    if InputHelper.GetTouches().Count > 0:
      for touch in InputHelper.GetTouches():
        var phase := touch.phase
        if phase != TouchPhase.Ended:
          if phase != TouchPhase.Canceled:
            if phase == TouchPhase.Began:
              var num := Time.time - this.fingerStartTime
              var magnitude := (touch.position - this.fingerStartPos).magnitude
              if isSwipe  and  num < maxSwipeTime  and  magnitude > minSwipeDist:
                var vector := touch.position - this.fingerStartPos
                var vector2 := Vector2.zero
                if Mathf.Abs(vector.x) > Mathf.Abs(vector.y):
                  vector2 = Vector2.right * Mathf.Sign(vector.x)
                else:
                  vector2 = Vector2.up * Mathf.Sign(vector.y)
                if vector2.x != 0.0:
                  if vector2.x > 0.0:
                    print("Right")
                  else:
                    print("Left")
                if vector2.y == 0.0  or  vector2.y > 0.0:
          else:
            isSwipe = false
        else:
          isSwipe = true
          fingerStartTime = Time.time
          fingerStartPos = touch.position

    #else
    if UnityEngine.Input.touchCount > 0:
      for touch in Input.touches:
        var phase := touch.phase
        if phase != TouchPhase.Ended:
          if phase != TouchPhase.Canceled:
            if phase == TouchPhase.Began:
              var num := Time.time - this.fingerStartTime
              var magnitude := (touch.position - this.fingerStartPos).magnitude
              if isSwipe  and  num < maxSwipeTime  and  magnitude > minSwipeDist:
                var vector := touch.position - this.fingerStartPos
                var vector2 := Vector2.zero
                if Mathf.Abs(vector.x) > Mathf.Abs(vector.y):
                  vector2 = Vector2.right * Mathf.Sign(vector.x)
                else:
                  vector2 = Vector2.up * Mathf.Sign(vector.y)
                if vector2.x != 0.0:
                  if vector2.x > 0.0:
                    print("Right")
                  else:
                    print("Left")
                if vector2.y == 0.0  or  vector2.y > 0.0:
          else:
            isSwipe = false
        else:
          isSwipe = true
          fingerStartTime = Time.time
          fingerStartPos = touch.position
    #endif

  var fingerStartTime: float

  var fingerStartPos := Vector2.zero

  var isSwipe: bool

  var minSwipeDist := 50.0

  var maxSwipeTime := 3.5

  var animationHolder: Node3D
