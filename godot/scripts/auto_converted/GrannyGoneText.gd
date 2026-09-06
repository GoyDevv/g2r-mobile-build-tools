# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/GrannyGoneText.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name GrannyGoneText
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if textOnOff:
      text.enabled = true
      timer += Time.deltaTime
      if timer > 5.0:
        textOnOff = false
        timer = 0.0
        text.enabled = false

  var textOnOff: bool

  var timer: float

  var text: Variant
