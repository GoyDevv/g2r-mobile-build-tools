# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/AnimationController.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name AnimationController
extends Node  # TODO: was MonoBehaviour
  func _init():
    maxForwardSpeed = 6.0
    maxBackwardSpeed = 3.0
    maxSidestepSpeed = 4.0
    minUpwardSpeed = 2

  func _ready():
    character = (CharacterController)GetComponent(typeof(CharacterController))
    thisTransform = self  # TODO: was transform
    animationTarget.wrapMode = WrapMode.Loop
    animationTarget["jump"].wrapMode = WrapMode.ClampForever
    animationTarget["jump-land"].wrapMode = WrapMode.ClampForever
    animationTarget["run-land"].wrapMode = WrapMode.ClampForever
    animationTarget["LOSE"].wrapMode = WrapMode.ClampForever

  func OnEndGame():
    enabled = false

  func _process(_delta):
    var velocity := this.character.velocity
    var rhs := velocity
    rhs.y = 0.0
    var magnitude := rhs.magnitude
    var num := Vector3.Dot(this.thisTransform.up, velocity)
    if not character.isGrounded  and  num > (float)minUpwardSpeed:
      jumping = true
    if not animationTarget.IsPlaying("run-land")  or  animationTarget["run-land"].normalizedTime >= 1.0  or  magnitude <= 0.0:
      if animationTarget.IsPlaying("jump-land"):
        if animationTarget["jump-land"].normalizedTime >= 1.0:
          animationTarget.Play("idle")
      elif (this.jumping:
        if character.isGrounded:
          if magnitude > 0.0:
            animationTarget.Play("run-land")
          else:
            animationTarget.Play("jump-land")
          jumping = false
        else:
          animationTarget.Play("jump")
      elif (magnitude > 0f:
        var num2 := Vector3.Dot(this.thisTransform.forward, rhs)
        var num3 := Vector3.Dot(this.thisTransform.right, rhs)
        if Mathf.Abs(num2) > Mathf.Abs(num3):
          if num2 > 0.0:
            var t := Mathf.Clamp(Mathf.Abs(magnitude / this.maxForwardSpeed), 0.0, this.maxForwardSpeed)
            animationTarget["run"].speed = Mathf.Lerp(0.25, 1.0, t)
            if animationTarget.IsPlaying("run-land")  or  animationTarget.IsPlaying("idle"):
              animationTarget.Play("run")
            else:
              animationTarget.CrossFade("run")
          else:
            var t := Mathf.Clamp(Mathf.Abs(magnitude / this.maxBackwardSpeed), 0.0, this.maxBackwardSpeed)
            animationTarget["runback"].speed = Mathf.Lerp(0.25, 1.0, t)
            animationTarget.CrossFade("runback")
        else:
          var t := Mathf.Clamp(Mathf.Abs(magnitude / this.maxSidestepSpeed), 0.0, this.maxSidestepSpeed)
          if num3 > 0.0:
            animationTarget["runright"].speed = Mathf.Lerp(0.25, 1.0, t)
            animationTarget.CrossFade("runright")
          else:
            animationTarget["runleft"].speed = Mathf.Lerp(0.25, 1.0, t)
            animationTarget.CrossFade("runleft")
      else:
        animationTarget.CrossFade("idle")

  var animationTarget: Variant

  var maxForwardSpeed: float

  var maxBackwardSpeed: float

  var maxSidestepSpeed: float

  var character: Variant

  var thisTransform: Node3D

  var jumping: bool

  var minUpwardSpeed: int
