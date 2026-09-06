# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/OpenCloseOldDoor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name OpenCloseOldDoor
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if not DoorOpen  and  base.GetComponent<Animation>().IsPlaying("InnerdoorOpen"):
      DoorOpen = true
      self.tag = "Untagged"
      ((enableDisableCarve)doorStop.GetComponent(typeof(enableDisableCarve))).doorOpenCarve = true
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      StartCoroutine(timerDooropen())
    if DoorOpen  and  base.GetComponent<Animation>().IsPlaying("InnerdoorClose"):
      DoorOpen = false
      self.tag = "Untagged"
      ((enableDisableCarve)doorStop.GetComponent(typeof(enableDisableCarve))).doorOpenCarve = false
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      StartCoroutine(timerDoorclosed())
    if DoorBlocked:
      self.tag = "doorLockedNoKey"

  func timerDooropen():
    yield return new WaitForSeconds(2.0)
    self.tag = "doorOpen"
    get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
    var break: Variant

  func timerDoorclosed():
    if not DoorBlocked:
      yield return new WaitForSeconds(2.0)
      self.tag = "doorClosed"
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
    else:
      yield return new WaitForSeconds(1.0)
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
    var break: Variant

  var DoorOpen: bool

  var doorStop: Node3D

  var DoorBlocked: bool
