# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/shootSpiderButton.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name shootSpiderButton
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func closeSpiderlucka():
    if not buttonShot:
      if not ((spiderControll)spider.GetComponent(typeof(spiderControll))).spiderInNest:
        if not ((spiderControll)spider.GetComponent(typeof(spiderControll))).SpiderBitePlayer:
          buttonShot = true
          luckaAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SpiderLuckaClose")
          luckaAnim.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(luckaFaller)
          spiderNestpos.self  # TODO: was transform.localPosition = Vector3(20.28, 91.04, -17.06)
          spiderStartpos.self  # TODO: was transform.localPosition = Vector3(22.68, 90.5774, -9.64)
          ((spiderControll)spider.GetComponent(typeof(spiderControll))).huntPlayer = true
          ((spiderControll)spider.GetComponent(typeof(spiderControll))).foodTime = false
          spiderTrigger1.SetActive(false)
          spiderTrigger2.SetActive(false)
      else:
        buttonShot = true
        luckaAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SpiderLuckaClose")
        luckaAnim.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(luckaFaller)
        spider.SetActive(false)
        spiderTrigger1.SetActive(false)
        spiderTrigger2.SetActive(false)
        leaveTrigger.SetActive(false)
        foodPos.SetActive(false)
        spiderNestpos.SetActive(false)
        shootbutton.SetActive(false)

  func OnTriggerEnter(other: Variant):
    if not buttonShot  and  other.gameObject.tag == "arrow":
      if not ((spiderControll)spider.GetComponent(typeof(spiderControll))).spiderInNest:
        if not ((spiderControll)spider.GetComponent(typeof(spiderControll))).SpiderBitePlayer:
          buttonShot = true
          luckaAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SpiderLuckaClose")
          luckaAnim.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(luckaFaller)
          spiderNestpos.self  # TODO: was transform.localPosition = Vector3(20.28, 91.04, -17.06)
          spiderStartpos.self  # TODO: was transform.localPosition = Vector3(22.68, 90.5774, -9.64)
          ((spiderControll)spider.GetComponent(typeof(spiderControll))).huntPlayer = true
          ((spiderControll)spider.GetComponent(typeof(spiderControll))).foodTime = false
          spiderTrigger1.SetActive(false)
          spiderTrigger2.SetActive(false)
          leaveTrigger.SetActive(false)
      else:
        buttonShot = true
        luckaAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SpiderLuckaClose")
        luckaAnim.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(luckaFaller)
        spider.SetActive(false)
        spiderTrigger1.SetActive(false)
        spiderTrigger2.SetActive(false)
        leaveTrigger.SetActive(false)
        foodPos.SetActive(false)
        spiderNestpos.SetActive(false)
        shootbutton.SetActive(false)

  var buttonShot: bool

  var luckaAnim: Node3D

  var spider: Node3D

  var spiderTrigger1: Node3D

  var spiderTrigger2: Node3D

  var leaveTrigger: Node3D

  var shootbutton: Node3D

  var foodPos: Node3D

  var spiderNestpos: Node3D

  var spiderStartpos: Node3D

  var luckaFaller: Variant
