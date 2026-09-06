# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/soundEffectsBeds.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name soundEffectsBeds
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func playerCaught():
    AudioSource.PlayClipAtPoint(PCaught, position)

  var PCaught: Variant
