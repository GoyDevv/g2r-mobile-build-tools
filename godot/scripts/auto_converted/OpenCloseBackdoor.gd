# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/OpenCloseBackdoor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name OpenCloseBackdoor
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if not DoorOpen  and  base.GetComponent<Animation>().IsPlaying("BackDoorOpen"):
      if base.gameObject.tag == "innerdoorLocked":
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorUnLockedLjud)
      else:
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorOpen)
      DoorOpen = true
      DoorMoving = true
      self.tag = "Untagged"
      Innerdoor.carving = enabled
      StartCoroutine(timerDooropen())
    if DoorOpen  and  base.GetComponent<Animation>().IsPlaying("BackDoorClose"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorClose)
      DoorOpen = false
      DoorMoving = true
      self.tag = "Untagged"
      StartCoroutine(timerDoorclosed())
    if not DoorOpen  and  base.GetComponent<Animation>().IsPlaying("BackDoorLocked")  and  not doorLocked:
      doorLocked = true
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorLockedLjud)
      StartCoroutine(timerDoorlocked())

  func timerDooropen():
    yield return new WaitForSeconds(1.0)
    self.tag = "innerdoorOpen"
    DoorMoving = false
    yield return new WaitForSeconds(3.0)
    self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorClose")
    var break: Variant

  func timerDoorclosed():
    yield return new WaitForSeconds(1.0)
    self.tag = "innerdoorLocked"
    Innerdoor.carving = not enabled
    doorLocked = false
    DoorMoving = false
    var break: Variant

  func timerDoorlocked():
    yield return new WaitForSeconds(1.3)
    doorLocked = false
    var break: Variant

  func OnTriggerEnter(other: Variant):
    if DoorMoving:
      if other.gameObject.tag == "Player":
        Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, true)
    elif (!this.DoorMoving:
      Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, false)

  var DoorOpen: bool

  var DoorMoving: bool

  var Innerdoor: Variant

  var doorOpen: Variant

  var doorClose: Variant

  var doorLockedLjud: Variant

  var doorUnLockedLjud: Variant

  var doorLocked: bool
