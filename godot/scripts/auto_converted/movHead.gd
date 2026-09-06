# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/movHead.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name movHead
extends Node  # TODO: was MonoBehaviour
  func _ready():
    head.get_node(\"TODO_Image\")  # TODO: GetComponent.sprite = headR
    yield return new WaitForSeconds(10.0)
    head.get_node(\"TODO_Image\")  # TODO: GetComponent.sprite = headL
    yield return new WaitForSeconds(10.0)
    head.get_node(\"TODO_Image\")  # TODO: GetComponent.sprite = headR
    headMove = true
    var break: Variant

  func _process(_delta):
    if headMove:
      headMove = false
      StartCoroutine(moveHead())

  func moveHead():
    yield return new WaitForSeconds(10.0)
    head.get_node(\"TODO_Image\")  # TODO: GetComponent.sprite = headL
    yield return new WaitForSeconds(10.0)
    head.get_node(\"TODO_Image\")  # TODO: GetComponent.sprite = headR
    headMove = true
    var break: Variant

  var headR: Variant

  var headL: Variant

  var head: Variant

  var headMove: bool
