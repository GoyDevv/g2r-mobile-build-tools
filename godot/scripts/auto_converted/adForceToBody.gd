# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/adForceToBody.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name adForceToBody
extends Node  # TODO: was MonoBehaviour
  func _ready():
    player = GameObject.Find("Player")
    var a := this.player.transform.position - base.transform.position
    get_node(\"TODO_Rigidbody\")  # TODO: GetComponent.AddForce(-a * 500.0)

  func _process(_delta):

  var player: Node3D

  var grannyShoot: bool
