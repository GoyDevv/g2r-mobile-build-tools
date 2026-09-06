# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/noiceObjectFalls.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name noiceObjectFalls
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Granny = GameObject.Find("GrannyParent")

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "golv"  or  other.gameObject.tag == "grus":
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 0.0
      if GameObject.Find("TempNavObjects(Clone)"):
        GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform.name = "TempNavObjects(Clone)Old"
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
        yield return new WaitForSeconds(0.5)
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      elif (GameObject.Find("TempNavObjects(Clone)Old"):
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      else:
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
      ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = true
      StartCoroutine(destroy())
    var break: Variant

  func destroy():
    yield return new WaitForSeconds(5.0)
    Object.queue_free  # TODO: Destroy(self)
    var break: Variant

  var Granny: Node3D

  var spawnObject: Node3D
