# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/activatePlaskTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name activatePlaskTrigger
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      plaskTrigger.SetActive(true)

  var plaskTrigger: Node3D
