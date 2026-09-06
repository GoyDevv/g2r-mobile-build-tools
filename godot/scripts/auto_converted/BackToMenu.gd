# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/BackToMenu.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name BackToMenu
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    var saveSensitivityData := (saveSensitivityData)this.savedValue.GetComponent(typeof(saveSensitivityData))
    PlayerPrefs.SetInt("slideData", saveSensitivityData.sliderValue)
    ((backgroundSound)soundHolder.GetComponent(typeof(backgroundSound))).buttonClick()
    ((FetchAds)gameController.GetComponent(typeof(FetchAds))).toMainMenu()
    PlayerPrefs.SetInt("teddyInPlace", 0)

  var savedValue: Node3D

  var soundHolder: Node3D

  var gameController: Node3D

  var buttonClicked: bool

  var btn1: Variant
