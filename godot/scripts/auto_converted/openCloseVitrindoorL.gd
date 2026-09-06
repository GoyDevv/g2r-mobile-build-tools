# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/openCloseVitrindoorL.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name openCloseVitrindoorL
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if not DoorOpen  and  base.GetComponent<Animation>().IsPlaying("VitrindoorHallLOpen"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorLjud)
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      DoorOpen = true
      self.tag = "Untagged"
      Innerdoor.carving = enabled
      StartCoroutine(timerDooropen())
    if DoorOpen  and  base.GetComponent<Animation>().IsPlaying("VitrindoorHallLClose"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorLjud)
      get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      DoorOpen = false
      self.tag = "Untagged"
      StartCoroutine(timerDoorclosed())

  func timerDooropen():
    yield return new WaitForSeconds(1.0)
    self.tag = "vitrindoorLopen"
    get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
    var break: Variant

  func timerDoorclosed():
    yield return new WaitForSeconds(1.0)
    self.tag = "vitrindoorLclosed"
    Innerdoor.carving = not enabled
    get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
    var break: Variant

  var DoorOpen: bool

  var Innerdoor: Variant

  var doorLjud: Variant
