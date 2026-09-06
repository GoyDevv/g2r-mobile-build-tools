# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/NeedToGetOuttrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name NeedToGetOuttrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      needToGetOutText.SetActive(true)
      ((TextInactivate)needToGetOutText.GetComponent(typeof(TextInactivate))).travelDown = true
      Object.queue_free  # TODO: Destroy(self)

  var needToGetOutText: Node3D
