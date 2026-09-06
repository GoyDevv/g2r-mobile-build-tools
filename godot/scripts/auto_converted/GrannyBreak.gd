# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/GrannyBreak.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name GrannyBreak
extends Node  # TODO: was MonoBehaviour
  func _ready():
    gameController = GameObject.Find("GameController")
    if PlayerPrefs.GetInt("DiffData") == 3:
      yield return new WaitForSeconds(15.0)
    else:
      yield return new WaitForSeconds(fadeStartTime)
    startBrake()
    StartCoroutine(Destroytimer())
    var break: Variant

  func startBrake():
    if not haveBreaked:
      haveBreaked = true
      top.self  # TODO: was transform.get_node(\"TODO_MeshCollider\")  # TODO: GetComponent.convex = true
      ((Rigidbody)top.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      ((Rigidbody)head.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      ((Rigidbody)leftArm.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      ((Rigidbody)RightArm.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      top.self  # TODO: was transform.parent = null
      head.self  # TODO: was transform.parent = null
      leftArm.self  # TODO: was transform.parent = null
      RightArm.self  # TODO: was transform.parent = null
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(crashLjud)

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "golv"  and  not haveBreaked:
      haveBreaked = true
      top.self  # TODO: was transform.get_node(\"TODO_MeshCollider\")  # TODO: GetComponent.convex = true
      ((Rigidbody)top.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      ((Rigidbody)head.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      ((Rigidbody)leftArm.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      ((Rigidbody)RightArm.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      top.self  # TODO: was transform.parent = null
      head.self  # TODO: was transform.parent = null
      leftArm.self  # TODO: was transform.parent = null
      RightArm.self  # TODO: was transform.parent = null
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(crashLjud)

  func Destroytimer():
    yield return new WaitForSeconds(5.0)
    ((grannyRestart)gameController.GetComponent(typeof(grannyRestart))).setTime()
    ((grannyRestart)gameController.GetComponent(typeof(grannyRestart))).startTimer = true
    Object.queue_free  # TODO: Destroy(parent)
    Object.queue_free  # TODO: Destroy(top)
    Object.queue_free  # TODO: Destroy(head)
    Object.queue_free  # TODO: Destroy(leftArm)
    Object.queue_free  # TODO: Destroy(RightArm)
    var break: Variant

  var parent: Node3D

  var gameController: Node3D

  var top: Node3D

  var head: Node3D

  var leftArm: Node3D

  var RightArm: Node3D

  var crashLjud: Variant

  var haveBreaked: bool

  var fadeStartTime: float
