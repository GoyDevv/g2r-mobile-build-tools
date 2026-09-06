# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/LastPlayerSighting.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name LastPlayerSighting
extends Node  # TODO: was MonoBehaviour
  func _init():
    position = Vector3(1000.0, 1000.0, 1000.0)
    resetPosition = Vector3(1000.0, 1000.0, 1000.0)
    lightHighIntensity = 0.25
    fadeSpeed = 7.0
    musicFadeSpeed = 1.0

  func _init():

  func _process(_delta):
    SwitchAlarms()
    MusicFading()

  func SwitchAlarms():
    if position != resetPosition:
      var num := this.lightLowIntensity
    else:
      var num := this.lightHighIntensity

  func MusicFading():
    if position != resetPosition:

  var position: Vector3

  var resetPosition: Vector3

  var lightHighIntensity: float

  var lightLowIntensity: float

  var fadeSpeed: float

  var musicFadeSpeed: float

  var mainLight: Variant

  var panicAudio: Variant

  private AudioSource[] sirens
