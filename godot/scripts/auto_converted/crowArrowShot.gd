# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/crowArrowShot.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name crowArrowShot
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "arrow":
      ((CrowControl)crow.GetComponent(typeof(CrowControl))).shootInBur = true

  var crow: Node3D
