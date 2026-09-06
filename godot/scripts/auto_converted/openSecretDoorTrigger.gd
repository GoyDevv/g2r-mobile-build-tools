# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/openSecretDoorTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name openSecretDoorTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      door.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SecretDoorOpen")
      doorljud.SetActive(true)
      Object.queue_free  # TODO: Destroy(doorTrigger)

  var door: Node3D

  var doorljud: Node3D

  var doorTrigger: Node3D
