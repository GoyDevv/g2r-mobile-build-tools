# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/theEndCarEscape.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name theEndCarEscape
extends Node  # TODO: was MonoBehaviour
  func _ready():
    ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannyDead = true
    yield return new WaitForSeconds(time)
    theEndText.SetActive(true)
    yield return new WaitForSeconds(time2)
    ((FetchAds)GameController.GetComponent(typeof(FetchAds))).toMainMenu()
    PlayerPrefs.SetInt("teddyInPlace", 0)
    var break: Variant

  var GameController: Node3D

  var theEndText: Node3D

  var theEndTexture: Variant

  var fadeTextSpeed: float

  var time: float

  var time2: float

  var GrannyHuntMusicHolder: Node3D
