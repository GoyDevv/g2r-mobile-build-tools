# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/grannyRestart.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name grannyRestart
extends Node  # TODO: was MonoBehaviour
  func setTime():
    if PlayerPrefs.GetInt("DiffData") == 0:
      timerCount = 30.0
    elif (PlayerPrefs.GetInt("DiffData") == 1:
      timerCount = 90.0
    elif (PlayerPrefs.GetInt("DiffData") == 2:
      timerCount = 0.0
    elif (PlayerPrefs.GetInt("DiffData") == 3:
      timerCount = 0.0

  func setTime2():
    if PlayerPrefs.GetInt("DiffData") == 0:
      timerCount = 60.0
    elif (PlayerPrefs.GetInt("DiffData") == 1:
      timerCount = 120.0
    elif (PlayerPrefs.GetInt("DiffData") == 2:
      timerCount = 30.0
    elif (PlayerPrefs.GetInt("DiffData") == 3:
      timerCount = 15.0

  func _process(_delta):
    if startTimer:
      timerCount -= Time.deltaTime
      if timerCount < 0.0  or  playerFallDead:
        startTimer = false
        Granny.SetActive(false)
        RandomNR = Random.Range(1, 5)
        if RandomNR == 1.0:
          Granny.position = GrannyStartPos1.position
        elif (this.RandomNR == 2f:
          Granny.position = GrannyStartPos2.position
        elif (this.RandomNR == 3f:
          Granny.position = GrannyStartPos3.position
        elif (this.RandomNR == 4f:
          Granny.position = GrannyStartPos4.position
        Granny.SetActive(true)
        GrannyBody.SetActive(true)
        playerFallDead = false
        noArrow()
    if startTimer2:
      timerCount -= Time.deltaTime
      if timerCount < 0.0  or  playerFallDead:
        startTimer2 = false
        Granny.SetActive(false)
        RandomNR = Random.Range(1, 5)
        if RandomNR == 1.0:
          Granny.position = GrannyStartPos1.position
        elif (this.RandomNR == 2f:
          Granny.position = GrannyStartPos2.position
        elif (this.RandomNR == 3f:
          Granny.position = GrannyStartPos3.position
        elif (this.RandomNR == 4f:
          Granny.position = GrannyStartPos4.position
        Granny.SetActive(true)
        GrannyBody.SetActive(true)
        playerFallDead = false
        noArrow()

  func noArrow():
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByArrow = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByGun = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByCar = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).freeze = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyStandBesideCar = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuKilled = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).ragdollSpawn = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimeOff = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).huntPlayer = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyIsFollow = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByPepperStart = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyPepperReact = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByPepper = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).seePlayer = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).waypointStop = true
    GrannyEyeLock.SetActive(false)
    if ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy:
      if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead:
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).navComponent.speed = ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannysVarSpeed
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannysAnimSpeed
      else:
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = false
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
    else:
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = false

  var Granny: Node3D

  var GrannyBody: Node3D

  var GrannyEyeLock: Node3D

  var GrannyStartPos1: Node3D

  var GrannyStartPos2: Node3D

  var GrannyStartPos3: Node3D

  var GrannyStartPos4: Node3D

  var timerCount: float

  var startTimer: bool

  var startTimer2: bool

  var RandomNR: float

  var playerFallDead: bool
