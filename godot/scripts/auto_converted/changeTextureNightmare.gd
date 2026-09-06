# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/changeTextureNightmare.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name changeTextureNightmare
extends Node  # TODO: was MonoBehaviour
  func _ready():
    if PlayerPrefs.GetInt("NightMareOnOff") == 1:
      get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.mainTexture = nightmareTexture
    else:
      get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.mainTexture = normalTexture

  var normalTexture: Variant

  var nightmareTexture: Variant
