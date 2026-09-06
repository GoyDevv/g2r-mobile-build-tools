# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/soundEffects2.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name soundEffects2
extends Node  # TODO: was MonoBehaviour
  func _ready():
    var component := base.GetComponent<AudioSource>()
    component.clip = sword

  func swordSwing():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = sword
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  func slendrinaPain():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = pain
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  func slendrinaDie():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = die
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  var sword: Variant

  var pain: Variant

  var die: Variant
