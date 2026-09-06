# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/maniacScream.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name maniacScream
extends Node  # TODO: was MonoBehaviour
  func _ready():
    var component := base.GetComponent<AudioSource>()

  func _process(_delta):

  func maniacSeePlayer():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = seePlayerSound
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  func swordHit():
    AudioSource.PlayClipAtPoint(hitSword, position)

  func ManiacScream():
    AudioSource.PlayClipAtPoint(scream, position)

  var seePlayerSound: Variant

  var hitSword: Variant

  var scream: Variant

  var screamNow: bool
