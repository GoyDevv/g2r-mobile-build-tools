# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/motorhuvLoss.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name motorhuvLoss
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "car"  and  not MotorhuvLoss:
      MotorhuvLoss = true
      motorhuv.self  # TODO: was transform.parent = null
      ((Rigidbody)motorhuv.self.GetComponent(typeof(Rigidbody))).isKinematic = false
      motorhuv.self.tag = "Untagged"
      yield return new WaitForSeconds(8.0)
      Object.queue_free  # TODO: Destroy(motorhuv)
    var break: Variant

  var MotorhuvLoss: bool

  var motorhuv: Node3D
