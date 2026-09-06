# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/spiderSoundEffects.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name spiderSoundEffects
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func spiderSeePlayer():
    AudioSource.PlayClipAtPoint(spiderSee, position)

  func spiderAttackPlayer():
    AudioSource.PlayClipAtPoint(SpiderAttack, position)

  func spiderDie():
    AudioSource.PlayClipAtPoint(SpiderDie, position)

  var spiderSee: Variant

  var SpiderAttack: Variant

  var SpiderDie: Variant
