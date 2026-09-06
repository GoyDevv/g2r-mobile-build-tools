# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/LocksOnOff.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name LocksOnOff
extends Node  # TODO: was MonoBehaviour
  func _ready():
    m_Toggle = get_node(\"TODO_Toggle\")  # TODO: GetComponent
    m_Toggle.onValueChanged.AddListener(delegate(bool A_1) {
    ToggleValueChanged(m_Toggle)
  if PlayerPrefs.GetInt("twoLocksOnOff") == 0:
    if PlayerPrefs.GetInt("fogOnExtreme") == 0:
      m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = false
  elif (PlayerPrefs.GetInt("twoLocksOnOff") == 1:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = true

func _process(_delta):
  if PlayerPrefs.GetInt("twoLocksOnOff") == 0:
    if PlayerPrefs.GetInt("fogOnExtreme") == 0:
      m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = false
  elif (PlayerPrefs.GetInt("twoLocksOnOff") == 1:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = true

func ToggleValueChanged(change: Variant):
  if m_Toggle.isOn:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = true
    if PlayerPrefs.GetInt("fogOnExtreme") == 0:
      PlayerPrefs.SetInt("twoLocksOnOff", 1)
  else:
    twoLocksOnOff = true
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = false
    PlayerPrefs.SetInt("twoLocksOnOff", 0)

var twoLocksOnOff: bool

var m_Toggle: Variant
