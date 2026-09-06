# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/maniacBreath.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name maniacBreath
extends Node  # TODO: was MonoBehaviour
  func _ready():
    var component := base.GetComponent<AudioSource>()
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
    component.clip = breathSlow

  func stopAudio():

  func maniacBreathSlow():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = breathSlow
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  func maniacBreathFast():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = breathFast
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  func maniachurt():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = hurt
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  func maniafreezed():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = freezed
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  var breathSlow: Variant

  var breathFast: Variant

  var hurt: Variant

  var freezed: Variant
