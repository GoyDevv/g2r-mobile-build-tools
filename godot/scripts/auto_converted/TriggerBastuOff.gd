# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TriggerBastuOff.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TriggerBastuOff
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      bastuSteam.SetActive(false)

  var bastuSteam: Node3D
