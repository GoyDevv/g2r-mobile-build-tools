# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/cameraSeeTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name cameraSeeTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not camSee:
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerInPrison = true
      ((PickUp)player.GetComponent(typeof(PickUp))).playerInPrison = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = true
      doorTrigger.SetActive(true)
      if not camActivated:
        camActivated = true
        ((camLampBlink)cameraAlarm.GetComponent(typeof(camLampBlink))).startBlink = true
      if not doorClosed:
        doorClosed = true
        prisonDoor.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("prisondoorClose")
        ((prisonDoorOpenClose)prisonDoor.GetComponent(typeof(prisonDoorOpenClose))).doorLocked = true
      if GameObject.Find("PlankaVind") != null:
        planka1.SetActive(false)
      if GameObject.Find("PlankaVind2") != null:
        planka2.SetActive(false)
      if GameObject.Find("PlankaVind3") != null:
        planka3.SetActive(false)
      camSee = true
      noiceObject1.SetActive(true)
      yield return new WaitForSeconds(15.0)
      noiceObject2.SetActive(true)
      yield return new WaitForSeconds(15.0)
      noiceObject3.SetActive(true)
      yield return new WaitForSeconds(15.0)
      noiceObject4.SetActive(true)
      ((camLampBlink)cameraAlarm.GetComponent(typeof(camLampBlink))).soundOff = true
    if other.gameObject.tag == "granny":
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerInPrison = false
    var break: Variant

  var noiceObject1: Node3D

  var noiceObject2: Node3D

  var noiceObject3: Node3D

  var noiceObject4: Node3D

  var camSee: bool

  var camActivated: bool

  var doorClosed: bool

  var Granny: Node3D

  var player: Node3D

  var doorTrigger: Node3D

  var planka1: Node3D

  var planka2: Node3D

  var planka3: Node3D

  var cameraAlarm: Node3D

  var galler: Node3D

  var gallerColliders: Node3D

  var prisonDoor: Node3D
