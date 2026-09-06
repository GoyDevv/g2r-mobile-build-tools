# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/endDay.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name endDay
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

  func EndDay():
    if not enDayStart:
      ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeDown = true
      enDayStart = true
      yield return new WaitForSeconds(2.0)
      playerStop = GameObject.Find("Main Camera")
      playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
      var script := (CameraFollowExample)this.playerStop.GetComponent(typeof(CameraFollowExample))
      ((fadeUpDownTeddyMusic)teddyMusicHolder.GetComponent(typeof(fadeUpDownTeddyMusic))).playerCaught = true
      ((fadeUpDownGrannyHunt)grannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).playerCaught = true
      script.rotationx = 0.0
      ((PlayerFreeze)gameController.GetComponent(typeof(PlayerFreeze))).freezeON = false
      ((PlayerFreeze)gameController.GetComponent(typeof(PlayerFreeze))).freezeOFF = true
      blackScreenTexture.CrossFadeAlpha(1.0, 0.8, false)
      yield return new WaitForSeconds(2.0)
      playerCam.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("PlayerDie")
      playerCam.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerDie"].speed = -50.0
      yield return new WaitForSeconds(3.0)
      playerInBedCam.SetActive(true)
      playerStopscript.enabled = true
      playerCam.get_node(\"TODO_Camera\")  # TODO: GetComponent.fieldOfView = 60.0
      swipe.SetActive(true)
      playerCam.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 0.0, 0.0)
      ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 5.0
      ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 4.0
      ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 5.0
      playerHead.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 0.0, 0.0)
      ((openDoors)DoorHolder.GetComponent(typeof(openDoors))).playerTaken = false
      ((PickUp)PickUpHolder.GetComponent(typeof(PickUp))).playerTaken = false
      ((PickUp)PickUpHolder.GetComponent(typeof(PickUp))).dropObject = false
      ((playerCaught)Player.GetComponent(typeof(playerCaught))).soundPlaying = false
      Player.SetActive(false)
      Player.position = PlayerStartPos.position
      Player.quaternion  # TODO: Unity->Godot rotation = PlayerStartPos.rotation
      Granny.SetActive(false)
      Granny.position = GrannyStartPos.position
      Granny.SetActive(true)
      var a := 0.0
      var color := this.joystickTexture.color
      color.a = a
      joystickTexture.color = color
      var a2 := 0.0
      var color2 := this.joystickRingTexture.color
      color2.a = a2
      joystickRingTexture.color = color2
      joystick.SetActive(false)
      crouchButton.SetActive(false)
      optionButton.SetActive(false)
      brunnsvevButton.SetActive(false)
      bedButton1.SetActive(false)
      bedButton2.SetActive(false)
      bedButton3.SetActive(false)
      dropButtonHolder.SetActive(true)
      shootButtonHolder.SetActive(true)
      bastuSteamHolder.SetActive(false)
      spraySoundHolder.SetActive(false)
      sprayButton.SetActive(false)
      remoteAndSprayButtonParent.SetActive(true)
      remoteButton.SetActive(false)
      ((coffinButton)coffinButton1.GetComponent(typeof(coffinButton))).PlayerHiding = false
      coffinButton1.SetActive(false)
      ((coffinButtonBackyard)coffinButton2.GetComponent(typeof(coffinButtonBackyard))).PlayerHiding = false
      coffinButton2.SetActive(false)
      ((insideCarButton)carButton.GetComponent(typeof(insideCarButton))).PlayerHiding = false
      carButton.SetActive(false)
      trapButton.SetActive(true)
      trapBar.SetActive(true)
      trapButtonUI.enabled = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerGetCaught = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).attackingPlayer = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).huntPlayer = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerFallDeath = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).dontHitPlayer = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerInHole = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByPepper = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByPepperStart = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyPepperReact = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannyGonnaSmack = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyStandBesideCar = false
      GrannyEyeLock.SetActive(false)
      GrannyBlindSensor.SetActive(false)
      if Spider.activeSelf:
        ((spiderControll)Spider.GetComponent(typeof(spiderControll))).grannyCaughtPlayerReset()
      if ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerInPrison:
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerInPrison = false
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).prisondoorClosed = false
        cameraSee.SetActive(false)
        prisonDoorTrigger.SetActive(false)
        prisonGaller.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
        prisonGallerColliders.SetActive(false)
        if GameObject.Find("prisonDoor") != null:
          prisonDoor.tag = "Untagged"
      mittPrick.SetActive(false)
      playerBedAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("PlayerInBed")
      playerBedAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = -50.0
      StartCoroutine(((furnitureControlls)furnitureHolder.GetComponent(typeof(furnitureControlls))).cleanUp())
      StartCoroutine(((startNewDay)daysCountHolder.GetComponent(typeof(startNewDay))).newDay())
      ((resetDay)daysCountHolder.GetComponent(typeof(resetDay))).resetDays()
      ((backgroundSound)Sound1.GetComponent(typeof(backgroundSound))).fadeDown = true
      ((backgroundSound)Sound3.GetComponent(typeof(backgroundSound))).fadeDown = true
      ((backgroundSound)Sound2.GetComponent(typeof(backgroundSound))).fadeUp = true
      beartrapqueue_free  # TODO: Destroy()
      enDayStart = false
    var break: Variant

  func beartrapDestroy():
    beartraps = GameObject.FindGameObjectsWithTag("BearTrapActivated")
    for i in range(int(this.beartraps.Length)):
      Object.queue_free  # TODO: Destroy(beartraps[i])

  var gameController: Node3D

  var blackScreenTexture: Variant

  var fadeBlackSpeed: float

  var fadeBlackSpeed2: float

  var daysCountHolder: Node3D

  var playerBedAnim: Node3D

  var playerInBedCam: Node3D

  var Granny: Node3D

  var Player: Node3D

  var PlayerStartPos: Node3D

  var GrannyStartPos: Node3D

  var playerCam: Node3D

  var playerHead: Node3D

  var joystick: Node3D

  var joystickTexture: Variant

  var joystickRingTexture: Variant

  var crouchButton: Node3D

  var optionButton: Node3D

  var mittPrick: Node3D

  var playerStopscript: Variant

  var playerStop: Node3D

  var swipe: Node3D

  var furnitureHolder: Node3D

  var DoorHolder: Node3D

  var PickUpHolder: Node3D

  public GameObject[] beartraps

  var bedButton1: Node3D

  var bedButton2: Node3D

  var bedButton3: Node3D

  var dropButtonHolder: Node3D

  var shootButtonHolder: Node3D

  var coffinButton1: Node3D

  var coffinButton2: Node3D

  var carButton: Node3D

  var trapButtonUI: Variant

  var trapButton: Node3D

  var trapBar: Node3D

  var enDayStart: bool

  var soundHolder2: Node3D

  var Sound1: Node3D

  var Sound2: Node3D

  var Sound3: Node3D

  var cameraSee: Node3D

  var prisonDoorTrigger: Node3D

  var prisonDoor: Node3D

  var prisonGaller: Node3D

  var prisonGallerColliders: Node3D

  var teddyMusicHolder: Node3D

  var grannyHuntMusicHolder: Node3D

  var brunnsvevButton: Node3D

  var bastuSteamHolder: Node3D

  var Spider: Node3D

  var GrannyEyeLock: Node3D

  var GrannyBlindSensor: Node3D

  var spraySoundHolder: Node3D

  var sprayButton: Node3D

  var remoteButton: Node3D

  var remoteAndSprayButtonParent: Node3D
