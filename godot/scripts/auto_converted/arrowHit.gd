# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/arrowHit.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name arrowHit
extends Node  # TODO: was MonoBehaviour
  func _ready():
    yield return new WaitForSeconds(2.0)
    timer = true
    var break: Variant

  func _process(_delta):
    Granny = GameObject.Find("GrannyParent")

  func OnTriggerEnter(other: Variant):
    if not timer  and  other.gameObject.tag == "granny"  and  not noMoreHit:
      noMoreHit = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByArrow = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).spiderIsDead = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
      ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = true
      self  # TODO: was transform.Translate(depth * Vector3.forward)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(Vector3.right)
      Object.queue_free  # TODO: Destroy(self.get_node(\"TODO_Collider\")  # TODO: GetComponent)
      self  # TODO: was transform.parent = other.self  # TODO: was transform
      ((arrowHit)self.GetComponent(typeof(arrowHit))).enabled = false
      yield return new WaitForSeconds(2.0)
      Object.Instantiate<Transform>(arrow, position, quaternion  # TODO: Unity->Godot rotation)
      Object.queue_free  # TODO: Destroy(self)
    var break: Variant

  var timer: bool

  var noMoreHit: bool

  var depth: float

  var Granny: Node3D

  var arrow: Node3D
