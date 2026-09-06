# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/playerCrawl.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name playerCrawl
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    if not PlayerHukarSig:
      player.get_node(\"TODO_CharacterController\")  # TODO: GetComponent.height = 1.8
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 1.0
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 1.0
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 1.0
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).playerCrouch = true
      playerHead.self  # TODO: was transform.self  # TODO: was transform.localPosition = Vector3(0.0, 0.016, 0.0)
      PlayerHukarSig = true
      ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).hukarSig()
      button.sprite = crouchTexture
    else:
      player.get_node(\"TODO_CharacterController\")  # TODO: GetComponent.height = 2.76
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 5.0
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 4.0
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 5.0
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).playerCrouch = false
      playerHead.self  # TODO: was transform.self  # TODO: was transform.localPosition = Vector3(0.0, 0.786, 0.0)
      PlayerHukarSig = false
      ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).standUp()
      button.sprite = standTexture
    if PlayerHukarSig:
      button.sprite = crouchTexture
    else:
      button.sprite = standTexture

  func standUp():
    player.get_node(\"TODO_CharacterController\")  # TODO: GetComponent.height = 2.76
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 5.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 4.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 5.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).playerCrouch = false
    playerHead.self  # TODO: was transform.self  # TODO: was transform.localPosition = Vector3(0.0, 0.786, 0.0)
    PlayerHukarSig = false
    ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).standUp()
    button.sprite = standTexture

  var player: Node3D

  var playerHead: Node3D

  var grannyParent: Node3D

  var granny: Node3D

  var soundHolder: Node3D

  var PlayerHukarSig: bool

  var standTexture: Variant

  var crouchTexture: Variant

  var button: Variant

  var btn1: Variant
