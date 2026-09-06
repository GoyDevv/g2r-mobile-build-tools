# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/objectSoundAndDestroys.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name objectSoundAndDestroys
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
      else:
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
      StartCoroutine(HaveMakedSound())
      yield return new WaitForSeconds(10.0)
      Object.queue_free  # TODO: Destroy(ParentObject)
    elif (other.gameObject.tag == "Player"  and  this.haveMakedSound:
      Physics.IgnoreCollision(ParentObject.get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_CharacterController\")  # TODO: GetComponent, true)
    var break: Variant

  func HaveMakedSound():
    yield return new WaitForSeconds(2.0)
    haveMakedSound = true
    var break: Variant

  var Granny: Node3D

  var spawnObject: Node3D

  var ParentObject: Node3D

  var ObjectLjud: Variant

  var touchGround: bool

  var haveMakedSound: bool
