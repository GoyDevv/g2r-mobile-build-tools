# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ljusstakeFallFloar.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ljusstakeFallFloar
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Granny = GameObject.Find("GrannyParent")

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "golv":
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).resetSafeTimer = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 0.0
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
      if GameObject.Find("TempNavObjects(Clone)"):
        GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform.name = "TempNavObjects(Clone)Old"
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
        yield return new WaitForSeconds(0.5)
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      elif (GameObject.Find("TempNavObjects(Clone)Old"):
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
      else:
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
      ((Collider)self.GetComponent(typeof(Collider))).enabled = false
      yield return new WaitForSeconds(3.0)
      ((CapsuleCollider)ParentObject.GetComponent(typeof(CapsuleCollider))).enabled = false
      ((BoxCollider)ParentObject.GetComponent(typeof(BoxCollider))).enabled = false
      ((Rigidbody)ParentObject.GetComponent(typeof(Rigidbody))).isKinematic = true
      ParentObject.self  # TODO: was transform.name = ParentObject.self  # TODO: was transform.name + "(Clone)"
    var break: Variant

  var Granny: Node3D

  var spawnObject: Node3D

  var ParentObject: Node3D

  var ObjectLjud: Variant
