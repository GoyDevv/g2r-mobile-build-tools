# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/plaskLjudTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name plaskLjudTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "Player"  and  not ljudSpelats:
      ljudSpelats = true
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plaskljud)
      StartCoroutine(ljudlength())

  func ljudlength():
    yield return new WaitForSeconds(1.0)
    ljudSpelats = false
    self.SetActive(false)
    var break: Variant

  var ljudSpelats: bool

  var plaskljud: Variant
