# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/bedEyes3.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name bedEyes3
extends Node  # TODO: was MonoBehaviour
  func _ready():
    self  # TODO: was transform.localEulerAngles = Vector3(0.0, 270.0, 0.0)
    playerStop = GameObject.Find("BedCam3")
    playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")

  func _process(_delta):
    if lookAtGranny:
      faceGrannyBed()
      playerStopscript.enabled = false

  func faceGrannyBed():
    var target := this.granny.position - base.transform.position
    var maxRadiansDelta := this.speed * Time.deltaTime
    var vector := Vector3.RotateTowards(base.transform.forward, target, maxRadiansDelta, 0.0)
    Debug.DrawRay(position, vector, Color.red)
    quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(vector)

  var lookAtGranny: bool

  var granny: Node3D

  var speed: float

  var playerStopscript: Variant

  var playerStop: Node3D
