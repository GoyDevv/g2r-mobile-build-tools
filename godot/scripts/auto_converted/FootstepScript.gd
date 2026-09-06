# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FootstepScript.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FootstepScript
extends Node  # TODO: was MonoBehaviour
  func _init():
    step = true
    startWalking = true
    audioStepLengthWalk = 0.45

  func _ready():

  func _process(_delta):
    if startWalking  and  not step:
      step = true
      StartCoroutine(Playerwalk())

  func walk():
    startWalking = true

  func Playerwalk():
    if step:
      step = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = footstepConcrete[Random.Range(0, footstepConcrete.Length)]
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 1.0
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
      yield return new WaitForSeconds(audioStepLengthWalk)
      step = true
    var break: Variant

  func stopwalk():
    startWalking = false
    step = false
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()

  public AudioClip[] footstepConcrete

  var step: bool

  var startWalking: bool

  var audioStepLengthWalk: float
