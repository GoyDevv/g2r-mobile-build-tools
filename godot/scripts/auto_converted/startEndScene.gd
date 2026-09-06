# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/startEndScene.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name startEndScene
extends Node  # TODO: was MonoBehaviour
  func _ready():
    if PlayerPrefs.GetInt("teddyInPlace") == 1:
      StartCoroutine(startTheEnd2())
    else:
      StartCoroutine(startTheEnd1())

  func _process(_delta):
    if fog:
      RenderSettings.fogEndDistance -= Time.deltaTime * 9.0
      if RenderSettings.fogEndDistance <= 0.0:
        fog = false
        RenderSettings.fogEndDistance = 0.0
    if slendrinaFade:
      var a := this.slendrinaTexture.GetComponent<Renderer>().material.color.a - 0.3 * Time.deltaTime * this.fadeSpeed
      var color := this.slendrinaTexture.GetComponent<Renderer>().material.color
      color.a = a
      slendrinaTexture.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = color

  func startTheEnd1():
    if PlayerPrefs.GetInt("DiffData") == 4:
      granny1.SetActive(false)
      granny3Home.SetActive(true)
      theEndText2.SetActive(true)
    else:
      granny1.SetActive(true)
      theEndText1.SetActive(true)
    cam1.SetActive(true)
    granny2.SetActive(false)
    cam2.SetActive(false)
    blackScreen.CrossFadeAlpha(0.0, 3.0, false)
    yield return new WaitForSeconds(7.0)
    if PlayerPrefs.GetInt("DiffData") != 4:
      fog = true
    yield return new WaitForSeconds(2.0)
    if PlayerPrefs.GetInt("DiffData") != 4:
      granny1Anim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("GrannyMoveCamera")
      grannyAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("idle")
    yield return new WaitForSeconds(1.0)
    if PlayerPrefs.GetInt("DiffData") != 4:
      soundEffects.SetActive(true)
    if PlayerPrefs.GetInt("DiffData") == 4:
      yield return new WaitForSeconds(6.0)
    fadeBlackSpeed = 0.6
    blackScreen.CrossFadeAlpha(1.0, 3.0, false)
    yield return new WaitForSeconds(7.0)
    if PlayerPrefs.GetInt("ADSon") == 0:
      //			if (Advertisement.IsReady())
      //			{
      //				AdManager.Instance.ShowRegularAds(new Action<ShowResult>(OnAdClosed))
      //			}
      //			else {
      readyToMainMenu()
  elif (PlayerPrefs.GetInt("ADSon") == 1:
    readyToMainMenu()
  var break: Variant

func startTheEnd2():
  if PlayerPrefs.GetInt("DiffData") == 4:
    granny2.SetActive(true)
    GrannyGoneTeddy.SetActive(true)
    granny2Gone.SetActive(false)
    teddy.SetActive(false)
    granny3Home.SetActive(true)
    theEndText2.SetActive(true)
  else:
    granny2.SetActive(true)
    theEndText1.SetActive(true)
    GrannyGoneTeddy.SetActive(false)
    teddy.SetActive(true)
  cam2.SetActive(true)
  granny1.SetActive(false)
  cam1.SetActive(false)
  blackScreen.CrossFadeAlpha(0.0, 3.0, false)
  yield return new WaitForSeconds(7.0)
  slendrinaFade = true
  if PlayerPrefs.GetInt("DiffData") != 4:
    fog = true
  yield return new WaitForSeconds(3.0)
  PlayerPrefs.SetInt("teddyInPlace", 0)
  fadeBlackSpeed = 0.6
  if PlayerPrefs.GetInt("DiffData") == 4:
    yield return new WaitForSeconds(6.0)
  blackScreen.CrossFadeAlpha(1.0, 3.0, false)
  yield return new WaitForSeconds(7.0)
  if PlayerPrefs.GetInt("ADSon") == 0:
    //			if (Advertisement.IsReady())
    //			{
    //				AdManager.Instance.ShowRegularAds(new Action<ShowResult>(OnAdClosed))
    //			}
    //			else {
    readyToMainMenu()
elif (PlayerPrefs.GetInt("ADSon") == 1:
  readyToMainMenu()
var break: Variant

//	private void OnAdClosed(ShowResult result)
//	{
//		readyToMainMenu()
//	}

func readyToMainMenu():
  Time.timeScale = 1.0
  SceneManager.LoadScene("Menu")

var fadeBlackSpeed: float

var blackScreen: Variant

var fogEndDistance: float

var fog: bool

var granny1: Node3D

var granny1Anim: Node3D

var granny2: Node3D

var granny2Gone: Node3D

var granny3Home: Node3D

var GrannyGoneTeddy: Node3D

var teddy: Node3D

var cam1: Node3D

var cam2: Node3D

var grannyAnim: Node3D

var soundEffects: Node3D

var slendrinaTexture: Node3D

var fadeSpeed: float

var slendrinaFade: bool

var theEndText1: Node3D

var theEndText2: Node3D
