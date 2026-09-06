# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/checkSprayCounter.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name checkSprayCounter
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if textTimerOnOff:
      textTimer += Time.deltaTime
      if textTimer > 3.0:
        textTimerOnOff = false
        textTimer = 0.0
        sprayEmptyText.SetActive(false)

  func checkingSpray():
    textTimer = 0.0
    sprayEmptyText.SetActive(true)
    textTimerOnOff = true

  var sprayEmptyText: Node3D

  var sprayCounter := 5.0

  var textTimerOnOff: bool

  var textTimer: float
