# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/reverseCar.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name reverseCar
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).carMoving = true
    if not reverse1Played:
      carAnimation.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("CarReverse")
      reverseButton.SetActive(false)
      reverse1Played = true
      outOffCarButton.SetActive(false)
      carReverseSound1.SetActive(true)
      engineOnSound.SetActive(false)
      frontCrashSound.SetActive(false)
      frontCrashSound2.SetActive(false)
      CarHitTriggers.SetActive(true)
      optionButton.SetActive(false)
    else:
      carAnimation.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("CarReverse2")
      reverseButton.SetActive(false)
      outOffCarButton.SetActive(false)
      carReverseSound1.SetActive(true)
      engineOnSound.SetActive(false)
      frontCrashSound.SetActive(false)
      frontCrashSound2.SetActive(false)
      CarHitTriggers.SetActive(true)
      optionButton.SetActive(false)

  var carAnimation: Node3D

  var reverseButton: Node3D

  var outOffCarButton: Node3D

  var reverse1Played: bool

  var carReverseSound1: Node3D

  var engineOnSound: Node3D

  var frontCrashSound: Node3D

  var frontCrashSound2: Node3D

  var CarHitTriggers: Node3D

  var optionButton: Node3D

  var gameController: Node3D

  var btn1: Variant
