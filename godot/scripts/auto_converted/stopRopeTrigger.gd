# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/stopRopeTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name stopRopeTrigger
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "stoprope":
      ((playerVevar)vevaHolder.GetComponent(typeof(playerVevar))).noMoreVev = true
      ((playerVevar)vevaHolder.GetComponent(typeof(playerVevar))).playerHoldButton = false
      vev.self.tag = "Untagged"
      vevButton.SetActive(false)
      ((vevarBrunnLjud)brunnsLjud.GetComponent(typeof(vevarBrunnLjud))).PlayerVevar = false

  var vevaHolder: Node3D

  var vev: Node3D

  var vevButton: Node3D

  var brunnsLjud: Node3D
