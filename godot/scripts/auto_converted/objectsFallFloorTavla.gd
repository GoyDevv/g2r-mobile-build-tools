# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/objectsFallFloorTavla.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name objectsFallFloorTavla
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Granny = GameObject.Find("GrannyParent")

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "golv":
      var random := UnityEngine.Random.Range(0, this.ObjectLjud.Length)
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).resetSafeTimer = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerSearch = 0.0
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud[random])
      if GameObject.Find("TempNavObjects(Clone)"):
        GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform.name = "TempNavObjects(Clone)Old"
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
        yield return new WaitForSeconds(0.5)
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      elif (GameObject.Find("TempNavObjects(Clone)Old"):
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      else:
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
      yield return new WaitForSeconds(6.0)
      ((Collider)ParentObject.GetComponent(typeof(Collider))).enabled = false
      ((Rigidbody)ParentObject.GetComponent(typeof(Rigidbody))).isKinematic = true
      nameIt()
    var break: Variant

  func nameIt():
    if not notMore:
      notMore = true
      ParentObject.self  # TODO: was transform.name = ParentObject.self  # TODO: was transform.name + "(Clone)"

  var Granny: Node3D

  var spawnObject: Node3D

  var ParentObject: Node3D

  public AudioClip[] ObjectLjud

  var notMore: bool
