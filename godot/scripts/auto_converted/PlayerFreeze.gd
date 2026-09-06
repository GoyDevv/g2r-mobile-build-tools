# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/PlayerFreeze.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name PlayerFreeze
extends Node  # TODO: was MonoBehaviour
  func _ready():
    FreezeScreen.canvasRenderer.SetAlpha(0.0)
    timerCount = 10.0

  func _process(_delta):
    if playerStuckTimer:
      timerCount -= Time.deltaTime
      if timerCount <= 0.0:
        playerStuckTimer = false
        freezeOFF = true
        timerCount = 10.0
        playerFreezeFree()
    if freezeON:
      FreezeScreen.CrossFadeAlpha(1.0, 4.0, false)
      if FreezeScreen.canvasRenderer.GetAlpha() > 0.9:
        freezeON = false
    if freezeOFF:
      FreezeScreen.CrossFadeAlpha(0.0, 2.0, false)
      if FreezeScreen.canvasRenderer.GetAlpha() < 0.1:
        freezeOFF = false
        FreezeScreen.canvasRenderer.SetAlpha(0.0)

  func playerFreezeStuck():
    playerStuckTimer = true
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 0.0
    ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
    if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByArrow  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByGun  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByCar  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuKilled  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).freeze  and  GrannyEye.activeSelf:
      ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
    joystick.SetActive(false)
    crawlButtonParent.SetActive(false)
    allBedButtons.SetActive(false)
    doorRay.SetActive(false)
    pickUpRay.SetActive(false)
    freezeON = true

  func playerFreezeFree():
    if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerGetCaught:
      joystick.SetActive(true)
      crawlButtonParent.SetActive(true)
      allBedButtons.SetActive(true)
      ((deactivateIceBreakSound)iceBreakSoundHolder.GetComponent(typeof(deactivateIceBreakSound))).playIceBreak()
      if player.GetComponent<CharacterController>().height == 2.76:
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 5.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 4.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 5.0
      elif (this.player.GetComponent<CharacterController>().height == 1.8f:
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 1.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 1.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 1.0
    doorRay.SetActive(true)
    pickUpRay.SetActive(true)

  var FreezeScreen: Variant

  var FreezeScreenTexture: Node3D

  var freezeON: bool

  var freezeOFF: bool

  var Granny: Node3D

  var footstepScriptHolder: Node3D

  var player: Node3D

  var playerHead: Node3D

  var GrannyEye: Node3D

  var crawlButtonParent: Node3D

  var joystick: Node3D

  var allBedButtons: Node3D

  var doorRay: Node3D

  var pickUpRay: Node3D

  var iceBreakSoundHolder: Node3D

  var playerStuckTimer: bool

  var timerCount: float
