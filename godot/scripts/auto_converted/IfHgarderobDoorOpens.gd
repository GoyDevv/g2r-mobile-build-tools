# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/IfHgarderobDoorOpens.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name IfHgarderobDoorOpens
extends Node  # TODO: was MonoBehaviour
  func _init():
    doorsClosed = true

  func _ready():

  func _process(_delta):
    if doorsClosed  and  base.GetComponent<Animation>().IsPlaying("HgarderobDoorOpen"):
      gardeDoorV.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VgarderobDoorOpen")
      doorsClosed = false
      doorV.self.tag = "Untagged"
      doorH.self.tag = "Untagged"
      ((AIfollow)nos.GetComponent(typeof(AIfollow))).playerHiding = false
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 6.0
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 8.0
      doorButton.SetActive(false)

  var gardeDoorV: Node3D

  var doorButton: Node3D

  var nos: Node3D

  var doorV: Node3D

  var doorH: Node3D

  var doorsClosed: bool

  var player: Node3D
