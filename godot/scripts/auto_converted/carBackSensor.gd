# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/carBackSensor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name carBackSensor
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "car":
      ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).reverseOK = false
      ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).forwardOK = true
      ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).carMoving = false
      headAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HeadBackward")
      forwardButton.SetActive(true)
      ReverseButton.SetActive(false)
      outOffCarButton.SetActive(true)
      optionButton.SetActive(true)
      carReverseSound1.SetActive(false)
      engineOnSound.SetActive(true)
      crashSound.SetActive(true)
      CarHitTriggers.SetActive(false)
      if not bakluckaLoss:
        bakluckaLoss = true
        baklucka.self  # TODO: was transform.parent = null
        ((Rigidbody)baklucka.self.GetComponent(typeof(Rigidbody))).isKinematic = false
        baklucka.self.tag = "Untagged"
        yield return new WaitForSeconds(8.0)
        Object.queue_free  # TODO: Destroy(baklucka)
    var break: Variant

  var gameController: Node3D

  var forwardButton: Node3D

  var ReverseButton: Node3D

  var baklucka: Node3D

  var bakluckaLoss: bool

  var outOffCarButton: Node3D

  var headAnim: Node3D

  var carReverseSound1: Node3D

  var engineOnSound: Node3D

  var crashSound: Node3D

  var CarHitTriggers: Node3D

  var optionButton: Node3D
