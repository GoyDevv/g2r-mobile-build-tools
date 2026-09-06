# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/pushRigidbody.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name pushRigidbody
extends Node  # TODO: was MonoBehaviour
  public pushRigidbody() {
  pushPower = 2.0

func OnControllerColliderHit(hit: Variant):
  var attachedRigidbody := hit.collider.attachedRigidbody
  if attachedRigidbody == null  or  attachedRigidbody.isKinematic:
    return
  if hit.moveDirection.y < -0.3:
    return
  var a := Vector3(hit.moveDirection.x, 0.0, hit.moveDirection.z)
  attachedRigidbody.velocity = a * pushPower

var pushPower: float
