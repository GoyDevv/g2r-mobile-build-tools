# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/nightmareOnOff.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name nightmareOnOff
extends Node  # TODO: was MonoBehaviour
  func _ready():
    m_Toggle = get_node(\"TODO_Toggle\")  # TODO: GetComponent
    m_Toggle.onValueChanged.AddListener(delegate(bool A_1) {
    ToggleValueChanged(m_Toggle)
  if PlayerPrefs.GetInt("NightMareOnOff") == 0:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = false
    extraScaryText.SetActive(false)
  elif (PlayerPrefs.GetInt("NightMareOnOff") == 1:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = true
    extraScaryText.SetActive(true)

func _process(_delta):
  if PlayerPrefs.GetInt("NightMareOnOff") == 0:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = false
    extraScaryText.SetActive(false)
  else:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = true
    extraScaryText.SetActive(true)

func ToggleValueChanged(change: Variant):
  if m_Toggle.isOn:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = true
    PlayerPrefs.SetInt("NightMareOnOff", 1)
    extraScaryText.SetActive(true)
  else:
    NightmareOnOff = true
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = false
    PlayerPrefs.SetInt("NightMareOnOff", 0)
    extraScaryText.SetActive(false)

var NightmareOnOff: bool

var extraScaryText: Node3D

var m_Toggle: Variant
