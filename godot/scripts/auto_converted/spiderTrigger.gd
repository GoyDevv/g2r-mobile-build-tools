# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/spiderTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name spiderTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not ((spiderControll)Spider.GetComponent(typeof(spiderControll))).SpiderBitePlayer:
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).huntPlayer = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player"  and  not ((spiderControll)Spider.GetComponent(typeof(spiderControll))).SpiderBitePlayer  and  not ((spiderControll)Spider.GetComponent(typeof(spiderControll))).spiderInNest:
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).huntPlayer = false
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).spiderResetNow = true
      spiderbackOfPoint.SetActive(true)

  var Spider: Node3D

  var spiderbackOfPoint: Node3D
