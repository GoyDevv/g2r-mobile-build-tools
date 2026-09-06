# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/vevaBrunnsVev.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name vevaBrunnsVev
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnPointerDown(eventData: Variant):
    isDown = true
    ((playerVevar)brunnsVevScriptHolder.GetComponent(typeof(playerVevar))).playerHoldButton = true

  func OnPointerUp(eventData: Variant):
    isDown = false
    ((playerVevar)brunnsVevScriptHolder.GetComponent(typeof(playerVevar))).playerHoldButton = false
    ((vevarBrunnLjud)brunnsLjud.GetComponent(typeof(vevarBrunnLjud))).PlayerVevar = false

  var brunnsVevScriptHolder: Node3D

  var brunnsLjud: Node3D

  var isDown: bool
