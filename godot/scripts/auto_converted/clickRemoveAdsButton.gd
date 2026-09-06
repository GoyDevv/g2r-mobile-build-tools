# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/clickRemoveAdsButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name clickRemoveAdsButton
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    for touch in InputHelper.GetTouches():
      if touch.phase == TouchPhase.Began  and  base.GetComponent<GUITexture>().HitTest(touch.position):
        ((ButtonClicks)ljudHolder.GetComponent(typeof(ButtonClicks))).clickButton()

  var ljudHolder: Node3D
