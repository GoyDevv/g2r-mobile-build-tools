# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ClickContinueButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ClickContinueButton
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    if not buttonPressed:
      SceneManager.LoadScene("Scene")
      LoadingScreen.SetActive(true)
      ((ButtonClicks)ljudHolder.GetComponent(typeof(ButtonClicks))).clickButton()
      button.SetActive(false)

  var LoadingScreen: Node3D

  var ljudHolder: Node3D

  var button: Node3D

  var buttonPressed: bool

  var btn1: Variant
