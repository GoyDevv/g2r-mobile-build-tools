# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/PlayerWindowController.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name PlayerWindowController
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func jumpOut():
    ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).seePlayer = false
    player.SetActive(false)
    camIndoor.SetActive(true)
    holeCollider.SetActive(true)
    window.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("WindowOpenClose")
    camIndoor.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("CamInToOut")
    ((backgroundSound)SoundOut.GetComponent(typeof(backgroundSound))).fadeDown = true
    ((backgroundSound)SoundIn.GetComponent(typeof(backgroundSound))).fadeUp = true
    StartCoroutine(playerSpawnOutside())

  func jumpIn():
    ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).seePlayer = false
    player.SetActive(false)
    camOutdoor.SetActive(true)
    holeCollider.SetActive(true)
    window.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("WindowOpenClose")
    camOutdoor.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("CamOutToIn")
    ((backgroundSound)SoundIn.GetComponent(typeof(backgroundSound))).fadeDown = true
    ((backgroundSound)SoundOut.GetComponent(typeof(backgroundSound))).fadeUp = true
    StartCoroutine(playerSpawnInside())

  func playerSpawnOutside():
    yield return new WaitForSeconds(2.1)
    player.position = PlayerOutPos.position
    player.self  # TODO: was transform.localEulerAngles = Vector3(0.0, -180.0, 0.0)
    player.SetActive(true)
    camIndoor.SetActive(false)
    crouchButton.SetActive(true)
    holeCollider.SetActive(false)
    var break: Variant

  func playerSpawnInside():
    yield return new WaitForSeconds(1.75)
    player.position = PlayerInPos.position
    player.self  # TODO: was transform.localEulerAngles = Vector3(0.0, 0.0, 0.0)
    player.SetActive(true)
    camOutdoor.SetActive(false)
    crouchButton.SetActive(true)
    holeCollider.SetActive(false)
    var break: Variant

  var player: Node3D

  var granny: Node3D

  var window: Node3D

  var camIndoor: Node3D

  var camOutdoor: Node3D

  var PlayerOutPos: Node3D

  var PlayerInPos: Node3D

  var crouchButton: Node3D

  var holeCollider: Node3D

  var SoundOut: Node3D

  var SoundIn: Node3D
