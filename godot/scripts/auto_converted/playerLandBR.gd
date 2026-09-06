# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/playerLandBR.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name playerLandBR
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).playerLandBRSound()
      self.SetActive(false)

  var soundHolder: Node3D
