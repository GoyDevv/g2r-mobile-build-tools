# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/enableDisableCarve.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name enableDisableCarve
extends Node  # TODO: was MonoBehaviour
  func _ready():
    Innerdoor = get_node(\"TODO_NavMeshObstacle\")  # TODO: GetComponent

  func _process(_delta):
    if doorOpenCarve:
      Innerdoor.carving = enabled
    elif (!this.doorOpenCarve:
      Innerdoor.carving = not enabled

  var Innerdoor: Variant

  var doorOpenCarve: bool
