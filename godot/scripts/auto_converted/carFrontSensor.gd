# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/carFrontSensor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name carFrontSensor
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    if textTimerOnOff:
      textTimer += Time.deltaTime
      if textTimer > 3.0:
        textTimerOnOff = false
        textTimer = 0.0
        shouldOpenDoorFirstText.SetActive(false)

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "car":
      ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).reverseOK = true
      ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).forwardOK = false
      ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).carMoving = false
      if garagedoorOpen:
        if hitGaragedoorCounter == 1.0:
          brickWallStart.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.mainTexture = brokenTextureMax
          hitGaragedoorCounter += 1.0
          dust2.SetActive(true)
          headAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HeadForward")
          carForwardSound.SetActive(false)
          engineOnSound.SetActive(true)
          crashSound.SetActive(true)
          CarHitTriggers.SetActive(false)
          yield return new WaitForSeconds(1.0)
          forwardButton.SetActive(false)
          ReverseButton.SetActive(true)
          optionButton.SetActive(true)
          outOffCarButton.SetActive(true)
          carForwardSound.SetActive(false)
          engineOnSound.SetActive(true)
          crashSound.SetActive(true)
        elif (this.hitGaragedoorCounter == 2f:
          brickWallStart.SetActive(false)
          brickWallBroken.SetActive(true)
          camInCar.SetActive(false)
          granny.SetActive(false)
          if PlayerPrefs.GetInt("DiffData") == 4:
            escapeCamNoGranny.SetActive(true)
            RenderSettings.fog = false
            optionButton.SetActive(false)
            if GameObject.Find("GrannyRagdoll(Clone)"):
              Object.queue_free  # TODO: Destroy(GameObject.Find("GrannyRagdoll(Clone)"))
          else:
            escapeCam.SetActive(true)
            RenderSettings.fog = false
            optionButton.SetActive(false)
            if GameObject.Find("GrannyRagdoll(Clone)"):
              Object.queue_free  # TODO: Destroy(GameObject.Find("GrannyRagdoll(Clone)"))
          crashSound.SetActive(true)
          CarHitTriggers.SetActive(false)
        else:
          hitGaragedoorCounter += 1.0
          brickWallStart.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.mainTexture = brokenTextureMin
          dust1.SetActive(true)
          headAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HeadForward")
          carForwardSound.SetActive(false)
          engineOnSound.SetActive(true)
          crashSound.SetActive(true)
          CarHitTriggers.SetActive(false)
          yield return new WaitForSeconds(1.0)
          forwardButton.SetActive(false)
          ReverseButton.SetActive(true)
          outOffCarButton.SetActive(true)
          optionButton.SetActive(true)
      else:
        headAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HeadForward")
        carForwardSound.SetActive(false)
        engineOnSound.SetActive(true)
        crashSoundPort.SetActive(true)
        CarHitTriggers.SetActive(false)
        yield return new WaitForSeconds(1.0)
        forwardButton.SetActive(false)
        ReverseButton.SetActive(true)
        outOffCarButton.SetActive(true)
        optionButton.SetActive(true)
        if not textShown:
          textShown = true
          textTimer = 0.0
          shouldOpenDoorFirstText.SetActive(true)
          textTimerOnOff = true
    var break: Variant

  var gameController: Node3D

  var forwardButton: Node3D

  var ReverseButton: Node3D

  var outOffCarButton: Node3D

  var garagedoorOpen: bool

  var hitGaragedoorCounter: float

  var brickWallStart: Node3D

  var brickWallBroken: Node3D

  var brokenTextureMin: Variant

  var brokenTextureMax: Variant

  var camInCar: Node3D

  var escapeCam: Node3D

  var escapeCamNoGranny: Node3D

  var granny: Node3D

  var dust1: Node3D

  var dust2: Node3D

  var headAnim: Node3D

  var carForwardSound: Node3D

  var engineOnSound: Node3D

  var crashSound: Node3D

  var crashSoundPort: Node3D

  var CarHitTriggers: Node3D

  var shouldOpenDoorFirstText: Node3D

  var optionButton: Node3D

  var textTimerOnOff: bool

  var textTimer: float

  var textShown: bool
