# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CrowControl.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CrowControl
extends Node  # TODO: was MonoBehaviour
  func _ready():
    CrowAnimHolder = CrowAnimHolder.self.get_node(\"TODO_Animator\")  # TODO: GetComponent
    CrowAnimHolder.Play("CrowIdle")

  func _process(_delta):
    if CrowStartEat  and  not isFlying:
      isFlying = true
      StartCoroutine(crowStartFly())
    if playerSteal  and  not isAttacking  and  not isFlying:
      isAttacking = true
      StartCoroutine(crowProtectItem())
    if shootInBur  and  not crowGetShoot  and  not isFlying:
      crowGetShoot = true
      StartCoroutine(crowStartFlyShoot())

  func crowStartFly():
    if not burdoorIsOpen:
      burdoorIsOpen = true
      BurDoor.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BurDoorOpen")
      BurDoor.self.tag = "Untagged"
    Seed.SetActive(true)
    CrowBur.SetActive(false)
    CrowFlyEat.SetActive(true)
    crowGone.SetActive(false)
    CrowFlyAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("FlyEat")
    yield return new WaitForSeconds(1.1)
    CrowEat.SetActive(true)
    CrowFlyEat.SetActive(false)
    yield return new WaitForSeconds(3.0)
    Seed.SetActive(false)
    yield return new WaitForSeconds(2.0)
    CrowEat.SetActive(false)
    CrowFlyBack.SetActive(true)
    CrowFlyAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("CrowFlyBack")
    yield return new WaitForSeconds(1.1)
    CrowFlyBack.SetActive(false)
    CrowBur.SetActive(true)
    crowGone.SetActive(true)
    CrowAnimHolder.Play("CrowIdle")
    isFlying = false
    CrowStartEat = false
    seedPlate.self.tag = "birdseedplate"
    var break: Variant

  func crowProtectItem():
    CrowAnimHolder.Play("Attack")
    yield return new WaitForSeconds(1.5)
    CrowAnimHolder.Play("CrowIdle")
    isAttacking = false
    playerSteal = false
    Object.Instantiate<GameObject>(GrannyHear, GrannyHearSP.position, GrannyHearSP.rotation)
    var break: Variant

  func crowStartFlyShoot():
    if not crowNotShotAgain:
      crowNotShotAgain = true
      if not burdoorIsOpen:
        burdoorIsOpen = true
        BurDoor.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BurDoorOpen")
        BurDoor.self.tag = "Untagged"
      CrowBur.SetActive(false)
      CrowFlyEat.SetActive(true)
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(crowShootLjud, 0.7)
      CrowFlyAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("crowShootOut")
      yield return new WaitForSeconds(0.3)
      CrowFlyAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("crowShootIn")
      CrowFlyEat.SetActive(false)
      CrowFlyBack.SetActive(true)
      yield return new WaitForSeconds(0.3)
      CrowFlyBack.SetActive(false)
      CrowBur.SetActive(true)
      CrowAnimHolder.Play("CrowIdle")
      crowGetShoot = false
      shootInBur = false
    elif (this.crowNotShotAgain:
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(crowShootLjud, 0.7)
      crowGetShoot = false
      shootInBur = false
    var break: Variant

  var CrowBur: Node3D

  var CrowFlyAnim: Node3D

  var CrowFlyEat: Node3D

  var CrowFlyBack: Node3D

  var CrowEat: Node3D

  var BurDoor: Node3D

  var Seed: Node3D

  var seedPlate: Node3D

  var crowGone: Node3D

  var burdoorIsOpen: bool

  var CrowAnimHolder: Variant

  var CrowStartEat: bool

  var isFlying: bool

  var isAttacking: bool

  var playerSteal: bool

  var shootInBur: bool

  var crowGetShoot: bool

  var crowNotShotAgain: bool

  var GrannyHear: Node3D

  var GrannyHearSP: Node3D

  var crowShootLjud: Variant
