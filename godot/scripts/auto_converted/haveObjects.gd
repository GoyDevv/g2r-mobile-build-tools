# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/haveObjects.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name haveObjects
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if handleOK  and  ironKlumpOK:
      var x := 0.44
      var position := this.ironKlumpBild.transform.position
      position.x = x
      ironKlumpBild.position = position
      var x2 := 0.56
      var position2 := this.handleBild.transform.position
      position2.x = x2
      handleBild.position = position2
    else:
      var x3 := 0.5
      var position3 := this.ironKlumpBild.transform.position
      position3.x = x3
      ironKlumpBild.position = position3
      var x4 := 0.5
      var position4 := this.handleBild.transform.position
      position4.x = x4
      handleBild.position = position4
    if brakedPlanka1  and  brakedPlanka2:
      doorTag()

  func doorTag():
    if not plankaDoorTag:
      plankaDoorTag = true
      plankaDoorHolder.self.tag = "doorClosed"
      crowbarBild.SetActive(false)

  var handleOK: bool

  var ironKlumpOK: bool

  var playerStandOnPlatta: bool

  var handleBild: Node3D

  var ironKlumpBild: Node3D

  var brakedPlanka1: bool

  var brakedPlanka2: bool

  var plankaDoorTag: bool

  var plankaDoorHolder: Node3D

  var crowbarBild: Node3D
