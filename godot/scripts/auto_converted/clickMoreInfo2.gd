# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/clickMoreInfo2.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name clickMoreInfo2
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    Application.OpenURL("https://dvloperapps.weebly.com")

  var btn1: Variant
