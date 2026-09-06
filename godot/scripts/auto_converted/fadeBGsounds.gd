# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/fadeBGsounds.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name fadeBGsounds
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((backgroundSound)Sound1.GetComponent(typeof(backgroundSound))).fadeDown = true
      ((backgroundSound)Sound2.GetComponent(typeof(backgroundSound))).fadeUp = true

  var Sound1: Node3D

  var Sound2: Node3D
