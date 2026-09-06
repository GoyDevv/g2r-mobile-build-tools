# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/destroyCarDoor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name destroyCarDoor
extends Node  # TODO: was MonoBehaviour
  public destroyCarDoor() {
  brokenCardoorTimer = 20.0

func _ready():

func _process(_delta):
  if destroyBrokenCardorr:
    brokenCardoorTimer -= Time.deltaTime
    if brokenCardoorTimer <= 0.0:
      Object.queue_free  # TODO: Destroy(self)

var brokenCardoorTimer: float

var destroyBrokenCardorr: bool
