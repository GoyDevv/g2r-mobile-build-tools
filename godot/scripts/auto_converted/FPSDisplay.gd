# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FPSDisplay.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FPSDisplay
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    deltaTime += (Time.unscaledDeltaTime - deltaTime) * 0.1

  func OnGUI():
    var width := Screen.width
    var height := Screen.height
    var guistyle := new GUIStyle()
    var position := new Rect(0.0, 0.0, (float)width, (float)(height * 2 / 100))
    guistyle.alignment = TextAnchor.UpperLeft
    guistyle.fontSize = height * 2 / 100
    guistyle.normal.textColor = new Color(0.0, 0.0, 0.5, 1.0)
    var num := this.deltaTime * 1000.0
    var num2 := 1.0 / this.deltaTime
    var text := string.Format("{0:0.0} ms ({1:0.} fps)", num, num2)
    GUI.Label(position, text, guistyle)

  var deltaTime: float
