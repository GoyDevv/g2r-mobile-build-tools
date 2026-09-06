# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/pressFueltankButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name pressFueltankButton
extends Node  # TODO: was MonoBehaviour
  func OnPointerDown(eventData: Variant):
    ((fillingFuel)brunnsVevScriptHolder.GetComponent(typeof(fillingFuel))).playerHoldButton = true

  func OnPointerUp(eventData: Variant):
    ((fillingFuel)brunnsVevScriptHolder.GetComponent(typeof(fillingFuel))).playerHoldButton = false

  var brunnsVevScriptHolder: Node3D
