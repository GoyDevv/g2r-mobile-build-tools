# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/fadeUpDownGrannyHunt.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name fadeUpDownGrannyHunt
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if not playerCaught:
      if grannyDead:
        musicOn = false
        startMusic = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume - 0.05 * Time.deltaTime
        if base.GetComponent<AudioSource>().volume == 0.0:
          startFade = false
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.0
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
          playerCaught = false
          grannyDead = false
      elif (this.startFade:
        if not musicOn:
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume + 0.2 * Time.deltaTime
          if base.GetComponent<AudioSource>().volume >= 0.7:
            musicOn = true
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.7
        if not startMusic:
          startMusic = true
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
      elif (!this.startFade:
        musicOn = false
        startMusic = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume - 0.1 * Time.deltaTime
        if base.GetComponent<AudioSource>().volume == 0.0:
          startFade = false
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.0
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
    elif (!this.grannySmackPlayer:
      musicOn = false
      startMusic = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume - 0.05 * Time.deltaTime
      if base.GetComponent<AudioSource>().volume == 0.0:
        startFade = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.0
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
        playerCaught = false
    else:
      musicOn = false
      startMusic = false
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume - 1.05 * Time.deltaTime
      if base.GetComponent<AudioSource>().volume == 0.0:
        startFade = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.volume = 0.0
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
        playerCaught = false
        grannySmackPlayer = false

  var playerCaught: bool

  var grannySmackPlayer: bool

  var grannyDead: bool

  var startFade: bool

  var musicOn: bool

  var startMusic: bool

  var stopMusic: bool

  var volume: float
