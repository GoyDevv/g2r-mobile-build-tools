# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/WaterMovement.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name WaterMovement
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    var time := Time.time
    var num := Mathf.PingPong(time * 0.2, 1.0) * 0.05
    waterSurface.material.mainTextureOffset = new Vector2(num, num)
    pipeWater.material.mainTextureOffset = new Vector2(time * 0.2 % 1.0, time * 1.3 % 1.0)

  var waterSurface: Variant

  var pipeWater: Variant
