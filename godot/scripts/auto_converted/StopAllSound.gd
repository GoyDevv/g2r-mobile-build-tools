# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/StopAllSound.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name StopAllSound
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func stopSounds():
    AudioListener.pause = true

  func startSounds():
    AudioListener.pause = false
