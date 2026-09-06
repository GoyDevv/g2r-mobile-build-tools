# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/boxFall.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name boxFall
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Terrain":
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(boxLjud)

  var boxLjud: Variant
