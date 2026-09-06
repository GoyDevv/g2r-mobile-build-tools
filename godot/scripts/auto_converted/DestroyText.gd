# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/DestroyText.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name DestroyText
extends Node  # TODO: was MonoBehaviour
  func _ready():
    yield return new WaitForSeconds(3.0)
    Object.queue_free  # TODO: Destroy(self)
    var break: Variant
