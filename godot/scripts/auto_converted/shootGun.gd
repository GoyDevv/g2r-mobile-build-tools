# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/shootGun.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name shootGun
extends Node  # TODO: was MonoBehaviour
  public shootGun() {
  power = 500

func _ready():

func _process(_delta):
  var raycastHit := default(RaycastHit)
  var vector := this.SeeRay1.transform.TransformDirection(Vector3.forward)
  Debug.DrawRay(SeeRay1.position, SeeRay1.self  # TODO: was transform.forward, Color.green)
  if shooting:
    shooting = false
    shotgunAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Shoot")
    playerShootAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("shootGun")
    shootButton.SetActive(false)
    ((PickUp)ammoCheckHolder.GetComponent(typeof(PickUp))).oldShotgunLoaded = false
    ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).GunShoot()
    Object.Instantiate<Transform>(grannyHearSound, noiceDP.position, noiceDP.quaternion  # TODO: Unity->Godot rotation)
    if Physics.Raycast(SeeRay1.transform.position, vector, out raycastHit, 13.0):
      if raycastHit.rigidbody:
        raycastHit.rigidbody.AddForceAtPosition(vector * power, raycastHit.point)
      if raycastHit.collider.gameObject.tag == "granny":
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByGun = true
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = false
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
      elif (raycastHit.collider.gameObject.tag == "beartrap":
        ((BearTrap)raycastHit.collider.self.GetComponent(typeof(BearTrap))).beartrapShot = true
      elif (raycastHit.collider.gameObject.tag == "shootbutton":
        ((shootSpiderButton)raycastHit.collider.self.GetComponent(typeof(shootSpiderButton))).closeSpiderlucka()
      elif (raycastHit.collider.gameObject.tag == "spidernest":
        if not ((spiderControll)Spider.GetComponent(typeof(spiderControll))).SpiderBitePlayer:
          ((spiderControll)Spider.GetComponent(typeof(spiderControll))).huntPlayer = true
      elif (raycastHit.collider.gameObject.tag == "Spider":
        ((spiderControll)Spider.GetComponent(typeof(spiderControll))).spiderIsDead()
      elif (raycastHit.collider.gameObject.tag == "gascan":
        if not shootingOnGascan:
          shootingOnGascan = true
          ((explode)raycastHit.collider.self.GetComponent(typeof(explode))).explodeNow()
      elif (raycastHit.collider.gameObject.tag == "rat1":
        ((ratController)rat1.GetComponent(typeof(ratController))).Waittimer = 100.0
      elif (raycastHit.collider.gameObject.tag == "rat2":
        ((ratController)rat2.GetComponent(typeof(ratController))).Waittimer = 100.0
      elif (raycastHit.collider.gameObject.tag == "rat2":
        ((ratController)rat2.GetComponent(typeof(ratController))).Waittimer = 100.0
      elif (raycastHit.collider.gameObject.tag == "burdoor":
        ((CrowControl)crow.GetComponent(typeof(CrowControl))).shootInBur = true
      elif (raycastHit.collider.gameObject.tag == "crowbur":
        crow.SetActive(false)
        crowBurDead.SetActive(true)
        if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).ragdollSpawn:
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = true
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = true
      elif (raycastHit.collider.gameObject.tag == "croweat":
        crow.SetActive(false)
        crowEatDead.SetActive(true)
        if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).ragdollSpawn:
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = true
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = true
      elif (raycastHit.collider.gameObject.tag == "skjutplatta":
        ((SkjutplattaDoor)Skjutplatta.GetComponent(typeof(SkjutplattaDoor))).doorUnlocked = true
  else:
    shooting = false

var SeeRay1: Node3D

var Granny: Node3D

var playerShootAnim: Node3D

var shooting: bool

var shootButton: Node3D

var power: int

var ammoCheckHolder: Node3D

var shotgunAnim: Node3D

var soundHolder: Node3D

var grannyHearSound: Node3D

var noiceDP: Node3D

var velocity: Vector3

var Spider: Node3D

var shootingOnGascan: bool

var rat1: Node3D

var rat2: Node3D

var crow: Node3D

var crowBurDead: Node3D

var crowEatDead: Node3D

var Skjutplatta: Node3D
