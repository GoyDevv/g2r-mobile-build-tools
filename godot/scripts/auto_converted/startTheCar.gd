# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/startTheCar.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name startTheCar
extends Node  # TODO: was MonoBehaviour
  func _ready():
    btn1.onClick.AddListener(new UnityAction(TaskOnClick))

  func TaskOnClick():
    ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).startCar()

  var gameController: Node3D

  var btn1: Variant
