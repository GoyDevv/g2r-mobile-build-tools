# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/fadeText1.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name fadeText1
extends Node  # TODO: was MonoBehaviour
  func _ready():
    yield return new WaitForSeconds(2.0)
    yield return StartCoroutine(Fade(1.0, 0.0, 2.0))
    var break: Variant

  func Fade(startLevel: float, endLevel: float, duration: float):
    for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
    var a := Mathf.Lerp(startLevel, endLevel, t)
    var color := this.text.color
    color.a = a
    text.color = color
    yield return null
  var break: Variant

var text: Variant

var fadeTextSpeed: float
