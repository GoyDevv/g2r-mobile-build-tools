# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CloseOptionButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CloseOptionButton
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    for touch in InputHelper.GetTouches():
      if touch.phase == TouchPhase.Ended  and  base.GetComponent<GUITexture>().HitTest(touch.position):
        optionMenu.SetActive(false)
        joystick.SetActive(true)
        joystickRing.SetActive(true)
        mapButton.SetActive(true)
        swordButton.SetActive(true)
        allapapperslappar.SetActive(true)
        pianoCollider.SetActive(true)
        Time.timeScale = 1.0

  var optionMenu: Node3D

  var joystick: Node3D

  var joystickRing: Node3D

  var mapButton: Node3D

  var swordButton: Node3D

  var allapapperslappar: Node3D

  var pianoCollider: Node3D
