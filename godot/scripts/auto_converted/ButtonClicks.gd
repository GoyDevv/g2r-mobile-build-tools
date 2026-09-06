# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ButtonClicks.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ButtonClicks
extends Node  # TODO: was MonoBehaviour
  func clickButton():
    AudioSource.PlayClipAtPoint(buttonclick, position)

  func beartrap():
    AudioSource.PlayClipAtPoint(bearTrap, position)

  var buttonclick: Variant

  var bearTrap: Variant
