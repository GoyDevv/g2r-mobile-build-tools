# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ratBite.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ratBite
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player":
      playerAnim.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("playerHurt")
      ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerStuck()
      Object.Instantiate<GameObject>(noiseobject, noiseDropPoint.position, noiseDropPoint.rotation)
      ((ratController)ratController.GetComponent(typeof(ratController))).Waittimer = 100.0
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ratNoise)
    elif (other.gameObject.tag == "arrow":
      ((ratController)ratController.GetComponent(typeof(ratController))).Waittimer = 100.0
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ratNoise2)
    elif (other.gameObject.tag == "granny":
      ((ratController)ratController.GetComponent(typeof(ratController))).Waittimer = 100.0
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(ratNoise2)

  var playerAnim: Node3D

  var noiseobject: Node3D

  var noiseDropPoint: Node3D

  var gameController: Node3D

  var ratController: Node3D

  var ratNoise: Variant

  var ratNoise2: Variant
