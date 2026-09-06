# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/fadeText.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name fadeText
extends Node  # TODO: was MonoBehaviour
  func _ready():
    yield return StartCoroutine(Fade(0.0, 1.0, 2.0))
    buttonReady = true
    get_node(\"TODO_GUITexture\")  # TODO: GetComponent.texture = buttonEffect
    helpButton.SetActive(true)
    quitButton.SetActive(true)
    moreGamesButton.SetActive(true)
    yield return new WaitForSeconds(0.05)
    get_node(\"TODO_GUITexture\")  # TODO: GetComponent.texture = playButton
    var break: Variant

  func _process(_delta):

    #if UNITY_EDITOR
    for touch in InputHelper.GetTouches():
      if buttonReady  and  touch.phase == TouchPhase.Ended  and  base.GetComponent<GUITexture>().HitTest(touch.position):
        buttonReady = false
        ((soundEffectsMenu)ljudHolder.GetComponent(typeof(soundEffectsMenu))).buttonClick()
        var a := 0.0
        var color := this.text.color
        color.a = a
        text.color = color
        helpButton.SetActive(false)
        quitButton.SetActive(false)
        moreGamesButton.SetActive(false)
        difficultyMenu.SetActive(true)
        Menu.SetActive(false)

    #else

    #endif
    if scriptReady:
      scriptReady = false
      StartCoroutine(StartFade())

  func StartFade():
    get_node(\"TODO_GUITexture\")  # TODO: GetComponent.texture = playButton
    yield return StartCoroutine(Fade(0.0, 1.0, 2.0))
    buttonReady = true
    get_node(\"TODO_GUITexture\")  # TODO: GetComponent.texture = buttonEffect
    helpButton.SetActive(true)
    quitButton.SetActive(true)
    moreGamesButton.SetActive(true)
    yield return new WaitForSeconds(0.1)
    get_node(\"TODO_GUITexture\")  # TODO: GetComponent.texture = playButton
    var break: Variant

  func Fade(startLevel: float, endLevel: float, duration: float):
    for (float t = 0.0 t < 0.5 t += Time.deltaTime * fadeTextSpeed) {
    var a := Mathf.Lerp(startLevel, endLevel, t)
    var color := this.text.color
    color.a = a
    text.color = color
    yield return null
  var break: Variant

var text: Variant

var fadeTextSpeed: float

var buttonReady: bool

var ljudHolder: Node3D

var difficultyMenu: Node3D

var Menu: Node3D

var helpButton: Node3D

var quitButton: Node3D

var moreGamesButton: Node3D

var buttonEffect: Variant

var playButton: Variant

var scriptReady: bool
