# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/SeeDooropener.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name SeeDooropener
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    var raycastHit := default(RaycastHit)
    var vector := this.yellowRay1.transform.TransformDirection(Vector3.forward)
    Debug.DrawRay(yellowRay1.position, vector * 3.0, Color.yellow)
    if Physics.Raycast(yellowRay1.transform.position, vector, out raycastHit, 4.0):
      if raycastHit.collider.gameObject.tag == "dooropener":
        hitDoorButton.SetActive(true)
      elif (raycastHit.collider.gameObject.tag == "Untagged":
        hitDoorButton.SetActive(false)
    else:
      hitDoorButton.SetActive(false)

  var yellowRay1: Node3D

  var hitDoorButton: Node3D
