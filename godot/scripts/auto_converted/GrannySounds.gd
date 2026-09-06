# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/GrannySounds.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name GrannySounds
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func startGrannySound():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = Glaugh[Random.Range(0, Glaugh.Length)]
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  func grannySkrattar():
    AudioSource.PlayClipAtPoint(skratt, position)

  public AudioClip[] Glaugh

  var skratt: Variant
