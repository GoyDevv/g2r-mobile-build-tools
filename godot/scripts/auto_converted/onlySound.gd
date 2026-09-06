# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/onlySound.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name onlySound
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "golv":
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)

  var ObjectLjud: Variant
