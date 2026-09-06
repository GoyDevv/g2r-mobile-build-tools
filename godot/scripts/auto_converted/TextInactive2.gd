# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TextInactive2.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TextInactive2
extends Node  # TODO: was MonoBehaviour
  func _init():
    timer = 3.0

  func _ready():
    var y := 14.27
    var localPosition := base.transform.localPosition
    localPosition.y = y
    self  # TODO: was transform.localPosition = localPosition
    travelDown = true

  func _process(_delta):
    if travelDown:
      timer -= Time.deltaTime
      var y := base.transform.localPosition.y - 0.001
      var localPosition := base.transform.localPosition
      localPosition.y = y
      self  # TODO: was transform.localPosition = localPosition
    if timer < 0.0:
      travelDown = false
      timer = 3.0
      var y2 := 14.27
      var localPosition2 := base.transform.localPosition
      localPosition2.y = y2
      self  # TODO: was transform.localPosition = localPosition2
      self.SetActive(false)

  var travelDown: bool

  var timer: float
