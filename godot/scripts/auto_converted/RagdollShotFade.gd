# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/RagdollShotFade.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name RagdollShotFade
extends Node  # TODO: was MonoBehaviour
  func _init():
    ragdollFade = true
    timerCount = 5.0
    checkFadeEarly = true

  func _ready():
    gameController = GameObject.Find("GameController")
    shader2 = Shader.Find("Legacy Shaders/Transparent/VertexLit")
    if PlayerPrefs.GetInt("DiffData") == 3:
      yield return new WaitForSeconds(15.0)
    else:
      yield return new WaitForSeconds(fadeStartTime)
    ragdollFade = true
    var break: Variant

  func _process(_delta):
    if ((grannyRestart)gameController.GetComponent(typeof(grannyRestart))).playerFallDead:
      ragdollFade = true
    if ragdollFade:
      timerCount -= Time.deltaTime
      Bat.SetActive(false)
      Eyes.SetActive(false)
      Tand.SetActive(false)
      leg1Texture.SetActive(false)
      leg2Texture.SetActive(false)
      rend.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.shader = shader2
      var a := this.ragdollTexture.GetComponent<Renderer>().material.color.a - 0.2 * Time.deltaTime
      var color := this.ragdollTexture.GetComponent<Renderer>().material.color
      color.a = a
      ragdollTexture.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = color
      var a2 := this.Hair.GetComponent<Renderer>().material.color.a - 0.2 * Time.deltaTime
      var color2 := this.Hair.GetComponent<Renderer>().material.color
      color2.a = a2
      Hair.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = color2
    if timerCount < 0.0:
      ragdollFade = false
      ((grannyRestart)gameController.GetComponent(typeof(grannyRestart))).setTime2()
      ((grannyRestart)gameController.GetComponent(typeof(grannyRestart))).startTimer2 = true
      Object.queue_free  # TODO: Destroy(self)

  var gameController: Node3D

  var ragdollFade: bool

  var shader1: Variant

  var shader2: Variant

  var rend: Variant

  var ragdollTexture: Node3D

  var leg1Texture: Node3D

  var leg2Texture: Node3D

  var Hair: Node3D

  var Eyes: Node3D

  var Tand: Node3D

  var Bat: Node3D

  var fadeStartTime: float

  var timerCount: float

  var checkFadeEarly: bool
