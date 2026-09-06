# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/StartTheApp.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name StartTheApp
extends Node  # TODO: was MonoBehaviour
  func _ready():
    if PlayerPrefs.GetInt("ADSon") == 0:
      if PlayerPrefs.GetInt("GDPRoption") == 0:
        GDPRmenu.SetActive(true)
        menuButtons.SetActive(false)
        iapButton.SetActive(false)
      else:
        GDPRmenu.SetActive(false)
        menuButtons.SetActive(true)
        iapButton.SetActive(true)

  var GDPRmenu: Node3D

  var menuButtons: Node3D

  var iapButton: Node3D
