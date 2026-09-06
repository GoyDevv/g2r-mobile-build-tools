# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ControlMenu.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ControlMenu
extends Node  # TODO: was MonoBehaviour
  func _init():
    selection = -1

  func _ready():
    launchIntro.SetActive(false)
    orbEmitter.get_node(\"TODO_Renderer\")  # TODO: GetComponent.enabled = false

  func _process(_delta):
    #if UNITY_EDITOR
    if not display  and  selection == -1  and  InputHelper.GetTouches().Count > 0:
      for i in range(int(InputHelper.GetTouches().Count)):
        var touch := InputHelper.GetTouches()[i]
        if touch.phase == TouchPhase.Began  and  base.GetComponent<GUITexture>().HitTest(touch.position):
          display = true
          displayBackground = false
          get_node(\"TODO_GUITexture\")  # TODO: GetComponent.enabled = false

    #else
    if not display  and  selection == -1  and  UnityEngine.Input.touchCount > 0:
      for i in range(int(UnityEngine.Input.touchCount)):
        var touch := UnityEngine.Input.GetTouch(i)
        if touch.phase == TouchPhase.Began  and  base.GetComponent<GUITexture>().HitTest(touch.position):
          display = true
          displayBackground = false
          get_node(\"TODO_GUITexture\")  # TODO: GetComponent.enabled = false
    #endif

  func OnGUI():
    GUI.skin.font = font
    if displayBackground:
      GUI.DrawTexture(new Rect(0.0, 0.0, Screen.width, Screen.height), background, ScaleMode.StretchToFill, false)
    if display:
      var num := -1
      var num2 := 60
      var num3 := 400
      GUILayout.BeginArea(new Rect(((Screen.width - num3) / 2), ((Screen.height - num2) / 2), num3, num2))
      GUILayout.BeginHorizontal(new GUILayoutOption[0])
      for i in range(int(this.controllers.Length)):
        if (GUILayout.Button(controllers[i].label, new GUILayoutOption[] {
        GUILayout.MinHeight(num2)
      num = i
  if num >= 0:
    selection = num
    get_node(\"TODO_GUITexture\")  # TODO: GetComponent.enabled = false
    display = false
    displayBackground = false
    StartCoroutine(ChangeControls())
  GUILayout.EndHorizontal()
  GUILayout.EndArea()

func WaitUntilObjectDestroyed(o: Variant):
  while o != null:
    yield return new WaitForFixedUpdate()
  var break: Variant

func ChangeControls():
  for transform in this.destroyOnLoad:
    Object.queue_free  # TODO: Destroy(self  # TODO: was transform.self)
  launchIntro.SetActive(true)
  yield return StartCoroutine(WaitUntilObjectDestroyed(launchIntro))
  displayBackground = true
  orbEmitter.get_node(\"TODO_Renderer\")  # TODO: GetComponent.enabled = true
  SceneManager.LoadScene(controllers[selection].controlScene)
  Object.queue_free  # TODO: Destroy(self, 1.0)
  var break: Variant

var background: Variant

var display: bool

var font: Variant

public ControllerScene[] controllers

public Transform[] destroyOnLoad

var launchIntro: Node3D

var orbEmitter: Node3D

var selection: int

var displayBackground: bool
