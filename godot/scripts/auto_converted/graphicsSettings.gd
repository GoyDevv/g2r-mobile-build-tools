# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/graphicsSettings.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name graphicsSettings
extends Node  # TODO: was MonoBehaviour
  func _ready():
    if PlayerPrefs.GetInt("graphSettings") == 0:
      dropdownOptions.value = 1
      varningTextMedium.SetActive(true)
      varningTextHigh.SetActive(false)
    elif (PlayerPrefs.GetInt("graphSettings") == 1:
      dropdownOptions.value = 0
      varningTextMedium.SetActive(false)
      varningTextHigh.SetActive(false)
    elif (PlayerPrefs.GetInt("graphSettings") == 2:
      dropdownOptions.value = 2
      varningTextHigh.SetActive(true)
      varningTextMedium.SetActive(false)

  func SetQuality(qualityindex: int):
    QualitySettings.SetQualityLevel(qualityindex)
    if qualityindex == 1:
      PlayerPrefs.SetInt("graphSettings", 0)
      varningTextMedium.SetActive(true)
      varningTextHigh.SetActive(false)
    elif (qualityindex == 0:
      PlayerPrefs.SetInt("graphSettings", 1)
      varningTextMedium.SetActive(false)
      varningTextHigh.SetActive(false)
    elif (qualityindex == 2:
      PlayerPrefs.SetInt("graphSettings", 2)
      varningTextHigh.SetActive(true)
      varningTextMedium.SetActive(false)

  func _process(_delta):

  var dropdownOptions: Variant

  var varningTextHigh: Node3D

  var varningTextMedium: Node3D
