# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/vevarBrunnLjud.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name vevarBrunnLjud
extends Node  # TODO: was MonoBehaviour
  func _ready():
    audioSource = get_node(\"TODO_AudioSource\")  # TODO: GetComponent

  func _process(_delta):
    if PlayerVevar:
      if not soundPlaying:
        soundPlaying = true
        audioSource.clip = vevLjud
        audioSource.Play()
    elif (!this.PlayerVevar:
      audioSource.Stop()
      soundPlaying = false

  func vevar():
    if not PlayerVevar:
      PlayerVevar = true
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = vevLjud
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()

  func vevarInte():
    if PlayerVevar:
      PlayerVevar = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()

  var audioSource: Variant

  var vevLjud: Variant

  var PlayerVevar: bool

  var soundPlaying: bool
