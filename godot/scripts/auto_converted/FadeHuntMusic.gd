# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/FadeHuntMusic.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name FadeHuntMusic
extends Node  # TODO: was MonoBehaviour
  func _ready():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = huntingMusic

  func _process(_delta):
    if playMusic:
      if not musicOn:
        musicOn = true
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
    elif (!this.playMusic  and  this.musicOn:
      musicOn = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
    if momHunt:
      if not stopFade:
        playMusic = true
        ((fadeMusic)musicHolder.GetComponent(typeof(fadeMusic))).momHunting = true
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume + 0.3 * Time.deltaTime
        if base.GetComponent<AudioSource>().volume > 0.5:
          stopFade = true
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.5
    elif (!this.momHunt  and  this.stopFade:
      ((fadeMusic)musicHolder.GetComponent(typeof(fadeMusic))).momHunting = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume - 0.1 * Time.deltaTime
      if base.GetComponent<AudioSource>().volume <= 0.0:
        stopFade = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.0
        playMusic = false

  func fightSlendrina():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = fightSlendrinaMusic

  func NotfightSlendrina():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = huntingMusic

  func headHuntStarts():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = headHuntMusic

  func bookMusicStarts():
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = bookMusic
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.loop = false

  var huntingMusic: Variant

  var fightSlendrinaMusic: Variant

  var headHuntMusic: Variant

  var bookMusic: Variant

  var volume: float

  var fading: bool

  var playMusic: bool

  var musicOn: bool

  var momHunt: bool

  var stopFade: bool

  var musicHolder: Node3D
