# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/triggerCloseGarderobdoor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name triggerCloseGarderobdoor
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      playerInLocker = true
      doorButton.SetActive(true)
      doorV.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VgarderobDoorClose")
      doorH.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HgarderobDoorClose")
      ((IfgarderobDoorOpens)doorV.GetComponent(typeof(IfgarderobDoorOpens))).doorsClosed = true
      ((IfHgarderobDoorOpens)doorH.GetComponent(typeof(IfHgarderobDoorOpens))).doorsClosed = true
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 1.0
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 1.0
      ((AIfollow)nos.GetComponent(typeof(AIfollow))).playerHiding = true
      doorV.self.tag = "garderobDoorV"
      doorH.self.tag = "garderobDoorH"
      AudioSource.PlayClipAtPoint(gardeDoorsClose, position)

  var doorV: Node3D

  var doorH: Node3D

  var playerInLocker: bool

  var doorButton: Node3D

  var nos: Node3D

  var player: Node3D

  var gardeDoorsClose: Variant
