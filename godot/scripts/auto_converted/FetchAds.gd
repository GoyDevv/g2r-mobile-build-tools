# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FetchAds.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FetchAds
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func toMainMenu():
    Time.timeScale = 1.0
    blackScreen.SetActive(true)
    optionMenu.SetActive(false)
    granny.SetActive(false)
    if PlayerPrefs.GetInt("ADSon") == 0:
      //			if (Advertisement.IsReady())
      //			{
      //				AdManager.Instance.ShowRegularAds(new Action<ShowResult>(OnAdClosed))
      //			}
      //			else {
      readyToMainMenu()
  elif (PlayerPrefs.GetInt("ADSon") == 1:
    readyToMainMenu()

//	private void OnAdClosed(ShowResult result)
//	{
//		readyToMainMenu()
//	}

func readyToMainMenu():
  Time.timeScale = 1.0
  SceneManager.LoadScene("Menu")

var blackScreen: Node3D

var optionMenu: Node3D

var granny: Node3D
