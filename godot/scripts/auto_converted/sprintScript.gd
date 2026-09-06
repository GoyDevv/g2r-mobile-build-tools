# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/sprintScript.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name sprintScript
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if base.GetComponent<Animation>().IsPlaying("sprintAnim")  and  not sprintGone:
      sprintGone = true
      StartCoroutine(sprintTimer())

  func sprintTimer():
    yield return new WaitForSeconds(1.0)
    ((Rigidbody)GetComponent(typeof(Rigidbody))).isKinematic = false
    sparcle1.SetActive(false)
    yield return new WaitForSeconds(5.0)
    Object.queue_free  # TODO: Destroy(self)
    var break: Variant

  var sprintGone: bool

  var sparcle1: Node3D
