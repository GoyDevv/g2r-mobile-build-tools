# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/particleCollider.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name particleCollider
extends Node  # TODO: was MonoBehaviour
  func OnParticleCollision(other: Node3D):
    if other.gameObject.tag == "vas":
      MonoBehaviour.print("Hit Granny")
