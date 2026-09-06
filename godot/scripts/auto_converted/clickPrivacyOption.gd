# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/clickPrivacyOption.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name clickPrivacyOption
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    GDPRmenu.SetActive(true)
    menuButtons.SetActive(false)

  var GDPRmenu: Node3D

  var menuButtons: Node3D

  var btn1: Variant
