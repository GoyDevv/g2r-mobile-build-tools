# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/dropObjects.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name dropObjects
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
    ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoObjectText()

  var gameController: Node3D

  var btn1: Variant
