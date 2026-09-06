# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/GrannyCloseSensor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name GrannyCloseSensor
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      granny.self.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
      ((EnemyEye)grannyEye.GetComponent(typeof(EnemyEye))).enabled = true
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).hitByPepper = false
      self.SetActive(false)

  var granny: Node3D

  var grannyEye: Node3D
