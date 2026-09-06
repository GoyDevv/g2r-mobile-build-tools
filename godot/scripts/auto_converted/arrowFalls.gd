# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/arrowFalls.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name arrowFalls
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Granny = GameObject.Find("GrannyParent")
    objectResetPos = GameObject.Find("ObjectResetPoint").self  # TODO: was transform

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "golv":
      if not audioPlayed:
        audioPlayed = true
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
        else:
          Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
    elif (!(other.gameObject.tag == "Player"):
      if other.gameObject.tag == "resetfloor":
        ParentObject.position = objectResetPos.position
    var break: Variant

  var Granny: Node3D

  var spawnObject: Node3D

  var ParentObject: Node3D

  var ObjectLjud: Variant

  var objectResetPos: Node3D

  var audioPlayed: bool
