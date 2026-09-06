# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/closeOptionMenuIG.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name closeOptionMenuIG
extends Node  # TODO: was MonoBehaviour
  func _ready():
    var saveSensitivityData := (saveSensitivityData)this.savedValue.GetComponent(typeof(saveSensitivityData))
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    var saveSensitivityData := (saveSensitivityData)this.savedValue.GetComponent(typeof(saveSensitivityData))
    Time.timeScale = 1.0
    optionMenu.SetActive(false)
    optionButton.SetActive(true)
    joystick.SetActive(true)
    crouchButton.SetActive(true)
    bedButtons.SetActive(true)
    carControls.SetActive(true)
    diffButtons.SetActive(true)
    PlayerPrefs.SetInt("slideData", saveSensitivityData.sliderValue)
    ((backgroundSound)soundHolder.GetComponent(typeof(backgroundSound))).buttonClick()

  var optionMenu: Node3D

  var optionButton: Node3D

  var joystick: Node3D

  var crouchButton: Node3D

  var bedButtons: Node3D

  var savedValue: Node3D

  var soundHolder: Node3D

  var carControls: Node3D

  var diffButtons: Node3D

  var btn1: Variant
