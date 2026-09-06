# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/dropDownOptions.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name dropDownOptions
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Time.timeScale = 1.0
    if PlayerPrefs.GetInt("DiffData") == 0:
      dropdownOptions.value = 2
    elif (PlayerPrefs.GetInt("DiffData") == 1:
      dropdownOptions.value = 3
    elif (PlayerPrefs.GetInt("DiffData") == 2:
      dropdownOptions.value = 1
    elif (PlayerPrefs.GetInt("DiffData") == 3:
      dropdownOptions.value = 0
    elif (PlayerPrefs.GetInt("DiffData") == 4:
      dropdownOptions.value = 4

  func diffOptions():
    if dropdownOptions.value == 2:
      normalModeOn = true
      easyModeOn = false
      hardModeOn = false
      extremeModeOn = false
      practiseModeOn = false
      PlayerPrefs.SetInt("DiffData", 0)
      PlayerPrefs.SetInt("fogOnExtreme", 0)
    elif (this.dropdownOptions.value == 3:
      easyModeOn = true
      normalModeOn = false
      hardModeOn = false
      extremeModeOn = false
      practiseModeOn = false
      PlayerPrefs.SetInt("DiffData", 1)
      PlayerPrefs.SetInt("fogOnExtreme", 0)
    elif (this.dropdownOptions.value == 1:
      hardModeOn = true
      normalModeOn = false
      easyModeOn = false
      extremeModeOn = false
      practiseModeOn = false
      PlayerPrefs.SetInt("DiffData", 2)
      PlayerPrefs.SetInt("fogOnExtreme", 0)
    elif (this.dropdownOptions.value == 0:
      extremeModeOn = true
      hardModeOn = false
      normalModeOn = false
      easyModeOn = false
      practiseModeOn = false
      PlayerPrefs.SetInt("DiffData", 3)
      PlayerPrefs.SetInt("fogOnExtreme", 1)
    elif (this.dropdownOptions.value == 4:
      practiseModeOn = true
      hardModeOn = false
      normalModeOn = false
      easyModeOn = false
      extremeModeOn = false
      PlayerPrefs.SetInt("DiffData", 4)
      PlayerPrefs.SetInt("fogOnExtreme", 0)

  var easyModeOn: bool

  var normalModeOn: bool

  var hardModeOn: bool

  var extremeModeOn: bool

  var practiseModeOn: bool

  var dropdownOptions: Variant
