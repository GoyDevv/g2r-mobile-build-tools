# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TriggerNightSoundLow.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TriggerNightSoundLow
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((FadeNightSound)nightSoundHolder.GetComponent(typeof(FadeNightSound))).fadeDown()

  var nightSoundHolder: Node3D
