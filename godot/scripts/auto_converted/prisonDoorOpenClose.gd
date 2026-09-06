# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/prisonDoorOpenClose.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name prisonDoorOpenClose
extends Node  # TODO: was MonoBehaviour
  public prisonDoorOpenClose() {
  DoorOpen = true

func _ready():
  DoorOpen = true

func _process(_delta):
  if not sprint1Bort  or  not sprint2Bort:
    if not DoorOpen:
      if base.GetComponent<Animation>().IsPlaying("prisondoorOpen"):
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorOpen)
        DoorOpen = true
        DoorMoving = true
        self.tag = "Untagged"
        StartCoroutine(timerDooropen())
      else:
        DoorMoving = false
    if DoorOpen:
      if base.GetComponent<Animation>().IsPlaying("prisondoorClose"):
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorClose)
        DoorOpen = false
        DoorMoving = true
        self.tag = "Untagged"
        StartCoroutine(timerDoorclosed())
      else:
        DoorMoving = false
    if not DoorOpen  and  base.GetComponent<Animation>().IsPlaying("prisondoorLocked")  and  not doorLocked:
      doorLocked = true
      timerDoorlocked()
  if sprint1Bort  and  sprint2Bort  and  not doorFree:
    doorFree = true
    StartCoroutine(doorLoose())

func timerDooropen():
  yield return new WaitForSeconds(1.0)
  DoorMoving = false
  if GameObject.Find("Sprint1") != null:
    sprint1.self.tag = "Untagged"
  if GameObject.Find("Sprint2") != null:
    sprint2.self.tag = "Untagged"
  if GameObject.Find("Sparkle1") != null:
    sparcle1.SetActive(false)
  if GameObject.Find("Sparkle2") != null:
    sparcle2.SetActive(false)
  var break: Variant

func timerDoorclosed():
  yield return new WaitForSeconds(1.0)
  self.tag = "prisondoorlocked"
  doorTrigger.SetActive(true)
  if GameObject.Find("Sprint1") != null:
    sprint1.self.tag = "sprint1"
  if GameObject.Find("Sprint2") != null:
    sprint2.self.tag = "sprint2"
  doorLocked = false
  DoorMoving = false
  yield return new WaitForSeconds(30.0)
  if base.gameObject.tag == "prisondoorlocked":
    if GameObject.Find("Sprint1") != null:
      sparcle1.SetActive(true)
    if GameObject.Find("Sprint2") != null:
      sparcle2.SetActive(true)
  var break: Variant

func timerDoorlocked():

func doorLoose():
  galler.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
  gallerColliders.SetActive(false)
  camSeeTrigger.SetActive(false)
  yield return new WaitForSeconds(2.0)
  doorTrigger.SetActive(false)
  ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerInPrison = false
  ((Rigidbody)GetComponent(typeof(Rigidbody))).isKinematic = false
  ((MeshCollider)GetComponent(typeof(MeshCollider))).convex = true
  self.tag = "Untagged"
  if GameObject.Find("Kameralampa") != null:
    ((camLampBlink)camSound.GetComponent(typeof(camLampBlink))).soundOff = true
  yield return new WaitForSeconds(15.0)
  Object.queue_free  # TODO: Destroy(self)
  var break: Variant

func OnTriggerEnter(other: Variant):
  if other.gameObject.tag == "granny"  and  (((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).seePlayer  or  ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).grannyIsFollow  or  ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject)  and  not doorFree  and  not doorOpenAgain:
    doorOpenAgain = true
    get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("prisondoorOpen")
    doorTrigger.SetActive(false)
    ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).playerInPrison = false
    camSeeTrigger.SetActive(false)
  if DoorMoving:
    if other.gameObject.tag == "Player":
      Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, true)
  elif (!this.DoorMoving:
    Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, false)

var DoorOpen: bool

var DoorMoving: bool

var doorOpen: Variant

var doorClose: Variant

var doorLockedLjud: Variant

var doorLocked: bool

var sprint1Bort: bool

var sprint2Bort: bool

var sprint1: Node3D

var sprint2: Node3D

var doorFree: bool

var sparcle1: Node3D

var sparcle2: Node3D

var galler: Node3D

var gallerColliders: Node3D

var doorTrigger: Node3D

var camSeeTrigger: Node3D

var camSound: Node3D

var bottomCollider: Node3D

var doorOpenAgain: bool

var granny: Node3D
