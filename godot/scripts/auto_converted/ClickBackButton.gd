# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ClickBackButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ClickBackButton
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    #if UNITY_EDITOR
    for touch in InputHelper.GetTouches():
      if touch.phase == TouchPhase.Ended  and  base.GetComponent<GUITexture>().HitTest(touch.position):
        ((soundEffectsMenu)ljudHolder.GetComponent(typeof(soundEffectsMenu))).buttonClick()
        difficultyMenu.SetActive(false)
        Menu.SetActive(true)
    #else
    for touch in Input.touches:
      if touch.phase == TouchPhase.Ended  and  base.GetComponent<GUITexture>().HitTest(touch.position):
        ((soundEffectsMenu)ljudHolder.GetComponent(typeof(soundEffectsMenu))).buttonClick()
        difficultyMenu.SetActive(false)
        Menu.SetActive(true)
    #endif

  var Menu: Node3D

  var difficultyMenu: Node3D

  var ljudHolder: Node3D
