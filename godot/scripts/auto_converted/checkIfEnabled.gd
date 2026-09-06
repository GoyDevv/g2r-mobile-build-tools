# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/checkIfEnabled.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name checkIfEnabled
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if Menu.activeSelf:
      ((fadeText)playButton.GetComponent(typeof(fadeText))).scriptReady = true

  var Menu: Node3D

  var playButton: Node3D
