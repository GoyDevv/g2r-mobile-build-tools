# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ClickOnOffMusic.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ClickOnOffMusic
extends Node  # TODO: was MonoBehaviour
  func _ready():
    m_Toggle = get_node(\"TODO_Toggle\")  # TODO: GetComponent
    m_Toggle.onValueChanged.AddListener(delegate(bool A_1) {
    ToggleValueChanged(m_Toggle)
  if PlayerPrefs.GetInt("musikOnOff") == 0:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = true
  elif (PlayerPrefs.GetInt("musikOnOff") == 1:
    m_Toggle.get_node(\"TODO_Toggle\")  # TODO: GetComponent.isOn = false

func ToggleValueChanged(change: Variant):
  if m_Toggle.isOn:
    PlayerPrefs.SetInt("musikOnOff", 0)
    musicHolder.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
  else:
    PlayerPrefs.SetInt("musikOnOff", 1)
    musicHolder.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()

var m_Toggle: Variant

var musicHolder: Node3D
