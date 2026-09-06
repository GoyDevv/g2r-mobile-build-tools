# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CheckingGDPRoption.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CheckingGDPRoption
extends Node  # TODO: was MonoBehaviour
  func AcceptGdprButton():
    //MetaData metaData = new MetaData("gdpr")
    //metaData.Set("consent", "true")
    //Advertisement.SetMetaData(metaData)
    GDPRmenu.SetActive(false)
    menuButtons.SetActive(true)
    PlayerPrefs.SetInt("GDPRoption", 1)

  func RejectGdprButton():
    //MetaData metaData = new MetaData("gdpr")
    //metaData.Set("consent", "false")
    //Advertisement.SetMetaData(metaData)
    GDPRmenu.SetActive(false)
    menuButtons.SetActive(true)
    PlayerPrefs.SetInt("GDPRoption", 1)

  var GDPRmenu: Node3D

  var menuButtons: Node3D
