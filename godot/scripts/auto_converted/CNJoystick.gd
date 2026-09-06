# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CNJoystick.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CNJoystick
extends Node  # TODO: base was CNAbstractController
  public float DragRadius {
  get {
  return _dragRadius
set {
_dragRadius = value

public bool SnapsToFinger {
get {
return _snapsToFinger
set {
_snapsToFinger = value

public bool IsHiddenIfNotTweaking {
get {
return _isHiddenIfNotTweaking
set {
_isHiddenIfNotTweaking = value

func _enter_tree():
  OnEnable()
  _stickTransform = TransformCache.Find("Stick").get_node(\"TODO_Transform\")  # TODO: GetComponent
  _baseTransform = TransformCache.Find("Base").get_node(\"TODO_Transform\")  # TODO: GetComponent
  _stickGameObject = _stickTransform.self
  _baseGameObject = _baseTransform.self
  if IsHiddenIfNotTweaking:
    _baseGameObject.self.SetActive(false)
    _stickGameObject.self.SetActive(false)
  else:
    _baseGameObject.self.SetActive(true)
    _stickGameObject.self.SetActive(true)

func ResetControlState():
  ResetControlState()
  var stickTransform := this._stickTransform
  var zero := Vector3.zero
  _baseTransform.localPosition = zero
  stickTransform.localPosition = zero

func OnFingerLifted():
  OnFingerLifted()
  if not IsHiddenIfNotTweaking:
    return
  _baseGameObject.self.SetActive(false)
  _stickGameObject.self.SetActive(false)

func OnFingerTouched():
  OnFingerTouched()
  if not IsHiddenIfNotTweaking:
    return
  _baseGameObject.self.SetActive(true)
  _stickGameObject.self.SetActive(true)

func _process(_delta):
  if TweakIfNeeded():
    return
  var touch: Variant
  if IsTouchCaptured(out touch):
    PlaceJoystickBaseUnderTheFinger(touch)

func TweakControl(touchPosition: Variant):
  var vector := base.ParentCamera.ScreenToWorldPoint(touchPosition)
  var vector2 := vector - this._baseTransform.position
  if vector2.sqrMagnitude > DragRadius * DragRadius:
    vector2.Normalize()
    _stickTransform.position = _baseTransform.position + vector2 * DragRadius
  else:
    _stickTransform.position = vector
  CurrentAxisValues = vector2
  OnControllerMoved(vector2)

func PlaceJoystickBaseUnderTheFinger(touch: Variant):
  if not _snapsToFinger:
    return
  var stickTransform := this._stickTransform
  var position := base.ParentCamera.ScreenToWorldPoint(touch.position)
  _baseTransform.position = position
  stickTransform.position = position

var _dragRadius := 1.5

var _snapsToFinger := true

var _isHiddenIfNotTweaking: bool

var _stickTransform: Node3D

var _baseTransform: Node3D

var _stickGameObject: Node3D

var _baseGameObject: Node3D
