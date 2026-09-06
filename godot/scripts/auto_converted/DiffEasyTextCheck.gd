# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/DiffEasyTextCheck.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name DiffEasyTextCheck
extends Node  # TODO: was MonoBehaviour
  func _ready():
    if PlayerPrefs.GetInt("fogOnExtreme") == 1:
      darkerToggle.isOn = true
      darkerToggle.interactable = false
      extraLockToggle.isOn = true
      extraLockToggle.interactable = false
    else:
      darkerToggle.interactable = true
      extraLockToggle.interactable = true

  func _process(_delta):
    if PlayerPrefs.GetInt("DiffData") == 0:
      diffNormalText.SetActive(true)
      diffEasyText.SetActive(false)
      diffHardText.SetActive(false)
      diffExtremeText.SetActive(false)
      diffPractiseText.SetActive(false)
      darkerToggle.interactable = true
      extraLockToggle.interactable = true
    elif (PlayerPrefs.GetInt("DiffData") == 1:
      diffEasyText.SetActive(true)
      diffHardText.SetActive(false)
      diffNormalText.SetActive(false)
      diffExtremeText.SetActive(false)
      diffPractiseText.SetActive(false)
      darkerToggle.interactable = true
      extraLockToggle.interactable = true
    elif (PlayerPrefs.GetInt("DiffData") == 2:
      diffHardText.SetActive(true)
      diffEasyText.SetActive(false)
      diffNormalText.SetActive(false)
      diffExtremeText.SetActive(false)
      diffPractiseText.SetActive(false)
      darkerToggle.interactable = true
      extraLockToggle.interactable = true
    elif (PlayerPrefs.GetInt("DiffData") == 3:
      diffExtremeText.SetActive(true)
      diffHardText.SetActive(false)
      diffEasyText.SetActive(false)
      diffNormalText.SetActive(false)
      diffPractiseText.SetActive(false)
      darkerToggle.isOn = true
      darkerToggle.interactable = false
      extraLockToggle.isOn = true
      extraLockToggle.interactable = false
    elif (PlayerPrefs.GetInt("DiffData") == 4:
      diffPractiseText.SetActive(true)
      diffExtremeText.SetActive(false)
      diffHardText.SetActive(false)
      diffEasyText.SetActive(false)
      diffNormalText.SetActive(false)
      darkerToggle.interactable = true
      extraLockToggle.interactable = true

  var diffEasyText: Node3D

  var diffHardText: Node3D

  var diffNormalText: Node3D

  var diffExtremeText: Node3D

  var diffPractiseText: Node3D

  var darkerToggle: Variant

  var extraLockToggle: Variant
