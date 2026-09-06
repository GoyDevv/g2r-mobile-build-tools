# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/destroyObjects.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name destroyObjects
extends Node  # TODO: was MonoBehaviour
  func _ready():
    yield return new WaitForSeconds(timer)
    Object.queue_free  # TODO: Destroy(@object)
    var break: Variant

  public GameObject @object

  var timer: float
