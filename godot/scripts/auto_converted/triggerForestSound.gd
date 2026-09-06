# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/triggerForestSound.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name triggerForestSound
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      soundHolder.SetActive(true)
      StartCoroutine(soundTimer())

  func soundTimer():
    yield return new WaitForSeconds(30.0)
    soundHolder.SetActive(false)
    var break: Variant

  var soundHolder: Node3D
