# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/spiderControll.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name spiderControll
extends Node  # TODO: was MonoBehaviour
  public spiderControll() {
  spiderDeadTimer = 8.0
  spiderInNest = true

func _ready():
  spider2AnimHolder = spider2AnimHolder.self.get_node(\"TODO_Animator\")  # TODO: GetComponent
  spider2AnimHolder.Play("idle")

func _process(_delta):
  if not spiderDead:
    if not spiderResetNow:
      if huntPlayer  and  not playerCaught:
        spiderInNest = false
        self  # TODO: was transform.Translate(Vector3.forward * Time.deltaTime * spiderSpeed)
        var forward := this.PlayerPos.position - base.transform.position
        forward.y = 0.0
        var b := Quaternion.LookRotation(forward)
        quaternion  # TODO: Unity->Godot rotation = Quaternion.Slerp(quaternion  # TODO: Unity->Godot rotation, b, Time.deltaTime * damping)
        foodCollider.SetActive(false)
        playerCollider.SetActive(true)
        running()
        if not soundSeePlayed:
          soundSeePlayed = true
          ((spiderSoundEffects)soundEffectHolder.GetComponent(typeof(spiderSoundEffects))).spiderSeePlayer()
      if foodTime:
        spiderInNest = false
        self  # TODO: was transform.Translate(Vector3.forward * Time.deltaTime * 10.0)
        self  # TODO: was transform.LookAt(FoodPlate)
        foodCollider.SetActive(true)
        playerCollider.SetActive(false)
        running()
    if spiderResetNow  and  not spiderStartEat  and  not huntPlayer:
      self  # TODO: was transform.Translate(Vector3.forward * Time.deltaTime * spiderSpeed)
      var forward2 := this.spiderNotHuntPosition.position - base.transform.position
      forward2.y = 0.0
      var b2 := Quaternion.LookRotation(forward2)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.Slerp(quaternion  # TODO: Unity->Godot rotation, b2, Time.deltaTime * damping)
      foodCollider.SetActive(true)
      playerCollider.SetActive(false)
      running()
    if spiderRunToNest  and  not spiderStartEat  and  not huntPlayer:
      self  # TODO: was transform.Translate(Vector3.forward * Time.deltaTime * spiderSpeed)
      var forward3 := this.spiderNestPosition.position - base.transform.position
      forward3.y = 0.0
      var b3 := Quaternion.LookRotation(forward3)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.Slerp(quaternion  # TODO: Unity->Godot rotation, b3, Time.deltaTime * damping)
      foodCollider.SetActive(true)
      playerCollider.SetActive(false)
      running()
  if spiderDead:
    spiderDeadTimer -= Time.deltaTime
    if spiderDeadTimer <= 0.0:
      inactivateSpider.SetActive(false)
      inactivateSpiderTrigger.SetActive(false)
  if spiderStartEat:
    spiderEatTimer += Time.deltaTime
    if spiderEatTimer >= 10.0:
      spiderStartEat = false
      spiderTrigger2.SetActive(true)
      meatOnPlate.SetActive(false)
      spiderRunToNest = true
  if spiderBackoff:
    beforeBackToNestTimer += Time.deltaTime
    if beforeBackToNestTimer >= 7.0:
      spiderBackoff = false
      beforeBackToNestTimer = 0.0
      spiderRunToNest = true

func running():
  if not spiderDead:
    spider2AnimHolder.Play("Walk")

func attack():
  if not spiderDead:
    spider2AnimHolder.Play("attack")
    playerDead()

func idle():
  if not spiderDead:
    spider2AnimHolder.Play("idle")

func playerDead():
  if not spiderDead  and  not SpiderBitePlayer:
    foodCollider.SetActive(false)
    SpiderBitePlayer = true
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerGetCaught = true
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerFallDeath = true
    ((grannyRestart)gameController.GetComponent(typeof(grannyRestart))).playerFallDead = true
    huntPlayer = false
    spider2AnimHolder.Play("attack")
    ((playerCrawl)playerHukaKnapp.GetComponent(typeof(playerCrawl))).standUp()
    playerHukaKnappParent.SetActive(false)
    if not soundAttackPlayed:
      soundAttackPlayed = true
      ((spiderSoundEffects)soundEffectHolder.GetComponent(typeof(spiderSoundEffects))).spiderAttackPlayer()
      ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerBiten()
    StartCoroutine(spiderToStartPos())

func spiderToStartPos():
  if not spiderDead:
    yield return new WaitForSeconds(1.0)
    spiderParent.position = spiderPlayerPosition.position
    spiderParent.quaternion  # TODO: Unity->Godot rotation = spiderPlayerPosition.rotation
    yield return new WaitForSeconds(7.0)
    spiderParent.position = spiderStartPosition.position
    spiderParent.quaternion  # TODO: Unity->Godot rotation = spiderStartPosition.rotation
    spiderInNest = true
    SpiderBitePlayer = false
    soundSeePlayed = false
    soundAttackPlayed = false
    spiderTrigger2.SetActive(false)
    inactivateSpiderTrigger.SetActive(true)
    spider2AnimHolder.Play("idle")
  var break: Variant

func grannyCaughtPlayer():
  if not spiderDead:
    playerCaught = true
    spider2AnimHolder.Play("idle")
    spiderInNest = true
    SpiderBitePlayer = false
    soundSeePlayed = false
    soundAttackPlayed = false
    spiderTrigger2.SetActive(false)
    inactivateSpiderTrigger.SetActive(true)

func grannyCaughtPlayerReset():
  spiderParent.position = spiderStartPosition.position
  spiderParent.quaternion  # TODO: Unity->Godot rotation = spiderStartPosition.rotation
  playerCaught = false
  huntPlayer = false
  spider2AnimHolder.Play("idle")

func spiderIsDead():
  spiderDead = true
  spider2AnimHolder.Play("die")
  SpiderBitePlayer = false
  soundSeePlayed = false
  soundAttackPlayed = false
  foodCollider.SetActive(false)
  playerCollider.SetActive(false)
  spiderTrigger2.SetActive(false)
  if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).ragdollSpawn:
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = true
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = true
  leavetrigger.SetActive(false)
  ((spiderSoundEffects)soundEffectHolder.GetComponent(typeof(spiderSoundEffects))).spiderDie()

var gameController: Node3D

var playerCaught: bool

var spiderDead: bool

var spiderParent: Node3D

var spiderStartPosition: Node3D

var spiderPlayerPosition: Node3D

var huntPlayer: bool

var foodTime: bool

var spiderDeadTimer: float

var spiderEatTimer: float

var beforeBackToNestTimer: float

var spiderStartEat: bool

var SpiderBitePlayer: bool

var PlayerPos: Node3D

var Player: Node3D

var Granny: Node3D

var FoodPlate: Node3D

var spiderSpeed: float

var spider2AnimHolder: Variant

var foodCollider: Node3D

var playerCollider: Node3D

var damping: float

var soundSeePlayed: bool

var soundAttackPlayed: bool

var spiderResetNow: bool

var spiderRunToNest: bool

var spiderBackoff: bool

var spiderInNest: bool

var soundEffectHolder: Node3D

var playerHukaKnapp: Node3D

var playerHukaKnappParent: Node3D

var inactivateSpider: Node3D

var inactivateSpiderTrigger: Node3D

var spiderTrigger2: Node3D

var meatOnPlate: Node3D

var leavetrigger: Node3D

var spiderNestPosition: Node3D

var spiderNotHuntPosition: Node3D
