# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ClickCloseButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ClickCloseButton
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    for touch in InputHelper.GetTouches():
      if touch.phase == TouchPhase.Began  and  base.GetComponent<GUITexture>().HitTest(touch.position):
        OptionsMenu.SetActive(false)
        MenuButtons.SetActive(true)
        ((ButtonClicks)ljudHolder.GetComponent(typeof(ButtonClicks))).clickButton()

  var OptionsMenu: Node3D

  var MenuButtons: Node3D

  var ljudHolder: Node3D
