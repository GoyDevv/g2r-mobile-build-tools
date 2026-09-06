# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/UseRemote.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name UseRemote
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func _process(_delta):

  func TaskOnClick():
    if ((remoteLocktrigger)doorLock.GetComponent(typeof(remoteLocktrigger))).playerNearDoorLock:
      if not doorUnlocked:
        doorUnlocked = true
        door.self.tag = "smalldoorClosed"
        doorLockOpen.SetActive(true)
        doorLockClosed.SetActive(false)
        doorLockCollider.SetActive(false)
        lockSound.SetActive(true)
        lamp.material.SetColor("_Color", Color.green)
    elif (!this.doorUnlocked:
      needToGetCloserText.SetActive(true)
      ((remoteTextScript)remoteTextHolder.GetComponent(typeof(remoteTextScript))).textTimer = 0.0
      ((remoteTextScript)remoteTextHolder.GetComponent(typeof(remoteTextScript))).textTimerOnOff = true
    ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).clickRemote()

  var doorLock: Node3D

  var lamp: Variant

  var doorLockCollider: Node3D

  var lockSound: Node3D

  var door: Node3D

  var doorLockOpen: Node3D

  var doorLockClosed: Node3D

  var soundHolder: Node3D

  var needToGetCloserText: Node3D

  var remoteTextHolder: Node3D

  var doorUnlocked: bool

  var btn1: Variant

  var textTimerOnOff: bool

  var textTimer: float
