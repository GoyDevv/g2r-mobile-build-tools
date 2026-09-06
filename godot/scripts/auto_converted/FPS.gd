# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FPS.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FPS
extends Node  # TODO: was MonoBehaviour
  func _init():
    updateInterval = 0.5

  func _ready():
    if not base.GetComponent<GUIText>():
      MonoBehaviour.print("FramesPerSecond needs a GUIText component!")
      enabled = false
      return
    timeleft = updateInterval

  func _process(_delta):
    timeleft -= Time.deltaTime
    accum += Time.timeScale / Time.deltaTime
    frames++
    if timeleft <= 0.0:
      get_node(\"TODO_GUIText\")  # TODO: GetComponent.text = string.Empty + (accum / frames).ToString("f2")
      timeleft = updateInterval
      accum = 0.0
      frames = 0

  var updateInterval: float

  var accum: float

  var frames: int

  var timeleft: float
