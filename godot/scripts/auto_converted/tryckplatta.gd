# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/tryckplatta.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name tryckplatta
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    if ironKlumpOnPlace:
      ((doorSlide)slideDoor.GetComponent(typeof(doorSlide))).plattaTryck = true

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not ironKlumpOnPlace:
      ((doorSlide)slideDoor.GetComponent(typeof(doorSlide))).plattaTryck = true
      ((haveObjects)standOnPlatta.GetComponent(typeof(haveObjects))).playerStandOnPlatta = true
      AudioSource.PlayClipAtPoint(tryckplattaLjud, position)
      ((doorSlide)soundHolder.GetComponent(typeof(doorSlide))).StartSound()

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player"  and  not ironKlumpOnPlace:
      ((doorSlide)slideDoor.GetComponent(typeof(doorSlide))).plattaTryck = false
      ((haveObjects)standOnPlatta.GetComponent(typeof(haveObjects))).playerStandOnPlatta = false
      ((doorSlide)soundHolder.GetComponent(typeof(doorSlide))).StartSound()

  var slideDoor: Node3D

  var ironKlumpOnPlace: bool

  var bildVit: Variant

  var bildGreen: Variant

  var standOnPlatta: Node3D

  var tryckplattaLjud: Variant

  var soundHolder: Node3D
