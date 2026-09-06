# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/tavelbitTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name tavelbitTrigger
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):

  func OnTriggerStay(other: Variant):
    if other.gameObject.tag == "Player":
      if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb1:
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb1 = false
        ((startNewDay)gameController.GetComponent(typeof(startNewDay))).tavelbit1 = true
        tb1Ram.SetActive(true)
        tb1Hand.SetActive(false)
        dropObjectButton.SetActive(false)
        mittenRing.SetActive(false)
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).tavelbitPlace()
      elif (((InventoryController)this.gameController.GetComponent(typeof(InventoryController))).havetb2:
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb2 = false
        ((startNewDay)gameController.GetComponent(typeof(startNewDay))).tavelbit2 = true
        tb2Ram.SetActive(true)
        tb2Hand.SetActive(false)
        dropObjectButton.SetActive(false)
        mittenRing.SetActive(false)
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).tavelbitPlace()
      elif (((InventoryController)this.gameController.GetComponent(typeof(InventoryController))).havetb3:
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb3 = false
        ((startNewDay)gameController.GetComponent(typeof(startNewDay))).tavelbit3 = true
        tb3Ram.SetActive(true)
        tb3Hand.SetActive(false)
        dropObjectButton.SetActive(false)
        mittenRing.SetActive(false)
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).tavelbitPlace()
      elif (((InventoryController)this.gameController.GetComponent(typeof(InventoryController))).havetb4:
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb4 = false
        ((startNewDay)gameController.GetComponent(typeof(startNewDay))).tavelbit4 = true
        tb4Ram.SetActive(true)
        tb4Hand.SetActive(false)
        dropObjectButton.SetActive(false)
        mittenRing.SetActive(false)
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).tavelbitPlace()

  var gameController: Node3D

  var tb1Ram: Node3D

  var tb2Ram: Node3D

  var tb3Ram: Node3D

  var tb4Ram: Node3D

  var tb1Hand: Node3D

  var tb2Hand: Node3D

  var tb3Hand: Node3D

  var tb4Hand: Node3D

  var dropObjectButton: Node3D

  var mittenRing: Node3D

  var soundHolder: Node3D
