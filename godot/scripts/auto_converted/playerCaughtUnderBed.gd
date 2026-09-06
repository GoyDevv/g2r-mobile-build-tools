# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/playerCaughtUnderBed.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name playerCaughtUnderBed
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

  func EndDayUnderBed():
    mittPrick.SetActive(false)
    yield return new WaitForSeconds(1.7)
    ((fadeUpDownTeddyMusic)teddyMusicHolder.GetComponent(typeof(fadeUpDownTeddyMusic))).playerCaught = true
    ((fadeUpDownGrannyHunt)grannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).playerCaught = true
    blackScreenTexture.CrossFadeAlpha(1.0, 0.2, false)
    yield return new WaitForSeconds(2.0)
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeDown = true
    yield return new WaitForSeconds(3.0)
    allBedButtons.SetActive(true)
    if bedCam1Holder.activeSelf:
      bedCam1.get_node(\"TODO_bedEyes\")  # TODO: GetComponent.lookAtGranny = false
      bedCam1.get_node(\"TODO_bedEyes\")  # TODO: GetComponent.playerStopscript.enabled = true
      bedCam1.self  # TODO: was transform.localEulerAngles = Vector3(0.0, -90.0, 0.0)
      bedCam1Holder.SetActive(false)
    if bedCam2Holder.activeSelf:
      bedCam2.get_node(\"TODO_bedEyes2\")  # TODO: GetComponent.lookAtGranny = false
      bedCam2.get_node(\"TODO_bedEyes2\")  # TODO: GetComponent.playerStopscript.enabled = true
      bedCam2.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 90.0, 0.0)
      bedCam2Holder.SetActive(false)
    if bedCam3Holder.activeSelf:
      bedCam3.get_node(\"TODO_bedEyes3\")  # TODO: GetComponent.lookAtGranny = false
      bedCam3.get_node(\"TODO_bedEyes3\")  # TODO: GetComponent.playerStopscript.enabled = true
      bedCam3.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 270.0, 0.0)
      bedCam3Holder.SetActive(false)
    if bedButton1.activeSelf:
      bedButton1.get_node(\"TODO_bedButton\")  # TODO: GetComponent.PlayerHiding = false
      bedButton1.SetActive(false)
    if bedButton2.activeSelf:
      bedButton2.get_node(\"TODO_bedButton2\")  # TODO: GetComponent.PlayerHiding = false
      bedButton2.SetActive(false)
    if bedButton3.activeSelf:
      bedButton3.get_node(\"TODO_bedButton3\")  # TODO: GetComponent.PlayerHiding = false
      bedButton3.SetActive(false)
    Player.SetActive(true)
    ((openDoors)DoorHolder.GetComponent(typeof(openDoors))).playerTaken = true
    ((PickUp)PickUpHolder.GetComponent(typeof(PickUp))).playerTaken = true
    playerStop = GameObject.Find("Main Camera")
    playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
    var script := (CameraFollowExample)this.playerStop.GetComponent(typeof(CameraFollowExample))
    script.rotationx = 0.0
    playerCam.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 0.0, 0.0)
    ((PickUp)PickUpHolder.GetComponent(typeof(PickUp))).dropObject = true
    yield return new WaitForSeconds(0.1)
    ((openDoors)DoorHolder.GetComponent(typeof(openDoors))).playerTaken = false
    ((PickUp)PickUpHolder.GetComponent(typeof(PickUp))).playerTaken = false
    Player.SetActive(false)
    dropButtonHolder.SetActive(true)
    shootButtonHolder.SetActive(true)
    dropButton.SetActive(false)
    playerInBedCam.SetActive(true)
    Player.position = PlayerStartPos.position
    Player.quaternion  # TODO: Unity->Godot rotation = PlayerStartPos.rotation
    Granny.SetActive(false)
    Granny.position = GrannyStartPos.position
    Granny.SetActive(true)
    var a := 0.5
    var color := this.joystickTexture.color
    color.a = a
    joystickTexture.color = color
    var a2 := 0.5
    var color2 := this.joystickRingTexture.color
    color2.a = a2
    joystickRingTexture.color = color2
    joystick.SetActive(false)
    crouchButton.SetActive(false)
    optionButton.SetActive(false)
    spraySoundholder.SetActive(false)
    remoteAndSprayButtonParent.SetActive(true)
    allBedButtons.SetActive(true)
    bastuSteamHolder.SetActive(false)
    if bedCam1Holder.activeSelf:
      bedCam1.get_node(\"TODO_bedEyes\")  # TODO: GetComponent.lookAtGranny = false
      bedCam1.get_node(\"TODO_bedEyes\")  # TODO: GetComponent.playerStopscript.enabled = true
      bedCam1.self  # TODO: was transform.localEulerAngles = Vector3(0.0, -90.0, 0.0)
      bedCam1Holder.SetActive(false)
    if bedCam2Holder.activeSelf:
      bedCam2.get_node(\"TODO_bedEyes2\")  # TODO: GetComponent.lookAtGranny = false
      bedCam2.get_node(\"TODO_bedEyes2\")  # TODO: GetComponent.playerStopscript.enabled = true
      bedCam2.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 90.0, 0.0)
      bedCam2Holder.SetActive(false)
    if bedCam3Holder.activeSelf:
      bedCam3.get_node(\"TODO_bedEyes3\")  # TODO: GetComponent.lookAtGranny = false
      bedCam3.get_node(\"TODO_bedEyes3\")  # TODO: GetComponent.playerStopscript.enabled = true
      bedCam3.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 270.0, 0.0)
      bedCam3Holder.SetActive(false)
    if bedButton1.activeSelf:
      bedButton1.get_node(\"TODO_bedButton\")  # TODO: GetComponent.PlayerHiding = false
      bedButton1.SetActive(false)
    if bedButton2.activeSelf:
      bedButton2.get_node(\"TODO_bedButton2\")  # TODO: GetComponent.PlayerHiding = false
      bedButton2.SetActive(false)
    if bedButton3.activeSelf:
      bedButton3.get_node(\"TODO_bedButton3\")  # TODO: GetComponent.PlayerHiding = false
      bedButton3.SetActive(false)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerGetCaught = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).attackingPlayer = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).huntPlayer = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyLookUnderBed = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hidingUnderBed1 = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hidingUnderBed2 = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hidingUnderBed3 = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHidingUnderBed = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerInHole = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = false
    mittPrick.SetActive(false)
    playerBedAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("PlayerInBed")
    playerBedAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = -50.0
    StartCoroutine(((furnitureControlls)furnitureHolder.GetComponent(typeof(furnitureControlls))).cleanUp())
    StartCoroutine(((startNewDay)daysCountHolder.GetComponent(typeof(startNewDay))).newDay())
    ((resetDay)daysCountHolder.GetComponent(typeof(resetDay))).resetDays()
    beartrapqueue_free  # TODO: Destroy()
    var break: Variant

  func beartrapDestroy():
    beartraps = GameObject.FindGameObjectsWithTag("BearTrapActivated")
    for i in range(int(this.beartraps.Length)):
      Object.queue_free  # TODO: Destroy(beartraps[i])

  var blackScreenTexture: Variant

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

  var furnitureHolder: Node3D

  public GameObject[] beartraps

  var allBedButtons: Node3D

  var bedCam1Holder: Node3D

  var bedCam2Holder: Node3D

  var bedCam3Holder: Node3D

  var bedCam1: Node3D

  var bedCam2: Node3D

  var bedCam3: Node3D

  var bedButton1: Node3D

  var bedButton2: Node3D

  var bedButton3: Node3D

  var playerStopscript: Variant

  var playerStop: Node3D

  var DoorHolder: Node3D

  var PickUpHolder: Node3D

  var dropButtonHolder: Node3D

  var shootButtonHolder: Node3D

  var dropButton: Node3D

  var soundHolder2: Node3D

  var teddyMusicHolder: Node3D

  var grannyHuntMusicHolder: Node3D

  var bastuSteamHolder: Node3D

  var spraySoundholder: Node3D

  var remoteAndSprayButtonParent: Node3D
