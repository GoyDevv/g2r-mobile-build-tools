# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/klockaTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name klockaTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyHearObject = true
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).startTimerSearch = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).GrannySearching = false
      ((klockaRinger)ljudHolder.GetComponent(typeof(klockaRinger))).startKlock = true
      if GameObject.Find("TempNavObjects(Clone)"):
        GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform.name = "TempNavObjects(Clone)Old"
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)
      elif (GameObject.Find("TempNavObjects(Clone)Old"):
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNavObjects(Clone)Old"))
      else:
        Object.Instantiate<Transform>(spawnObject, position, quaternion  # TODO: Unity->Godot rotation)

  var Granny: Node3D

  var spawnObject: Node3D

  var ljudHolder: Node3D
