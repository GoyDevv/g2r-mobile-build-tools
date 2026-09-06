# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/OpenCloseGarde1.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name OpenCloseGarde1
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if not DoorOpen  and  base.GetComponent<Animation>().IsPlaying("Garde1Open"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorLjud)
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      DoorOpen = true
      self.tag = "Untagged"
      Innerdoor.carving = enabled
      StartCoroutine(timerDooropen())
    if DoorOpen  and  base.GetComponent<Animation>().IsPlaying("Garde1Close"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorLjud2)
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      DoorOpen = false
      self.tag = "Untagged"
      StartCoroutine(timerDoorclosed())

  func timerDooropen():
    yield return new WaitForSeconds(0.5)
    self.tag = "garde1Open"
    get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
    var break: Variant

  func timerDoorclosed():
    yield return new WaitForSeconds(0.5)
    self.tag = "garde1Closed"
    Innerdoor.carving = not enabled
    get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
    var break: Variant

  var DoorOpen: bool

  var Innerdoor: Variant

  var doorLjud: Variant

  var doorLjud2: Variant
