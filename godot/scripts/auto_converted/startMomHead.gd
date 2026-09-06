# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/startMomHead.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name startMomHead
extends Node  # TODO: was MonoBehaviour
  func _ready():
    yield return new WaitForSeconds(5.0)
    head.SetActive(true)
    var break: Variant

  var head: Node3D
