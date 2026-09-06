# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/remoteLocktrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name remoteLocktrigger
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      playerNearDoorLock = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      playerNearDoorLock = false

  var playerNearDoorLock: bool
