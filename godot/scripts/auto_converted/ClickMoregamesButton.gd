# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ClickMoregamesButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ClickMoregamesButton
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    Application.OpenURL("http://play.google.com/store/apps/developer?id=DVloper")
    ((ButtonClicks)ljudHolder.GetComponent(typeof(ButtonClicks))).clickButton()

  var ljudHolder: Node3D

  var buttonPressed: bool

  var buttonsounds: bool

  var btn1: Variant
