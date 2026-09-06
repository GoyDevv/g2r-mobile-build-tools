# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/playerResetFloor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name playerResetFloor
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "resetfloor":
      player.position = playerResetPos.position
      ((backgroundSound)Sound1.GetComponent(typeof(backgroundSound))).fadeDown = true
      ((backgroundSound)Sound2.GetComponent(typeof(backgroundSound))).fadeUp = true

  var player: Node3D

  var playerResetPos: Node3D

  var Sound1: Node3D

  var Sound2: Node3D
