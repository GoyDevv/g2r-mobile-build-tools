# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/clickOptionButtonIG.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name clickOptionButtonIG
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    Time.timeScale = 0.0
    optionMenu.SetActive(true)
    optionButton.SetActive(false)
    joystick.SetActive(false)
    crouchButton.SetActive(false)
    bedButtons.SetActive(false)
    carControls.SetActive(false)
    diffButtons.SetActive(false)
    ((backgroundSound)soundHolder.GetComponent(typeof(backgroundSound))).buttonClick()

  var optionMenu: Node3D

  var optionButton: Node3D

  var joystick: Node3D

  var crouchButton: Node3D

  var bedButtons: Node3D

  var soundHolder: Node3D

  var carControls: Node3D

  var diffButtons: Node3D

  var btn1: Variant
