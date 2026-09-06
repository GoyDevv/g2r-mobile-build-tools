# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/selfDestructMomFly.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name selfDestructMomFly
extends Node  # TODO: was MonoBehaviour
  func _ready():
    yield return new WaitForSeconds(1.0)
    Object.queue_free  # TODO: Destroy(head)
    var break: Variant

  var head: Node3D
