# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/inactivateButtons.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name inactivateButtons
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerStay(other: Variant):
    if other.gameObject.tag == "Player":
      forwardButton.SetActive(false)
      backButton.SetActive(false)
      startButton.SetActive(false)

  var forwardButton: Node3D

  var backButton: Node3D

  var startButton: Node3D
