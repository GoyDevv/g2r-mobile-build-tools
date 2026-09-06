# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/lockerdoorscript.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name lockerdoorscript
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    if not doorOpen  and  base.GetComponent<Animation>().IsPlaying("LockerDoorOpen"):
      doorOpen = true
      self.tag = "Untagged"
    if doorOpen  and  base.GetComponent<Animation>().IsPlaying("LockerDoorClose"):
      doorOpen = false

  var doorOpen: bool
