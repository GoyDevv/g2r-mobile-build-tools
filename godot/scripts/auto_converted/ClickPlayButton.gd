# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ClickPlayButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ClickPlayButton
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    if not buttonPressed:
      buttonPressed = true
      Menubackground.SetActive(false)
      optionbackground.SetActive(true)
      allButtons.SetActive(false)
      OptionButtons.SetActive(true)
      iapButton.SetActive(false)
      ((ButtonClicks)ljudHolder.GetComponent(typeof(ButtonClicks))).clickButton()

  var allButtons: Node3D

  var ljudHolder: Node3D

  var OptionButtons: Node3D

  var Menubackground: Node3D

  var optionbackground: Node3D

  var iapButton: Node3D

  var buttonPressed: bool

  var buttonsounds: bool

  var btn1: Variant
