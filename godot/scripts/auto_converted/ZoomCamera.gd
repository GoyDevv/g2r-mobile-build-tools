# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ZoomCamera.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ZoomCamera
extends Node  # TODO: was MonoBehaviour
  func _init():
    zoomMin = -5.0
    zoomMax = 5.0
    seekTime = 1.0

  func _ready():
    thisTransform = self  # TODO: was transform
    defaultLocalPosition = thisTransform.localPosition
    currentZoom = zoom

  func _process(_delta):
    var raycastHit := default(RaycastHit)
    zoom = Mathf.Clamp(zoom, zoomMin, zoomMax)
    var layerMask := -261
    var position := this.origin.position
    var vector := this.defaultLocalPosition + this.thisTransform.parent.InverseTransformDirection(this.thisTransform.forward * this.zoom)
    var end := this.thisTransform.parent.TransformPoint(vector)
    if Physics.Linecast(position, end, out raycastHit, layerMask):
      var a := raycastHit.point + this.thisTransform.TransformDirection(Vector3.forward)
      targetZoom = (a - thisTransform.parent.TransformPoint(defaultLocalPosition)).magnitude
    else:
      targetZoom = zoom
    targetZoom = Mathf.Clamp(targetZoom, zoomMin, zoomMax)
    if not smoothZoomIn  and  targetZoom - currentZoom > 0.0:
      currentZoom = targetZoom
    else:
      currentZoom = Mathf.SmoothDamp(currentZoom, targetZoom, ref zoomVelocity, seekTime)
    vector = defaultLocalPosition + thisTransform.parent.InverseTransformDirection(thisTransform.forward * currentZoom)
    thisTransform.localPosition = vector

  var origin: Node3D

  var zoom: float

  var zoomMin: float

  var zoomMax: float

  var seekTime: float

  var smoothZoomIn: bool

  var defaultLocalPosition: Vector3

  var thisTransform: Node3D

  var currentZoom: float

  var targetZoom: float

  var zoomVelocity: float
