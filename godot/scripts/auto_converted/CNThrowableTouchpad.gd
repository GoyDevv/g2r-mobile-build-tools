# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CNThrowableTouchpad.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CNThrowableTouchpad
extends Node  # TODO: base was CNTouchpad
  public float SpeedDecay {
  get {
  return _speedDecay
set {
_speedDecay = value

func ResetControlState():
  IsCurrentlyTweaking = false
  OnFingerLifted()

func _process(_delta):
  Update()
  if base.CurrentAxisValues.sqrMagnitude <= 0.001:
    CurrentAxisValues = Vector2.zero
    return
  CurrentAxisValues *= SpeedDecay
  OnControllerMoved(CurrentAxisValues)

var _speedDecay := 0.9
