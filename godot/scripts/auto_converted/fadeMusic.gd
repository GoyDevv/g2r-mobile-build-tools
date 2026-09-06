# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/fadeMusic.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name fadeMusic
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    if playMusic:
      if not musicOn:
        musicOn = true
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
    elif (!this.playMusic  and  this.musicOn:
      musicOn = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
    if momHunting:
      if not stopFade:
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume - 0.2 * Time.deltaTime
        if base.GetComponent<AudioSource>().volume <= 0.0:
          stopFade = true
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.0
          playMusic = false
    elif (!this.momHunting  and  this.stopFade:
      playMusic = true
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume + 0.2 * Time.deltaTime
      if base.GetComponent<AudioSource>().volume > 0.3:
        stopFade = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.3

  var Music: Variant

  var BookMusic: Variant

  var volume: float

  var fading: bool

  var playMusic: bool

  var musicOn: bool

  var momHunting: bool

  var stopFade: bool
