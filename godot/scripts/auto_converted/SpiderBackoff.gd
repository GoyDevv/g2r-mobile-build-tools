# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/SpiderBackoff.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name SpiderBackoff
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Spider":
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).spiderResetNow = false
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).spiderBackoff = true
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).foodTime = false
      ((spiderControll)Spider.GetComponent(typeof(spiderControll))).idle()
      self.SetActive(false)

  var Spider: Node3D
