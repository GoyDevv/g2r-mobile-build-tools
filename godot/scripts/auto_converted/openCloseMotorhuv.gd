# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/openCloseMotorhuv.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name openCloseMotorhuv
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if not DoorOpen  and  base.GetComponent<Animation>().IsPlaying("motorhuvOpen"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorOpen)
      DoorOpen = true
      DoorMoving = true
      self.tag = "Untagged"
      StartCoroutine(timerDooropen())
    if DoorOpen  and  base.GetComponent<Animation>().IsPlaying("motorhuvClose"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorClose)
      DoorOpen = false
      DoorMoving = true
      self.tag = "Untagged"
      StartCoroutine(timerDoorclosed())

  func timerDooropen():
    yield return new WaitForSeconds(1.0)
    self.tag = "motorhuvOpen"
    DoorMoving = false
    var break: Variant

  func timerDoorclosed():
    yield return new WaitForSeconds(1.0)
    self.tag = "motorhuvClosed"
    doorLocked = false
    DoorMoving = false
    var break: Variant

  func OnTriggerEnter(other: Variant):
    if DoorMoving:
      if other.gameObject.tag == "Player":
        Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, true)
    elif (!this.DoorMoving:
      Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, false)

  var DoorOpen: bool

  var DoorMoving: bool

  var doorOpen: Variant

  var doorClose: Variant

  var doorLockedLjud: Variant

  var doorUnLockedLjud: Variant

  var doorLocked: bool
