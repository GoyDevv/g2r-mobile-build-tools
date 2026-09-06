# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/resetSpider.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name resetSpider
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Spider":
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).spiderInNest = true
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).spiderRunToNest = false
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).foodTime = false
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).idle()
      SpiderTrigger1.SetActive(true)
      SpiderTrigger2.SetActive(false)
      spiderbackOfPoint.SetActive(false)

  var Spider: Node3D

  var SpiderTrigger1: Node3D

  var SpiderTrigger2: Node3D

  var spiderbackOfPoint: Node3D
