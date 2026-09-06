# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/clickBeartrapMenu.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name clickBeartrapMenu
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    if not beartrapOK:
      beartrapOK = true
      beartrapClose.SetActive(true)
      ((ButtonClicks)SoundHolder.GetComponent(typeof(ButtonClicks))).beartrap()
      beartrapOpen.SetActive(false)

  var beartrapOpen: Node3D

  var beartrapClose: Node3D

  var SoundHolder: Node3D

  var beartrapOK: bool

  var btn1: Variant
