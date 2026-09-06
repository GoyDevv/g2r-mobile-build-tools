# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/rivNerTavla.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name rivNerTavla
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = false
    elif (other.gameObject.tag == "arrow":
      ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = false
