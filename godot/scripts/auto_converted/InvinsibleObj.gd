# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/InvinsibleObj.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name InvinsibleObj
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Component[] componentsInChildren = GetComponentsInChildren(typeof(Renderer))
    for renderer in componentsInChildren:
      renderer.material.renderQueue = 2002
