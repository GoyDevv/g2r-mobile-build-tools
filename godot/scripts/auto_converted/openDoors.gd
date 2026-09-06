# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/openDoors.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name openDoors
extends Node  # TODO: was MonoBehaviour
  public openDoors() {
  layerMask = 256

func _ready():
  layerMask = ~layerMask

func _process(_delta):
  var raycastHit := default(RaycastHit)
  var direction := this.doorRay.transform.TransformDirection(Vector3.forward)
  if not playerTaken:
    if Physics.Raycast(doorRay.transform.position, direction, out raycastHit, 4.0, layerMask):
      if raycastHit.collider.gameObject.tag == "innerdoorClosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorOpen")
      elif (raycastHit.collider.gameObject.tag == "innerdoorOpen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorClose")
      elif (raycastHit.collider.gameObject.tag == "innerdoorLocked"  or  raycastHit.collider.gameObject.tag == "steeldoorLocked":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorLocked")
      elif (raycastHit.collider.gameObject.tag == "smalldoorClosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SmallDoorOpen")
      elif (raycastHit.collider.gameObject.tag == "smalldoorOpen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SmallDoorClose")
      elif (raycastHit.collider.gameObject.tag == "smalldoorLocked":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SmallDoorLocked")
      elif (raycastHit.collider.gameObject.tag == "vitrindoorRclosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VitrindoorHallOpen")
      elif (raycastHit.collider.gameObject.tag == "vitrindoorRopen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VitrindoorHallClose")
      elif (raycastHit.collider.gameObject.tag == "vitrindoorLclosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VitrindoorHallLOpen")
      elif (raycastHit.collider.gameObject.tag == "vitrindoorLopen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VitrindoorHallLClose")
      elif (raycastHit.collider.gameObject.tag == "vitrindoorVRLclosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VitrindoorVRLOpen")
      elif (raycastHit.collider.gameObject.tag == "vitrindoorVRLopen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VitrindoorVRLClose")
      elif (raycastHit.collider.gameObject.tag == "vitrindoorVRRclosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VitrindoorVRROpen")
      elif (raycastHit.collider.gameObject.tag == "vitrindoorVRRopen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VitrindoorVRRClose")
      elif (raycastHit.collider.gameObject.tag == "kylClosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("KylOpen")
      elif (raycastHit.collider.gameObject.tag == "kylOpen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("KylClose")
      elif (raycastHit.collider.gameObject.tag == "kitchenDoor1Closed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("KitchenDoor1Open")
      elif (raycastHit.collider.gameObject.tag == "kitchenDoor1Open":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("KitchenDoor1Close")
      elif (raycastHit.collider.gameObject.tag == "kitchenDoor2Closed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("KitchenDoor2Open")
      elif (raycastHit.collider.gameObject.tag == "kitchenDoor2Open":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("KitchenDoor2Close")
      elif (raycastHit.collider.gameObject.tag == "loda1Closed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Loda1Open")
      elif (raycastHit.collider.gameObject.tag == "loda1Open":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Loda1Close")
      elif (raycastHit.collider.gameObject.tag == "loda2Closed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Loda2Open")
      elif (raycastHit.collider.gameObject.tag == "loda2Open":
        openDoorButton.SetActive(true)
        if openTheDoor:
          openTheDoor = false
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Loda2Close")
      elif (raycastHit.collider.gameObject.tag == "garde1Closed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Garde1Open")
      elif (raycastHit.collider.gameObject.tag == "garde1Open":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Garde1Close")
      elif (raycastHit.collider.gameObject.tag == "bakluckaLocked":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havecarKey:
            raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("bakluckaOpen")
          else:
            textTimer = 0.0
            needCarkeyText.SetActive(true)
            textTimerOnOff = true
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(bakluckaLocked)
      elif (raycastHit.collider.gameObject.tag == "bakluckaClosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("bakluckaOpen")
      elif (raycastHit.collider.gameObject.tag == "bakluckaOpen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("bakluckaClose")
      elif (raycastHit.collider.gameObject.tag == "motorhuvClosed":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("motorhuvOpen")
      elif (raycastHit.collider.gameObject.tag == "motorhuvOpen":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("motorhuvClose")
      elif (raycastHit.collider.gameObject.tag == "garageport":
        openDoorButton.SetActive(true)
        if openTheDoor:
          if garageportLock:
            garageportAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("garageportOpen")
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(garagePortSound)
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            ((carFrontSensor)carSensorFront.GetComponent(typeof(carFrontSensor))).garagedoorOpen = true
          elif (!this.playSound:
            playSound = true
            textTimer = 0.0
            garageportLockedText.SetActive(true)
            textTimerOnOff = true
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(brokenCarDoor)
      elif (raycastHit.collider.gameObject.tag == "microdoor":
        openDoorButton.SetActive(true)
        if openTheDoor:
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("MicroDoorOpen")
          raycastHit.collider.self.tag = "Untagged"
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(microDoor)
          microSparks.SetActive(true)
      elif (raycastHit.collider.gameObject.tag == "prisondoorlocked":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("prisondoorLocked")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorLockedLjud)
      elif (raycastHit.collider.gameObject.tag == "fanhurt":
        if not playerFanHurt:
          openDoorButton.SetActive(true)
          if openTheDoor  and  not playSound:
            playSound = true
            footstepScriptHolder.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("playerHurt")
            ((playerInBeartrap)bloodScreenHolder.GetComponent(typeof(playerInBeartrap))).playerStuck()
            playerFanHurt = true
            openDoorButton.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(fingerFan)
      elif (raycastHit.collider.gameObject.tag == "window":
        if not ((playerCrawl)checkPcrouch.GetComponent(typeof(playerCrawl))).PlayerHukarSig:
          if canJumpOut:
            openDoorButton.SetActive(true)
            if openTheDoor  and  not playSound:
              playSound = true
              ((PlayerWindowController)winController.GetComponent(typeof(PlayerWindowController))).jumpOut()
              openDoorButton.SetActive(false)
              canJumpOut = false
              checkPcrouch.SetActive(false)
          elif (this.canJumpIn:
            openDoorButton.SetActive(true)
            if openTheDoor  and  not playSound:
              playSound = true
              ((PlayerWindowController)winController.GetComponent(typeof(PlayerWindowController))).jumpIn()
              openDoorButton.SetActive(false)
              canJumpIn = false
              checkPcrouch.SetActive(false)
          else:
            openDoorButton.SetActive(false)
      elif (raycastHit.collider.gameObject.tag == "giljotinspak":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          giljotin.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("giljotinOn")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(giljotinLjud)
          openDoorButton.SetActive(false)
          raycastHit.collider.self.tag = "Untagged"
      elif (raycastHit.collider.gameObject.tag == "secretdoorbutton":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          secretDoor.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SecretDoorOpenLittle")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(secretDoorButton)
          secretDoorTrigger.SetActive(true)
          openDoorButton.SetActive(false)
          raycastHit.collider.self.tag = "Untagged"
      elif (raycastHit.collider.gameObject.tag == "bastuspakOff":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          bastuSpak.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BastuSpakOn")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(switchOnOff)
          raycastHit.collider.self.tag = "bastuspakOn"
          bastuSteam.get_node(\"TODO_ParticleSystem\")  # TODO: GetComponent.enableEmission = true
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuswitchOn = true
      elif (raycastHit.collider.gameObject.tag == "bastuspakOn":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          bastuSpak.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BastuSpakOff")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(switchOnOff)
          raycastHit.collider.self.tag = "bastuspakOff"
          bastuSteam.get_node(\"TODO_ParticleSystem\")  # TODO: GetComponent.enableEmission = false
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuswitchOn = false
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 20.0
      elif (raycastHit.collider.gameObject.tag == "bastubomUppe":
        if bastuDoor.gameObject.tag == "innerdoorClosed":
          openDoorButton.SetActive(true)
          if openTheDoor  and  not playSound:
            playSound = true
            bastuBom.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BastuBomNer")
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(bastuBomNer)
            raycastHit.collider.self.tag = "Untagged"
            bastuDoor.self.tag = "bastudoorLocked"
            if ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu:
              bastuDoorCarv.carving = enabled
              noiceObjectBastu.SetActive(true)
            StartCoroutine(bastuBommenNere())
            ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuBomNere = true
            openDoorButton.SetActive(false)
            openTheDoor = false
      elif (raycastHit.collider.gameObject.tag == "bastubomNere":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          bastuBom.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BastuBomUpp")
          raycastHit.collider.self.tag = "Untagged"
          bastuDoorCarv.carving = not enabled
          StartCoroutine(bastuBommenUppe())
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuBomNere = false
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuSafeTimer = 0.0
          openDoorButton.SetActive(false)
          openTheDoor = false
      elif (raycastHit.collider.gameObject.tag == "brokencardoor":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(brokenCarDoor)
          ((Rigidbody)raycastHit.collider.self.GetComponent(typeof(Rigidbody))).isKinematic = false
          raycastHit.collider.self.tag = "Untagged"
          openDoorButton.SetActive(false)
          openTheDoor = false
          ((destroyCarDoor)raycastHit.collider.self.GetComponent(typeof(destroyCarDoor))).destroyBrokenCardorr = true
      elif (raycastHit.collider.gameObject.tag == "handskfack":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("handskfackOpen")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(secretDoorButton)
          raycastHit.collider.self.tag = "Untagged"
          openDoorButton.SetActive(false)
          openTheDoor = false
      elif (raycastHit.collider.gameObject.tag == "playersteal":
        if not playerTrySteal:
          openDoorButton.SetActive(true)
          if openTheDoor  and  not playSound:
            playSound = true
            ((CrowControl)Crow.GetComponent(typeof(CrowControl))).playerSteal = true
            footstepScriptHolder.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("playerHurt")
            ((playerInBeartrap)bloodScreenHolder.GetComponent(typeof(playerInBeartrap))).playerStuck()
            playerTrySteal = true
            openDoorButton.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(crowAttack)
            StartCoroutine(crowAttackPlayer())
      elif (raycastHit.collider.gameObject.tag == "tavelspak":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          tavelspak.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Tavelspak")
          bokhylla.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BookShelfMove")
          bokhylla.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(bokhyllaLjud)
          raycastHit.collider.self.tag = "Untagged"
          openDoorButton.SetActive(false)
          openTheDoor = false
      elif (raycastHit.collider.gameObject.tag == "burdoor":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BurDoorOpen")
          ((CrowControl)Crow.GetComponent(typeof(CrowControl))).burdoorIsOpen = true
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(burDoor)
          raycastHit.collider.self.tag = "Untagged"
          openDoorButton.SetActive(false)
          openTheDoor = false
      elif (raycastHit.collider.gameObject.tag == "gallerhole":
        openDoorButton.SetActive(true)
        if openTheDoor  and  not playSound:
          playSound = true
          raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("GallerHole")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(moveGaller)
          raycastHit.collider.self.tag = "Untagged"
          openDoorButton.SetActive(false)
          openTheDoor = false
      elif (raycastHit.collider.gameObject.tag == "golv":
        openDoorButton.SetActive(false)
        openTheDoor = false
      elif (raycastHit.collider.gameObject.tag == "Untagged":
        openDoorButton.SetActive(false)
        openTheDoor = false
      elif (raycastHit.collider.gameObject.tag == "remoteLock":
        openDoorButton.SetActive(false)
        openTheDoor = false
    else:
      openDoorButton.SetActive(false)
      openTheDoor = false
  else:
    openDoorButton.SetActive(false)
  if textTimerOnOff:
    textTimer += Time.deltaTime
    if textTimer > 3.0:
      textTimerOnOff = false
      textTimer = 0.0
      needCarkeyText.SetActive(false)
      garageportLockedText.SetActive(false)

func bastuBommenNere():
  yield return new WaitForSeconds(1.0)
  bastuBom.self.tag = "bastubomNere"
  noiceObjectBastu.SetActive(false)
  var break: Variant

func bastuBommenUppe():
  yield return new WaitForSeconds(1.0)
  bastuBom.self.tag = "bastubomUppe"
  bastuDoor.self.tag = "innerdoorClosed"
  var break: Variant

func crowAttackPlayer():
  yield return new WaitForSeconds(2.0)
  playerTrySteal = false
  var break: Variant

var layerMask: int

var granny: Node3D

var gameController: Node3D

var openDoorButton: Node3D

var removeBTButton: Node3D

var resetBTbutton: bool

var doorRay: Node3D

var openTheDoor: bool

var playerTaken: bool

var removeBeartrap: bool

var footstepScriptHolder: Node3D

var player: Node3D

var joystick: Node3D

var microSparks: Node3D

var doorLocked: Variant

var microDoor: Variant

var fingerFan: Variant

var giljotinLjud: Variant

var doorLockedLjud: Variant

var secretDoorButton: Variant

var garagePortSound: Variant

var bakluckaLocked: Variant

var brokenCarDoor: Variant

var switchOnOff: Variant

var bastuBomNer: Variant

var bokhyllaLjud: Variant

var crowAttack: Variant

var burDoor: Variant

var moveGaller: Variant

var playSound: bool

var bloodScreenHolder: Node3D

var playerFanHurt: bool

var garageportLock: bool

var garageportAnimHolder: Node3D

var carSensorFront: Node3D

var needCarkeyText: Node3D

var garageportLockedText: Node3D

var textTimerOnOff: bool

var textTimer: float

var canJumpOut: bool

var canJumpIn: bool

var camOutToIn: Node3D

var camInToOut: Node3D

var winController: Node3D

var checkPcrouch: Node3D

var giljotin: Node3D

var secretDoor: Node3D

var secretDoorTrigger: Node3D

var bastuSpak: Node3D

var bastuSteam: Node3D

var bastuBom: Node3D

var bastuDoor: Node3D

var bastuDoorCarv: Variant

var noiceObjectBastu: Node3D

var droppedNoiceObj: bool

var tavelspak: Node3D

var bokhylla: Node3D

var playerTrySteal: bool

var Crow: Node3D
