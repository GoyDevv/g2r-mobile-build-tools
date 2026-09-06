# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/fadecrickers.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name fadecrickers
extends Node  # TODO: was MonoBehaviour
  func _ready():
    yield return new WaitForSeconds(7.0)
    startFade = true
    var break: Variant

  func _process(_delta):
    if startFade:
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume + 0.2 * Time.deltaTime

  var volume: float

  var startFade: bool
