# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ClickOptionButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ClickOptionButton
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

    #if UNITY_EDITOR
    if InputHelper.GetTouches().Count > 0:
      var position := InputHelper.GetTouches()[0].position
      if base.GetComponent<GUITexture>().HitTest(position):
        buttonPressed = true
        self  # TODO: was transform.localPosition = Vector3(-0.25, -0.04, 2.0)
        if not buttonsounds:
          buttonsounds = true
          ((ButtonClicks)ljudHolder.GetComponent(typeof(ButtonClicks))).clickButton()
      else:
        self  # TODO: was transform.localPosition = Vector3(-0.28, -0.04, 2.0)
        buttonPressed = false
        buttonsounds = false

    #else
    if UnityEngine.Input.touchCount > 0:
      var position := UnityEngine.Input.GetTouch(0).position
      if base.GetComponent<GUITexture>().HitTest(position):
        buttonPressed = true
        self  # TODO: was transform.localPosition = Vector3(-0.25, -0.04, 2.0)
        if not buttonsounds:
          buttonsounds = true
          ((ButtonClicks)ljudHolder.GetComponent(typeof(ButtonClicks))).clickButton()
      else:
        self  # TODO: was transform.localPosition = Vector3(-0.28, -0.04, 2.0)
        buttonPressed = false
        buttonsounds = false
    #endif
    elif (this.buttonPressed:
      self  # TODO: was transform.localPosition = Vector3(-0.28, -0.04, 2.0)
      buttonPressed = false
      OptionsMenu.SetActive(true)
      MenuButtons.SetActive(false)
      if PlayerPrefs.GetInt("ADSon") == 0:
        noAdsButton.SetActive(true)



  var ljudHolder: Node3D

  var buttonPressed: bool

  var buttonsounds: bool

  var OptionsMenu: Node3D

  var MenuButtons: Node3D

  var noAdsButton: Node3D
