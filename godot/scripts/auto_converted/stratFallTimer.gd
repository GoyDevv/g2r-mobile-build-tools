# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/stratFallTimer.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name stratFallTimer
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).fallTimerStarted = true
      ((backgroundSound)Sound1.GetComponent(typeof(backgroundSound))).fadeDown = true
      ((backgroundSound)Sound2.GetComponent(typeof(backgroundSound))).fadeUp = true

  var player: Node3D

  var Sound1: Node3D

  var Sound2: Node3D
