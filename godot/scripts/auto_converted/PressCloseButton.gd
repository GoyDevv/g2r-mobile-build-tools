# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/PressCloseButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name PressCloseButton
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    for touch in InputHelper.GetTouches():
      if touch.phase == TouchPhase.Ended  and  base.GetComponent<GUITexture>().HitTest(touch.position):
        ((soundEffectsMenu)ljudHolder.GetComponent(typeof(soundEffectsMenu))).buttonClick()
        HelpMenu.SetActive(false)
        ((fadeText)playButton.GetComponent(typeof(fadeText))).buttonReady = false
        ((fadeText)playButton.GetComponent(typeof(fadeText))).scriptReady = true
        playButton.SetActive(true)

  var HelpMenu: Node3D

  var playButton: Node3D

  var quitButton: Node3D

  var helpButton: Node3D

  var ljudHolder: Node3D

  var moreGamesButton: Node3D
