# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/BearTrap.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name BearTrap
extends Node  # TODO: was MonoBehaviour
  func _init():
    timer = 120.0

  func _ready():
    Granny = GameObject.Find("GrannyParent")
    gameController = GameObject.Find("GameController")
    timerStart = true

  func _process(_delta):
    joystick = GameObject.Find("JoystickParent")
    footstepScriptHolder = GameObject.Find("Main Camera")
    player = GameObject.Find("Player")
    playerHead = GameObject.Find("CameraShakeAnim")
    GrannyEye = GameObject.Find("GrannyEyes")
    crawlButtonParent = GameObject.Find("CrouchButtonParent")
    crawlButton = GameObject.Find("PlayerHukarSigButton")
    allBedButtons = GameObject.Find("AllBedButtons")
    if timerStart  and  not playerStuck:
      timer -= Time.deltaTime
      if timer < 0.0:
        Object.queue_free  # TODO: Destroy(self)
    if beartrapShot:
      beartrapShot = false
      beartrapDestroyed()

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerInHole:
        if timerStart  and  not beartrapOn:
          beartrapOn = true
          playerStuck = true
          ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = true
          self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Beartrap")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 0.0
          ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
          player.get_node(\"TODO_CharacterController\")  # TODO: GetComponent.height = 2.31
          playerHead.self  # TODO: was transform.self  # TODO: was transform.localPosition = Vector3(0.0, 0.786, 0.0)
          if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByArrow  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByGun  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByCar  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuKilled  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).freeze  and  GrannyEye.activeSelf:
            ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
          ((playerCrawl)crawlButton.GetComponent(typeof(playerCrawl))).PlayerHukarSig = false
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
          joystick.SetActive(false)
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
          crawlButtonParent.SetActive(false)
          allBedButtons.SetActive(false)
          if GameObject.Find("TempNavObjects(Clone)"):
            GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform.name = "TempNavObjects(Clone)Old"
            Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
          elif (GameObject.Find("TempNavObjects(Clone)Old"):
            Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
          else:
            Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
          ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerStuck()
          self.self  # TODO: was transform.tag = "BearTrapActivated"
      elif (!this.beartrapOn:
        ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = true
        self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Beartrap")
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
        beartrapShot = true
    elif ((other.gameObject.tag == "vas"  or  other.gameObject.tag == "vas2"  or  other.gameObject.tag == "hammer"  or  other.gameObject.tag == "hanglockkey"  or  other.gameObject.tag == "exitkey"  or  other.gameObject.tag == "avbitare"  or  other.gameObject.tag == "safekey"  or  other.gameObject.tag == "weaponkey"  or  other.gameObject.tag == "armborst"  or  other.gameObject.tag == "arrow"  or  other.gameObject.tag == "screwdriver"  or  other.gameObject.tag == "plankawalk"  or  other.gameObject.tag == "battery"  or  other.gameObject.tag == "kugg1"  or  other.gameObject.tag == "kugg2"  or  other.gameObject.tag == "melon"  or  other.gameObject.tag == "playhousekey"  or  other.gameObject.tag == "shotgun"  or  other.gameObject.tag == "book"  or  other.gameObject.tag == "specialkey"  or  other.gameObject.tag == "meat"  or  other.gameObject.tag == "wrench"  or  other.gameObject.tag == "gascan"  or  other.gameObject.tag == "carbattery"  or  other.gameObject.tag == "topplock"  or  other.gameObject.tag == "sparkplug"  or  other.gameObject.tag == "freezetrap")  and  !this.beartrapOn:
      beartrapOn = true
      timer = 20.0
      ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = true
      self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Beartrap")
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 0.0
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
      if GameObject.Find("TempNavObjects(Clone)"):
        GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform.name = "TempNavObjects(Clone)Old"
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
      elif (GameObject.Find("TempNavObjects(Clone)Old"):
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      else:
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
    if other.gameObject.tag == "golv":
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(BeartrapOnFloor)

  func beartrapDestroyed():
    if not beartrapOn:
      beartrapOn = true
      timer = 10.0
      ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = true
      self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Beartrap")
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 0.0
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
      if GameObject.Find("TempNavObjects(Clone)"):
        GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform.name = "TempNavObjects(Clone)Old"
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
      elif (GameObject.Find("TempNavObjects(Clone)Old"):
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      else:
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)

  var beartrapOn: bool

  var beartrapShot: bool

  var Granny: Node3D

  var spawnObject: Node3D

  var joystick: Node3D

  var ObjectLjud: Variant

  var BeartrapOnFloor: Variant

  var footstepScriptHolder: Node3D

  var player: Node3D

  var playerHead: Node3D

  var GrannyEye: Node3D

  var crawlButtonParent: Node3D

  var crawlButton: Node3D

  var allBedButtons: Node3D

  var timer: float

  var timerStart: bool

  var playerStuck: bool

  var gameController: Node3D
