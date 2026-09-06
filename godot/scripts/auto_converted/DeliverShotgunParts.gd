# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/DeliverShotgunParts.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name DeliverShotgunParts
extends Node  # TODO: was MonoBehaviour
  func OnTriggerStay(other: Variant):
    if other.gameObject.tag == "Player":
      if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel1:
        shotgunPart1Table.SetActive(true)
        shotgunPart1Hand.SetActive(false)
        dropObjectButton.SetActive(false)
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel1 = false
        shotgunPart1 = true
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(placeObjectSound)
        if shotgunPart2  and  shotgunPart3:
          Shotgun.SetActive(true)
          moreAmmo.SetActive(true)
          shotgunPart1Table.SetActive(false)
          shotgunPart2Table.SetActive(false)
          shotgunPart3Table.SetActive(false)
      if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel2:
        shotgunPart2Table.SetActive(true)
        shotgunPart2Hand.SetActive(false)
        dropObjectButton.SetActive(false)
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel2 = false
        shotgunPart2 = true
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(placeObjectSound)
        if shotgunPart1  and  shotgunPart3:
          Shotgun.SetActive(true)
          moreAmmo.SetActive(true)
          shotgunPart1Table.SetActive(false)
          shotgunPart2Table.SetActive(false)
          shotgunPart3Table.SetActive(false)
      if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel3:
        shotgunPart3Table.SetActive(true)
        shotgunPart3Hand.SetActive(false)
        dropObjectButton.SetActive(false)
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel3 = false
        shotgunPart3 = true
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(placeObjectSound)
        if shotgunPart1  and  shotgunPart2:
          Shotgun.SetActive(true)
          moreAmmo.SetActive(true)
          shotgunPart1Table.SetActive(false)
          shotgunPart2Table.SetActive(false)
          shotgunPart3Table.SetActive(false)

  var gameController: Node3D

  var shotgunPart1: bool

  var shotgunPart2: bool

  var shotgunPart3: bool

  var shotgunPart1Table: Node3D

  var shotgunPart2Table: Node3D

  var shotgunPart3Table: Node3D

  var shotgunPart1Hand: Node3D

  var shotgunPart2Hand: Node3D

  var shotgunPart3Hand: Node3D

  var dropObjectButton: Node3D

  var Shotgun: Node3D

  var moreAmmo: Node3D

  var placeObjectSound: Variant
