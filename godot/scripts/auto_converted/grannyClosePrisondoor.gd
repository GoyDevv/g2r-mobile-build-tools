# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/grannyClosePrisondoor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name grannyClosePrisondoor
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "granny":
      if not playerEscaped  and  not ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).seePlayer:
        if not firstTime:
          firstTime = true
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).prisondoorClosed = true
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = false
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = true
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 4.0
          noiceObjects.SetActive(false)
          ((camLampBlink)camSound.GetComponent(typeof(camLampBlink))).soundOff = true
        elif (this.firstTime:
          ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).prisondoorClosed = false
    elif (other.gameObject.tag == "Player":
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerInPrison = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
      playerEscaped = true

  func OnTriggerStay(other: Variant):
    if other.gameObject.tag == "granny"  and  ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).seePlayer  and  doorClosed:
      doorClosed = false

  var prisonDoor: Node3D

  var granny: Node3D

  var grannyEyes: Node3D

  var noiceObjects: Node3D

  var planka1: Node3D

  var planka2: Node3D

  var planka3: Node3D

  var doorClosed: bool

  var camSound: Node3D

  var firstTime: bool

  var playerEscaped: bool
