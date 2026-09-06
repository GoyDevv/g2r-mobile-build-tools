# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/OpenCloseLoda1.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name OpenCloseLoda1
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if not DoorOpen  and  base.GetComponent<Animation>().IsPlaying("Loda1Open"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(LodaUt)
      DoorOpen = true
      self.tag = "Untagged"
      StartCoroutine(timerDooropen())
    if DoorOpen  and  base.GetComponent<Animation>().IsPlaying("Loda1Close"):
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(LodaIn)
      DoorOpen = false
      self.tag = "Untagged"
      StartCoroutine(timerDoorclosed())

  func timerDooropen():
    yield return new WaitForSeconds(0.5)
    self.tag = "loda1Open"
    var break: Variant

  func timerDoorclosed():
    yield return new WaitForSeconds(0.5)
    self.tag = "loda1Closed"
    var break: Variant

  var DoorOpen: bool

  var LodaUt: Variant

  var LodaIn: Variant
