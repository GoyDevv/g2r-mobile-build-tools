# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/stopMusik.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name stopMusik
extends Node  # TODO: was MonoBehaviour
  public stopMusik() {
  musicOnOff = true

func _ready():
  if PlayerPrefs.GetInt("musikOnOff") == 0:
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
  else:
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()

func _process(_delta):

func turnOn():
  musicOnOff = true
  PlayerPrefs.SetInt("musikOnOff", 0)
  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

func turnOff():
  musicOnOff = false
  PlayerPrefs.SetInt("musikOnOff", 1)
  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()

var musicOnOff: bool
