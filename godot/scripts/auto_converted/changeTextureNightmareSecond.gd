# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/changeTextureNightmareSecond.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name changeTextureNightmareSecond
extends Node  # TODO: was MonoBehaviour
  func _ready():
    if PlayerPrefs.GetInt("NightMareOnOff") == 1:
      get_node(\"TODO_Renderer\")  # TODO: GetComponent.materials[1].mainTexture = nightmareTexture
    else:
      get_node(\"TODO_Renderer\")  # TODO: GetComponent.materials[1].mainTexture = normalTexture

  var normalTexture: Variant

  var nightmareTexture: Variant
