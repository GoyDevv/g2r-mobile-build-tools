# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/checkTheCar.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name checkTheCar
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if textTimerOnOff:
      textTimer += Time.deltaTime
      if textTimer > 3.0:
        textTimerOnOff = false
        textTimer = 0.0
        canNotStartCarText.SetActive(false)
        needCarKeyText.SetActive(false)

  func startCar():
    if batteryOK  and  topplockOK  and  sparkplugOK  and  fuelOK  and  playerHaveCarKey  and  topplocksskruvar == 6.0:
      startButton.SetActive(false)
      StartCoroutine(startEngine())
      if reverseOK:
        reverseButton.SetActive(true)
        forwardButton.SetActive(false)
      elif (this.forwardOK:
        forwardButton.SetActive(true)
        reverseButton.SetActive(false)
      else:
        reverseButton.SetActive(true)
        forwardButton.SetActive(false)
    elif (this.batteryOK  and  this.topplockOK  and  this.sparkplugOK  and  this.fuelOK  and  !this.playerHaveCarKey  and  this.topplocksskruvar == 6f:
      textTimer = 0.0
      needCarKeyText.SetActive(true)
      textTimerOnOff = true
    else:
      textTimer = 0.0
      canNotStartCarText.SetActive(true)
      textTimerOnOff = true

  func startEngine():
    engineOn = true
    engineStartSound.SetActive(true)
    ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerStartCar = true
    yield return new WaitForSeconds(0.6)
    engineOnSound.SetActive(true)
    var break: Variant

  var granny: Node3D

  var batteryOK: bool

  var topplockOK: bool

  var sparkplugOK: bool

  var fuelOK: bool

  var playerHaveCarKey: bool

  var topplocksskruvar: float

  var startButton: Node3D

  var forwardButton: Node3D

  var reverseButton: Node3D

  var forwardOK: bool

  var reverseOK: bool

  var engineOn: bool

  var engineStartSound: Node3D

  var engineOnSound: Node3D

  var outOffCarButton: Node3D

  var canNotStartCarText: Node3D

  var needCarKeyText: Node3D

  var textTimerOnOff: bool

  var textTimer: float

  var carMoving: bool
