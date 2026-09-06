# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/insideCarButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name insideCarButton
extends Node  # TODO: was MonoBehaviour
  func _ready():
    button.sprite = hideTexture
    PlayerHiding = false
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    if not PlayerHiding:
      player.SetActive(false)
      PlayerHiding = true
      inCoffin.SetActive(true)
      underBedCam.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 0.0, 0.0)
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHidingInCar = true
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hidingInCar = true
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerNearGranny = false
      joystick.SetActive(false)
      crouchButton.SetActive(false)
      dropButtonHolder.SetActive(false)
      shootButtonHolder.SetActive(false)
      shootGunButtonHolder.SetActive(false)
      sprayButtonHolder.SetActive(false)
      pickupButton.SetActive(false)
      openDoorButton.SetActive(false)
      mittenRing.SetActive(false)
      startButton.SetActive(true)
      ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).CarIn()
      engineOffSound.SetActive(false)
      objectsHolder.SetActive(false)
    else:
      inCoffin.SetActive(false)
      player.position = playerPosition.position
      player.SetActive(true)
      player.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 0.0, 0.0)
      PlayerHiding = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHidingInCar = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hidingInCar = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerStartCar = false
      joystick.SetActive(true)
      crouchButton.SetActive(true)
      dropButtonHolder.SetActive(true)
      shootButtonHolder.SetActive(true)
      shootGunButtonHolder.SetActive(true)
      sprayButtonHolder.SetActive(true)
      spraySoundholder.SetActive(false)
      sprayParticle.SetActive(false)
      ((sprayPepper)sprayButton.GetComponent(typeof(sprayPepper))).sprayTime = false
      startButton.SetActive(false)
      reverseButton.SetActive(false)
      forwardButton.SetActive(false)
      objectsHolder.SetActive(true)
      ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).CarOut()
      if ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).engineOn:
        engineOffSound.SetActive(true)
        engineOnSound.SetActive(false)
        engineStartSound.SetActive(false)
        ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).engineOn = false
    if PlayerHiding:
      button.sprite = UnhideTexture
    else:
      button.sprite = hideTexture

  var player: Node3D

  var granny: Node3D

  var inCoffin: Node3D

  var underBedCam: Node3D

  var playerPosition: Node3D

  var PlayerHiding: bool

  var joystick: Node3D

  var crouchButton: Node3D

  var soundHolder: Node3D

  var dropButtonHolder: Node3D

  var shootButtonHolder: Node3D

  var shootGunButtonHolder: Node3D

  var sprayButtonHolder: Node3D

  var spraySoundholder: Node3D

  var sprayButton: Node3D

  var sprayParticle: Node3D

  var pickupButton: Node3D

  var openDoorButton: Node3D

  var mittenRing: Node3D

  var hideTexture: Variant

  var UnhideTexture: Variant

  var button: Variant

  var btn1: Variant

  var lockRotXNer: float

  var lockRotXUpp: float

  var startButton: Node3D

  var reverseButton: Node3D

  var forwardButton: Node3D

  var gameController: Node3D

  var engineOffSound: Node3D

  var engineOnSound: Node3D

  var engineStartSound: Node3D

  var objectsHolder: Node3D
