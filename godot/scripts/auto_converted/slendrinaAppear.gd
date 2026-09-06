# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/slendrinaAppear.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name slendrinaAppear
extends Node  # TODO: was MonoBehaviour
  func _ready():
    SlendrinaAppear = true
    yield return new WaitForSeconds(5.0)
    fadeUpDown = true
    yield return new WaitForSeconds(4.0)
    fadeUpDown = false
    yield return new WaitForSeconds(5.0)
    fadeUpDown = true
    yield return new WaitForSeconds(3.0)
    particleSys.get_node(\"TODO_ParticleSystem\")  # TODO: GetComponent.enableEmission = false
    particleSys.get_node(\"TODO_ParticleSystem\")  # TODO: GetComponent.Stop()
    yield return new WaitForSeconds(4.0)
    Object.queue_free  # TODO: Destroy(self)
    var break: Variant

  func _process(_delta):
    if SlendrinaAppear:
      if not fadeUpDown:
        var a := this.slendrinaTexture.GetComponent<Renderer>().material.color.a + 0.01 * Time.deltaTime * this.fadeSpeed
        var color := this.slendrinaTexture.GetComponent<Renderer>().material.color
        color.a = a
        slendrinaTexture.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = color
        var a2 := this.slendrinaHairTexture.GetComponent<Renderer>().material.color.a + 0.01 * Time.deltaTime * this.fadeSpeed
        var color2 := this.slendrinaHairTexture.GetComponent<Renderer>().material.color
        color2.a = a2
        slendrinaHairTexture.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = color2
      if fadeUpDown:
        var a3 := this.slendrinaTexture.GetComponent<Renderer>().material.color.a - 0.01 * Time.deltaTime * this.fadeSpeed
        var color3 := this.slendrinaTexture.GetComponent<Renderer>().material.color
        color3.a = a3
        slendrinaTexture.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = color3
        var a4 := this.slendrinaHairTexture.GetComponent<Renderer>().material.color.a - 0.01 * Time.deltaTime * this.fadeSpeed
        var color4 := this.slendrinaHairTexture.GetComponent<Renderer>().material.color
        color4.a = a4
        slendrinaHairTexture.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = color4

  var SlendrinaAppear: bool

  var fadeUpDown: bool

  var fadeSpeed: float

  var slendrinaTexture: Node3D

  var slendrinaHairTexture: Node3D

  var particleSys: Node3D
