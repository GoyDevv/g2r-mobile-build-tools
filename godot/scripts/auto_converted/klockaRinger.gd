# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/klockaRinger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name klockaRinger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if startKlock:
      startKlock = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(klockljud)
      self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Klocka")

  var startKlock: bool

  var klockljud: Variant
