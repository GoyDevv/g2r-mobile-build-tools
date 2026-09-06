# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/AnimationDebug.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name AnimationDebug
extends Node  # TODO: was MonoBehaviour
  func _ready():
    character = (CharacterController)GetComponent(typeof(CharacterController))
    animationController = (AnimationController)GetComponent(typeof(AnimationController))
    if not Application.isEditor:
      Object.queue_free  # TODO: Destroy(this)

  func OnGUI():
    GUI.skin.font = null
    var num := 0.0
    var animationState := null
    var enumerator := this.animationController.animationTarget.GetEnumerator()
    try {
    while enumerator.MoveNext():
      var obj := enumerator.Current
      var animationState2 := (AnimationState)obj
      if animationState2.weight > num:
        num = animationState2.weight
        animationState = animationState2
  finally {
  var disposable: Variant
  if (disposable = (enumerator as IDisposable)) != null:
    disposable.Dispose()
var velocity := this.character.velocity
var vector := velocity
vector.y = 0.0
var magnitude := vector.magnitude
if animationState:
  GUI.Label(new Rect(10.0, 70.0, 400.0, 60.0), string.Format("Vel: {5}  Speed: {0:0.000}\nAnimation: {1}\n  * weight {2:0.00}  speed {3:0.00} time {4:0.00}", new object[] {
  magnitude,
  animationState.name,
  animationState.weight,
  animationState.speed,
  animationState.normalizedTime,
  velocity

var animationController: Variant

var character: Variant
