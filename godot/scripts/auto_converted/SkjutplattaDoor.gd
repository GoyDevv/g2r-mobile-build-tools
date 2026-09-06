# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/SkjutplattaDoor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name SkjutplattaDoor
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if doorUnlocked:
      doorUnlocked = false
      steelDoor.self.tag = "innerdoorClosed"
      lockDel1.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("skjutPlatta")
      lockDel2.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("skjutPlattaDel1")
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(unlockLjud)
      StartCoroutine(ljudlength())

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "arrow"  and  not doorUnlockedArrow:
      doorUnlockedArrow = true
      steelDoor.self.tag = "innerdoorClosed"
      lockDel1.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("skjutPlatta")
      lockDel2.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("skjutPlattaDel1")
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(unlockLjud)
      StartCoroutine(ljudlength())

  func ljudlength():
    yield return new WaitForSeconds(1.0)
    Object.queue_free  # TODO: Destroy(self)
    var break: Variant

  var doorUnlocked: bool

  var doorUnlockedArrow: bool

  var steelDoor: Node3D

  var lockDel1: Node3D

  var lockDel2: Node3D

  var unlockLjud: Variant
