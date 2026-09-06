# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/moveTunnellock.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name moveTunnellock
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not LockMoved:
      LockMoved = true
      self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("TunnelLock")
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ObjectLjud)
      Physics.IgnoreCollision(get_node(\"TODO_Collider\")  # TODO: GetComponent, other.get_node(\"TODO_Collider\")  # TODO: GetComponent, true)
      yield return new WaitForSeconds(20.0)
      Object.queue_free  # TODO: Destroy(self)
    var break: Variant

  var LockMoved: bool

  var ObjectLjud: Variant
