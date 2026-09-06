# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/sprayPepper.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name sprayPepper
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))
    sprayTime = false

  func TaskOnClick():
    if ((checkSprayCounter)checkSpray.GetComponent(typeof(checkSprayCounter))).sprayCounter > 0.0:
      if not sprayTime:
        spray.SetActive(true)
        sprayTime = true
        soundHolder.SetActive(true)
        ((checkSprayCounter)checkSpray.GetComponent(typeof(checkSprayCounter))).sprayCounter -= 1.0
        StartCoroutine(time())
    else:
      ((checkSprayCounter)checkSpray.GetComponent(typeof(checkSprayCounter))).checkingSpray()

  func time():
    yield return new WaitForSeconds(1.0)
    spray.SetActive(false)
    sprayTime = false
    soundHolder.SetActive(false)
    var break: Variant

  var spray: Node3D

  var soundHolder: Node3D

  var btn1: Variant

  var sprayTime: bool

  var checkSpray: Node3D
