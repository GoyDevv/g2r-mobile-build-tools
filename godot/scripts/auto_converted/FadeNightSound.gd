# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FadeNightSound.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FadeNightSound
extends Node  # TODO: was MonoBehaviour
  func _ready():
    gameStart = true

  func _process(_delta):
    if soundHigh  and  base.GetComponent<AudioSource>().volume < 0.4:
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume + 0.4 * Time.deltaTime
      if base.GetComponent<AudioSource>().volume > 0.4:
        soundHigh = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.4
    if soundLow  and  base.GetComponent<AudioSource>().volume <= 0.4:
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume - 0.4 * Time.deltaTime
      if base.GetComponent<AudioSource>().volume < 0.15:
        soundLow = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.15
    if soundLow:
      soundHigh = false
    if soundHigh:
      soundLow = false
    if gameStart:
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume + 0.05 * Time.deltaTime
      if base.GetComponent<AudioSource>().volume >= 0.4:
        gameStart = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.4

  func fadeUp():
    soundHigh = true

  func fadeDown():
    soundLow = true

  func stopAudio():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()

  var nightSound: Variant

  var volume: float

  var fading: bool

  var soundLow: bool

  var soundHigh: bool

  var gameStart: bool
