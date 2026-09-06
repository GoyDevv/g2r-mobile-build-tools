# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/giljotinTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name giljotinTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "giljotinklinga":
      spak.self.tag = "Untagged"
      if meloninPlace:
        melon.SetActive(false)
        deladMelon.SetActive(true)
        keyShow.SetActive(true)
        meloninPlace = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
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
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
      StartCoroutine(giljoTimer())
    var break: Variant

  func giljoTimer():
    yield return new WaitForSeconds(1.6)
    spak.self.tag = "giljotinspak"
    var break: Variant

  var melon: Node3D

  var deladMelon: Node3D

  var Granny: Node3D

  var spawnObject: Node3D

  var ParentObject: Node3D

  var ObjectLjud: Variant

  var touchGround: bool

  var meloninPlace: bool

  var spak: Node3D

  var keyShow: Node3D
