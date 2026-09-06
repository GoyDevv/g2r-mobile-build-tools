# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/disableKinematic.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name disableKinematic
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not done:
      done = true
      ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(sound)

  var sound: Variant

  var done: bool
