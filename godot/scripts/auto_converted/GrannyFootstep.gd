# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/GrannyFootstep.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name GrannyFootstep
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

  func step():
    if not walkGrus:
      var num := UnityEngine.Random.Range(0, this.footstepGranny.Length)
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(footstepGranny[num])
    elif (this.walkGrus:
      var num2 := UnityEngine.Random.Range(0, this.footstepGrusGranny.Length)
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(footstepGrusGranny[num2])

  public AudioClip[] footstepGranny

  public AudioClip[] footstepGrusGranny

  var walkGrus: bool
