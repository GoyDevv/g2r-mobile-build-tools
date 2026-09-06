# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/stopGranny.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name stopGranny
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "granny":
      if GameObject.Find("PlankaVind") != null:
        ((Rigidbody)planka1.self.GetComponent(typeof(Rigidbody))).isKinematic = false
        planka1.get_node(\"TODO_Collider\")  # TODO: GetComponent.self.tag = "plankawalk"
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(taBortPlanka)
      if GameObject.Find("PlankaVind2") != null:
        ((Rigidbody)planka2.self.GetComponent(typeof(Rigidbody))).isKinematic = false
        planka2.get_node(\"TODO_Collider\")  # TODO: GetComponent.self.tag = "plankawalk"
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(taBortPlanka)
      if GameObject.Find("PlankaVind3") != null:
        ((Rigidbody)planka3.self.GetComponent(typeof(Rigidbody))).isKinematic = false
        planka3.get_node(\"TODO_Collider\")  # TODO: GetComponent.self.tag = "plankawalk"
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(taBortPlanka)
      Object.queue_free  # TODO: Destroy(self)

  var planka1: Node3D

  var planka2: Node3D

  var planka3: Node3D

  var taBortPlanka: Variant
