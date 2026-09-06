# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/MomHead.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name MomHead
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if faceReady  and  not faceNot:
      faceReady = false
      momFaceScare.SetActive(true)
      StartCoroutine(faceScare())

  func faceScare():
    yield return new WaitForSeconds(0.1)
    momFaceScare.SetActive(false)
    faceNot = true
    var break: Variant

  var momFaceScare: Node3D

  var faceReady: bool

  var faceNot: bool

  var ljudHolder: Node3D
