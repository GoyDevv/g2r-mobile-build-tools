# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TestFPS.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TestFPS
extends Node  # TODO: was MonoBehaviour
  func _ready():
    StartCoroutine(FPS())

  func FPS():
    for () {
    var lastFrameCount := Time.frameCount
    var lastTime := Time.realtimeSinceStartup
    yield return new WaitForSeconds(frequency)
    var timeSpan := Time.realtimeSinceStartup - lastTime
    var frameCount := Time.frameCount - lastFrameCount
    fps = string.Format("FPS: {0}", frameCount / timeSpan)
  var break: Variant

func OnGUI():
  GUI.Label(new Rect((Screen.width - 100), 10.0, 150.0, 20.0), fps)

var FramesPerSec: int

var frequency := 1.0

var fps: String
