# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/soundEffectsMenu.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name soundEffectsMenu
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Time.timeScale = 1.0
    AudioListener.pause = false
    AudioListener.volume = 1.0

  func buttonClick():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(knappLjud)

  var knappLjud: Variant
