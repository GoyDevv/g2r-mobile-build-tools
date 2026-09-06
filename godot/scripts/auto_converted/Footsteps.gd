# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/Footsteps.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name Footsteps
extends Node  # TODO: was MonoBehaviour
  func _init():
    isWalking = true

  func _ready():

  func _process(_delta):

  func step():
    if isWalking:
      if not walkGrus  and  not walkWater:
        if PlayerPrefs.GetInt("NightMareOnOff") == 1:
          var num := UnityEngine.Random.Range(0, this.footstepConcreteSticky.Length)
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(footstepConcreteSticky[num])
        else:
          var num2 := UnityEngine.Random.Range(0, this.footstepConcrete.Length)
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(footstepConcrete[num2])
      elif (this.walkGrus:
        var num3 := UnityEngine.Random.Range(0, this.footstepGrus.Length)
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(footstepGrus[num3])
      elif (this.walkWater:
        var num4 := UnityEngine.Random.Range(0, this.footstepWater.Length)
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(footstepWater[num4])

  func walk():
    if not headBob.GetComponent<Animation>().IsPlaying("playerHurt"):
      if isWalking:
        if day2:
          headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HeadBobAnimation2")
        elif (this.day3:
          headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HeadBobAnimation3")
        else:
          headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HeadBobAnimation")
      elif (this.day2:
        headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Stop("HeadBobAnimation2")
      elif (this.day3:
        headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Stop("HeadBobAnimation3")
      else:
        headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Stop("HeadBobAnimation")

  func stopwalk():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
    if day2:
      headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Stop("HeadBobAnimation2")
    elif (this.day3:
      headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Stop("HeadBobAnimation3")
    else:
      headBob.get_node(\"TODO_Animation\")  # TODO: GetComponent.Stop("HeadBobAnimation")

  public AudioClip[] footstepConcrete

  public AudioClip[] footstepConcreteSticky

  public AudioClip[] footstepGrus

  public AudioClip[] footstepWater

  var isWalking: bool

  var walkGrus: bool

  var walkWater: bool

  var headBob: Node3D

  var day2: bool

  var day3: bool
