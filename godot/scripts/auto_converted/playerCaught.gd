# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/playerCaught.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name playerCaught
extends Node  # TODO: was MonoBehaviour
  func _ready():
    playerStop = GameObject.Find("Main Camera")
    playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")

  func _process(_delta):
    if player.activeSelf:
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHidingUnderBed = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHidingInCoffin = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHidingInCoffinBackyard = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHidingInCar = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hidingUnderBed1 = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hidingUnderBed2 = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hidingUnderBed3 = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hidingInCoffin4 = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hidingInCoffinBY = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hidingInCar = false
    if grannyTakePlayer  and  not spiderBitePlayer  and  not explodingPlayer:
      StartCoroutine(faceGranny())
    if spiderBitePlayer  and  not grannyTakePlayer  and  not explodingPlayer:
      StartCoroutine(faceSpider())
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).dontHitPlayer = true
    if explodingPlayer  and  not grannyTakePlayer  and  not spiderBitePlayer:
      StartCoroutine(playerExplode())
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).dontHitPlayer = true
    if startFOV:
      if playerStop.GetComponent<Camera>().fieldOfView <= 30.0:
        stopFOV = true
        startFOV = false
      if not stopFOV:
        playerStop.get_node(\"TODO_Camera\")  # TODO: GetComponent.fieldOfView = playerStop.get_node(\"TODO_Camera\")  # TODO: GetComponent.fieldOfView - 100.0 * Time.deltaTime

  func faceGranny():
    var targetDir := this.grannyEye.position - this.playerEye.position
    var step := this.speed * Time.deltaTime
    var newDir := Vector3.RotateTowards(this.playerEye.forward, targetDir, step, 0.0)
    Debug.DrawRay(position, newDir, Color.red)
    playerEye.rotation = Quaternion.LookRotation(newDir)
    ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
    ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerHit()
    joystick.SetActive(false)
    swipe.SetActive(false)
    duckaKnapp.SetActive(false)
    optionButton.SetActive(false)
    playerStopscript.enabled = false
    trapButton.SetActive(false)
    removeBar.fillAmount = 0.0
    trapBar.SetActive(false)
    bedButton1.SetActive(false)
    bedButton2.SetActive(false)
    bedButton3.SetActive(false)
    CoffinButton1.SetActive(false)
    CoffinButton2.SetActive(false)
    CarButton.SetActive(false)
    ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
    ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
    ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
    if not soundPlaying:
      soundPlaying = true
      if PlayerPrefs.GetInt("NightMareOnOff") == 1:
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).playerCaughtNightmare()
      else:
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).playerCaught()
    if ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerCaughtLastTime:
      yield return new WaitForSeconds(0.8)
      playerStop.get_node(\"TODO_Camera\")  # TODO: GetComponent.fieldOfView = 60.0
      MainCam.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerDie"].speed = 1.0
      MainCam.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerDie")
    yield return new WaitForSeconds(0.2)
    grannyTakePlayer = false
    spiderBitePlayer = false
    explodingPlayer = false
    StartCoroutine(((endDay)gameController.GetComponent(typeof(endDay))).EndDay())
    var break: Variant

  func fallingDead():
    ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
    ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerStuck()
    ((playerCrawl)playerHukaKnapp.GetComponent(typeof(playerCrawl))).standUp()
    joystick.SetActive(false)
    swipe.SetActive(false)
    duckaKnapp.SetActive(false)
    optionButton.SetActive(false)
    playerStopscript.enabled = false
    trapButton.SetActive(false)
    removeBar.fillAmount = 0.0
    trapBar.SetActive(false)
    bedButton1.SetActive(false)
    bedButton2.SetActive(false)
    bedButton3.SetActive(false)
    ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
    ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
    ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
    MainCam.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerDie"].speed = 1.0
    MainCam.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerDie")
    if ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).ragdollSpawn:
      ((grannyRestart)gameController.GetComponent(typeof(grannyRestart))).playerFallDead = true
    yield return new WaitForSeconds(0.2)
    grannyTakePlayer = false
    spiderBitePlayer = false
    explodingPlayer = false
    StartCoroutine(((endDay)gameController.GetComponent(typeof(endDay))).EndDay())
    var break: Variant

  func playerExplode():
    ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
    ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerStuck()
    ((playerCrawl)playerHukaKnapp.GetComponent(typeof(playerCrawl))).standUp()
    joystick.SetActive(false)
    swipe.SetActive(false)
    duckaKnapp.SetActive(false)
    optionButton.SetActive(false)
    playerStopscript.enabled = false
    trapButton.SetActive(false)
    removeBar.fillAmount = 0.0
    trapBar.SetActive(false)
    bedButton1.SetActive(false)
    bedButton2.SetActive(false)
    bedButton3.SetActive(false)
    ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
    ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
    ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
    MainCam.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerDie"].speed = 1.0
    MainCam.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerDie")
    if ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).ragdollSpawn:
      ((grannyRestart)gameController.GetComponent(typeof(grannyRestart))).playerFallDead = true
    yield return new WaitForSeconds(0.2)
    grannyTakePlayer = false
    spiderBitePlayer = false
    explodingPlayer = false
    StartCoroutine(((endDay)gameController.GetComponent(typeof(endDay))).EndDay())
    var break: Variant

  func faceSpider():
    var targetDir := this.spiderPos.position - this.playerEye.position
    var step := this.speed * Time.deltaTime
    var newDir := Vector3.RotateTowards(this.playerEye.forward, targetDir, step, 0.0)
    Debug.DrawRay(position, newDir, Color.red)
    playerEye.rotation = Quaternion.LookRotation(newDir)
    ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
    ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
    joystick.SetActive(false)
    swipe.SetActive(false)
    duckaKnapp.SetActive(false)
    optionButton.SetActive(false)
    playerStopscript.enabled = false
    trapButton.SetActive(false)
    removeBar.fillAmount = 0.0
    trapBar.SetActive(false)
    bedButton1.SetActive(false)
    bedButton2.SetActive(false)
    bedButton3.SetActive(false)
    CoffinButton1.SetActive(false)
    CoffinButton2.SetActive(false)
    CarButton.SetActive(false)
    ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
    ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
    ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
    if not soundPlaying:
      soundPlaying = true
    if ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerCaughtLastTime:
      MainCam.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerDie"].speed = 1.0
      MainCam.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerDie")
    yield return new WaitForSeconds(0.2)
    grannyTakePlayer = false
    spiderBitePlayer = false
    explodingPlayer = false
    StartCoroutine(((endDay)gameController.GetComponent(typeof(endDay))).EndDay())
    var break: Variant

  var grannyTakePlayer: bool

  var spiderBitePlayer: bool

  var explodingPlayer: bool

  var granny: Node3D

  var grannyEye: Node3D

  var spiderPos: Node3D

  var playerEye: Node3D

  var speed: float

  var joystick: Node3D

  var swipe: Node3D

  var duckaKnapp: Node3D

  var playerHukaKnapp: Node3D

  var optionButton: Node3D

  var footstepScriptHolder: Node3D

  var player: Node3D

  var dooropener: Node3D

  var seeHolder: Node3D

  var removeBar: Variant

  var trapButton: Node3D

  var trapBar: Node3D

  var playerStop: Node3D

  var MainCam: Node3D

  var playerStopscript: Variant

  var stopFOV: bool

  var startFOV: bool

  var timer: float

  var soundHolder: Node3D

  var soundPlaying: bool

  var gameController: Node3D

  var bedButton1: Node3D

  var bedButton2: Node3D

  var bedButton3: Node3D

  var CoffinButton1: Node3D

  var CoffinButton2: Node3D

  var CarButton: Node3D
