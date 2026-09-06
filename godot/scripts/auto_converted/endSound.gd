# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/endSound.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name endSound
extends Node  # TODO: was MonoBehaviour
  func _ready():
    RenderSettings.fog = false

  func startEndSound():
    AudioSource.PlayClipAtPoint(playerEnd, position)

  var playerEnd: Variant
