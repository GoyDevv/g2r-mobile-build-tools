# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/carbumberTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name carbumberTrigger
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((Rigidbody)self.GetComponent(typeof(Rigidbody))).isKinematic = false
      self  # TODO: was transform.parent = null
      StartCoroutine(destroy())

  func destroy():
    yield return new WaitForSeconds(30.0)
    Object.queue_free  # TODO: Destroy(self)
    var break: Variant
