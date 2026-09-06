# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ratController.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ratController
extends Node  # TODO: was MonoBehaviour
  func _ready():
    ratAnim.Play("Idle")
    agent.speed = 4.5
    wanderTimer = Random.Range(10, 30)
    ratAnim = ratAnim.self.get_node(\"TODO_Animator\")  # TODO: GetComponent
    ratR = false
    ratS = false

  func _enter_tree():
    agent = get_node(\"TODO_NavMeshAgent\")  # TODO: GetComponent
    timer = wanderTimer

  func _process(_delta):
    if not wait:
      timer += Time.deltaTime
    if wait:
      Waittimer += Time.deltaTime
      agent.speed = 0.0
      if Waittimer >= waitingTimer:
        wait = false
        Waittimer = 0.0
        agent.speed = 4.5
    if timer >= wanderTimer:
      var destination := ratController.RandomNavSphere(base.transform.position, this.wanderRadius, -1)
      agent.SetDestination(destination)
      timer = 0.0
      wait = true
      wanderTimer = Random.Range(10, 30)
    if agent.velocity != Vector3.zero:
      if not ratR:
        ratR = true
        ratS = false
        ratRunning()
    elif (!this.ratS:
      ratS = true
      ratR = false
      ratStopped()

  func ratStopped():
    agent.speed = 0.0
    ratAnim.Play("Idle")
    timer = 50.0
    boxCol.enabled = true

  func ratRunning():
    agent.speed = 4.5
    ratAnim.Play("Run")
    boxCol.enabled = false

  func getShoot():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ratNoise)

  func RandomNavSphere(origin: Vector3, dist: float, layermask: int):
    var vector := UnityEngine.Random.insideUnitSphere * dist
    vector += origin
    var navMeshHit: Variant
    NavMesh.SamplePosition(vector, out navMeshHit, dist, layermask)
    return navMeshHit.position

  var wanderRadius: float

  var wanderTimer: float

  var waitingTimer: float

  var ratAnim: Variant

  var target: Node3D

  var agent: Variant

  var timer: float

  var Waittimer: float

  var wait: bool

  var distanceWaypoint: float

  var ratS: bool

  var ratR: bool

  var ratNoise: Variant

  var boxCol: Variant
