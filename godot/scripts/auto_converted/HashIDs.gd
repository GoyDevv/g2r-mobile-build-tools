# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/HashIDs.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name HashIDs
extends Node  # TODO: was MonoBehaviour
  func _init():
    dyingState = Animator.StringToHash("Base Layer.Dying")
    locomotionState = Animator.StringToHash("Base Layer.Locomotion")
    shoutState = Animator.StringToHash("Shouting.Shout")
    deadBool = Animator.StringToHash("Dead")
    speedFloat = Animator.StringToHash("Speed")
    sneakingBool = Animator.StringToHash("Sneaking")
    shoutingBool = Animator.StringToHash("Shouting")
    playerInSightBool = Animator.StringToHash("PlayerInSight")
    shotFloat = Animator.StringToHash("Shot")
    aimWeightFloat = Animator.StringToHash("AimWeight")
    angularSpeedFloat = Animator.StringToHash("AngularSpeed")
    openBool = Animator.StringToHash("Open")

  var dyingState: int

  var locomotionState: int

  var shoutState: int

  var deadBool: int

  var speedFloat: int

  var sneakingBool: int

  var shoutingBool: int

  var playerInSightBool: int

  var shotFloat: int

  var aimWeightFloat: int

  var angularSpeedFloat: int

  var openBool: int
