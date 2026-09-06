# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/fadeBGsoundsBR.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name fadeBGsoundsBR
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((backgroundSound)Sound1.GetComponent(typeof(backgroundSound))).fadeDown = true
      ((backgroundSound)Sound2.GetComponent(typeof(backgroundSound))).fadeUp = true
      landSoundTrigger.SetActive(true)

  var Sound1: Node3D

  var Sound2: Node3D

  var landSoundTrigger: Node3D
