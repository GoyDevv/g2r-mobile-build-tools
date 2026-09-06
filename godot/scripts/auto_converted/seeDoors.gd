# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/seeDoors.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name seeDoors
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _physics_process(_delta):
    var raycastHit := default(RaycastHit)
    var vector := this.myTransform.TransformDirection(Vector3.forward)
    Debug.DrawLine(position, vector, Color.green)
    if Physics.Raycast(myTransform.position, vector, 3.0)  and  raycastHit.collider.gameObject.tag != "innerdoorclosed":
      MonoBehaviour.print("There is something in front of the object!")

  var myTransform: Node3D

  var seeRange: float
