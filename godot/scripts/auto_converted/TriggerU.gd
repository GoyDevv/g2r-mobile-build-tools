# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TriggerU.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TriggerU
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "platta":
      ((plattaflyttas)plattaU.GetComponent(typeof(plattaflyttas))).Upp = false

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "platta":
      ((plattaflyttas)plattaU.GetComponent(typeof(plattaflyttas))).Upp = true

  var plattaU: Node3D
