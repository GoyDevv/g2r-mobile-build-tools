# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/backgroundSound.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name backgroundSound
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if fadeUp:
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume + Time.deltaTime * 0.3
      if base.GetComponent<AudioSource>().volume > 0.1:
        fadeUp = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.1
    if fadeDown:
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume - Time.deltaTime * 0.3
      if base.GetComponent<AudioSource>().volume == 0.0:
        fadeDown = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.0
    if fadeUp:
      fadeDown = false
    elif (this.fadeDown:
      fadeUp = false

  func buttonClick():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(knappLjud)

  var fadeUp: bool

  var fadeDown: bool

  var knappLjud: Variant
