# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/PressOptionButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name PressOptionButton
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    for touch in InputHelper.GetTouches():
      if touch.phase == TouchPhase.Ended  and  base.GetComponent<GUITexture>().HitTest(touch.position):
        optionMenu.SetActive(true)
        joystick.SetActive(false)
        joystickRing.SetActive(false)
        mapButton.SetActive(false)
        swordButton.SetActive(false)
        allapapperslappar.SetActive(false)
        pianoCollider.SetActive(false)
        Time.timeScale = 0.0

  var optionMenu: Node3D

  var joystick: Node3D

  var joystickRing: Node3D

  var mapButton: Node3D

  var swordButton: Node3D

  var allapapperslappar: Node3D

  var pianoCollider: Node3D
