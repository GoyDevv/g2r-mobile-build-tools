# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TriggerN.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TriggerN
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "platta":
      ((plattaflyttas)plattaN.GetComponent(typeof(plattaflyttas))).Ner = false

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "platta":
      ((plattaflyttas)plattaN.GetComponent(typeof(plattaflyttas))).Ner = true

  var plattaN: Node3D
