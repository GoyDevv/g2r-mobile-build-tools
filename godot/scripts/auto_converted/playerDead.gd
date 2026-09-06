# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/playerDead.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name playerDead
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func startEndScene():
    if GameObject.Find("GrannyRagdoll(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("GrannyRagdoll(Clone)"))
    endSceneRunning = true
    playerInBed.SetActive(false)
    bloodscreenEnd.SetActive(true)
    soundHolder.SetActive(true)
    cam1.SetActive(true)
    cellarDoor.SetActive(false)
    granny.SetActive(false)
    granny.position = GrannyEndPos.position
    granny.quaternion  # TODO: Unity->Godot rotation = GrannyEndPos.rotation
    granny.SetActive(true)
    musicHolder.SetActive(false)
    blackScreenTexture.CrossFadeAlpha(0.0, 2.0, false)
    yield return new WaitForSeconds(0.9)
    ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerHit()
    yield return new WaitForSeconds(4.0)
    blackScreenTexture.CrossFadeAlpha(1.0, 0.5, false)
    yield return new WaitForSeconds(2.0)
    player.SetActive(false)
    cam1.SetActive(false)
    cam2.SetActive(true)
    yield return new WaitForSeconds(1.0)
    blackScreenTexture.CrossFadeAlpha(0.0, 3.5, false)
    yield return new WaitForSeconds(3.2)
    yield return new WaitForSeconds(4.1)
    grannyOverPlayer.SetActive(true)
    grannyOverPlayerAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent["GrannyEnd"].speed = 3.0
    yield return new WaitForSeconds(0.7)
    blackScreenTexture.CrossFadeAlpha(1.0, 0.2, false)
    yield return new WaitForSeconds(3.0)
    gameOverText.SetActive(true)
    yield return new WaitForSeconds(4.0)
    gameOverTexture.CrossFadeAlpha(0.0, 2.2, false)
    yield return new WaitForSeconds(3.0)
    ((FetchAds)gameController.GetComponent(typeof(FetchAds))).toMainMenu()
    var break: Variant

  func startEndScene2():
    if GameObject.Find("GrannyRagdoll(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("GrannyRagdoll(Clone)"))
    endSceneRunning2 = true
    playerInBed.SetActive(false)
    bloodscreenEnd.SetActive(true)
    BGnoiceHolder.SetActive(false)
    endScene2.SetActive(true)
    cellarDoor.SetActive(false)
    granny.SetActive(false)
    musicHolder.SetActive(false)
    blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
    yield return new WaitForSeconds(9.5)
    grannyAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("GrannyLooking")
    yield return new WaitForSeconds(2.1)
    giljoSoundHolder.SetActive(true)
    giljoAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("giljotinOn")
    grannyAnimHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("GrannyPullGiljotin")
    yield return new WaitForSeconds(0.9)
    blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
    yield return new WaitForSeconds(3.0)
    gameOverText.SetActive(true)
    yield return new WaitForSeconds(4.0)
    gameOverTexture.CrossFadeAlpha(0.0, 2.2, false)
    yield return new WaitForSeconds(3.0)
    ((FetchAds)gameController.GetComponent(typeof(FetchAds))).toMainMenu()
    var break: Variant

  func startEndScene3():
    Car.SetActive(false)
    Car.position = CarStartPos.position
    Car.SetActive(true)
    if GameObject.Find("GrannyRagdoll(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("GrannyRagdoll(Clone)"))
    endSceneRunning3 = true
    playerInBed.SetActive(false)
    bloodscreenEnd.SetActive(true)
    PlayerendScene3.SetActive(true)
    cellarDoor.SetActive(false)
    granny.SetActive(false)
    carSensors.SetActive(false)
    if GameObject.Find("CarBumper"):
      carBumper.SetActive(false)
    if GameObject.Find("MotorhuvCar"):
      Motorhuv.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("motorhuvClose")
    carEngineStart.SetActive(true)
    carEngineSound.SetActive(true)
    blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
    yield return new WaitForSeconds(7.5)
    grannyInCar.SetActive(true)
    yield return new WaitForSeconds(7.0)
    Car.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("CarReverse")
    carReverseSound.SetActive(true)
    yield return new WaitForSeconds(5.0)
    carForwardSound.SetActive(true)
    yield return new WaitForSeconds(0.3)
    Car.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("CarForward")
    yield return new WaitForSeconds(0.7)
    blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
    carCrashSound.SetActive(true)
    yield return new WaitForSeconds(3.0)
    grannyLaughSound.SetActive(true)
    gameOverText.SetActive(true)
    yield return new WaitForSeconds(4.0)
    gameOverTexture.CrossFadeAlpha(0.0, 2.2, false)
    yield return new WaitForSeconds(3.0)
    ((FetchAds)gameController.GetComponent(typeof(FetchAds))).toMainMenu()
    var break: Variant

  func gameOverNoGranny():
    gameOverText.SetActive(true)
    yield return new WaitForSeconds(4.0)
    gameOverTexture.CrossFadeAlpha(0.0, 2.2, false)
    yield return new WaitForSeconds(3.0)
    ((FetchAds)gameController.GetComponent(typeof(FetchAds))).toMainMenu()
    var break: Variant

  var blackScreenTexture: Variant

  var fadeBlackSpeed: float

  var cam1: Node3D

  var cam2: Node3D

  var endScene2: Node3D

  var PlayerendScene3: Node3D

  var player: Node3D

  var granny: Node3D

  var grannyOverPlayer: Node3D

  var grannyOverPlayerAnim: Node3D

  var GrannyEndPos: Node3D

  var cellarDoor: Node3D

  var gameController: Node3D

  var bloodscreenEnd: Node3D

  var gameOverText: Node3D

  var gameOverTexture: Variant

  var soundHolder: Node3D

  var musicHolder: Node3D

  var BGnoiceHolder: Node3D

  var carEngineSound: Node3D

  var carEngineStart: Node3D

  var carCrashSound: Node3D

  var grannyLaughSound: Node3D

  var playerInBed: Node3D

  var endSceneRunning: bool

  var endSceneRunning2: bool

  var endSceneRunning3: bool

  var giljoAnimHolder: Node3D

  var giljoSoundHolder: Node3D

  var grannyAnimHolder: Node3D

  var grannyInCar: Node3D

  var Motorhuv: Node3D

  var Car: Node3D

  var carReverseSound: Node3D

  var carForwardSound: Node3D

  var carSensors: Node3D

  var carBumper: Node3D

  var CarStartPos: Node3D
