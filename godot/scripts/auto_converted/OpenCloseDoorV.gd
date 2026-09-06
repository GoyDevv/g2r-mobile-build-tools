# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/OpenCloseDoorV.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name OpenCloseDoorV
extends Node  # TODO: was MonoBehaviour
  func _ready():
    doorHealth = 100.0

  func _process(_delta):
    if doorHealth <= 0.0  and  not doorDead:
      doorDead = true
      get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerDoorVSmash")
      self.tag = "Untagged"
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      doorStop.SetActive(false)
      AudioSource.PlayClipAtPoint(doorDeadLjud, position)
      StartCoroutine(removeDoor())
    if not doorOpen  and  base.GetComponent<Animation>().IsPlaying("InnerDoorHOpen"):
      doorOpen = true
      self.tag = null
      StartCoroutine(timerDooropen())
    if doorOpen  and  base.GetComponent<Animation>().IsPlaying("InnerDoorHClose"):
      doorOpen = false
      self.tag = null
      StartCoroutine(timerDoorclosed())
    if not doorOpen  and  base.GetComponent<Animation>().IsPlaying("InnerDoorVOpen"):
      doorOpen = true
      self.tag = null
      StartCoroutine(timerDoorVopen())
    if doorOpen  and  base.GetComponent<Animation>().IsPlaying("InnerDoorVClose"):
      doorOpen = false
      self.tag = null
      StartCoroutine(timerDoorVclosed())

  func timerDooropen():
    yield return new WaitForSeconds(1.0)
    self.tag = "innerdoorHOpen"
    var break: Variant

  func timerDoorclosed():
    yield return new WaitForSeconds(1.0)
    self.tag = "innerdoorHClosed"
    var break: Variant

  func timerDoorVopen():
    yield return new WaitForSeconds(1.0)
    self.tag = "innerdoorVOpen"
    var break: Variant

  func timerDoorVclosed():
    yield return new WaitForSeconds(1.0)
    self.tag = "innerdoorVClosed"
    var break: Variant

  func removeDoor():
    yield return new WaitForSeconds(10.0)
    Object.queue_free  # TODO: Destroy(self)
    var break: Variant

  var doorOpen: bool

  var doorHealth: float

  var doorDead: bool

  var doorStop: Node3D

  var doorDeadLjud: Variant
