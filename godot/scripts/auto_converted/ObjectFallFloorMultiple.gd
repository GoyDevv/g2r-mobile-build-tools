# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ObjectFallFloorMultiple.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ObjectFallFloorMultiple
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Granny = GameObject.Find("GrannyParent")

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "golv":
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 0.0
      if GameObject.Find("TempNavObjects(Clone)"):
        GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform.name = "TempNavObjects(Clone)Old"
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
        yield return new WaitForSeconds(0.5)
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      elif (GameObject.Find("TempNavObjects(Clone)Old"):
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
      else:
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
      ((Collider)self.GetComponent(typeof(Collider))).enabled = false
      yield return new WaitForSeconds(5.0)
      ((Collider)ParentObject.GetComponent(typeof(Collider))).enabled = false
      ((Rigidbody)ParentObject.GetComponent(typeof(Rigidbody))).isKinematic = true
      ParentObject.self  # TODO: was transform.name = ParentObject.self  # TODO: was transform.name + "(Clone)"
    var break: Variant

  var Granny: Node3D

  var spawnObject: Node3D

  var ParentObject: Node3D

  var ObjectLjud: Variant
