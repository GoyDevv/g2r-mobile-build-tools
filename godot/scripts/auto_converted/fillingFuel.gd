# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/fillingFuel.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name fillingFuel
extends Node  # TODO: was MonoBehaviour
  public fillingFuel() {
  layerMask = 256

func _ready():
  layerMask = ~layerMask

func _process(_delta):
  var raycastHit := default(RaycastHit)
  if not noMoreFill:
    var direction := this.doorRay.transform.TransformDirection(Vector3.forward)
    if not playerTaken:
      if Physics.Raycast(doorRay.transform.position, direction, out raycastHit, 4.0, layerMask):
        if raycastHit.collider.gameObject.tag == "fueltankPlace":
          if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegascan:
            fillFuelMeter.SetActive(true)
            fillFuelButton.SetActive(true)
            if playerHoldButton:
              fillingGasSoundHolder.SetActive(true)
              if not tanklockAnimPlayed:
                tanklockAnimPlayed = true
                tanklockAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("tanklockOpen")
              fillFuealBar.fillAmount = fillFuealBar.fillAmount + 0.1 * Time.deltaTime
              if fillFuealBar.fillAmount >= 1.0:
                ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).fuelOK = true
                fillFuelMeter.SetActive(false)
                fillFuelButton.SetActive(false)
                Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
                tanklockAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("tanklockClose")
                fillingGasSoundHolder.SetActive(false)
            else:
              fillingGasSoundHolder.SetActive(false)
          else:
            pickUpButton.SetActive(true)
        elif (raycastHit.collider.gameObject.tag == "golv":
          fillFuelButton.SetActive(false)
          fillFuelMeter.SetActive(false)
          playerHoldButton = false
          fillingGasSoundHolder.SetActive(false)
        elif (raycastHit.collider.gameObject.tag == "Untagged":
          fillFuelButton.SetActive(false)
          fillFuelMeter.SetActive(false)
          playerHoldButton = false
          fillingGasSoundHolder.SetActive(false)
      else:
        fillFuelButton.SetActive(false)
        fillFuelMeter.SetActive(false)
        playerHoldButton = false
        fillingGasSoundHolder.SetActive(false)
    else:
      fillFuelButton.SetActive(false)
      fillFuelMeter.SetActive(false)
      playerHoldButton = false
      fillingGasSoundHolder.SetActive(false)

var layerMask: int

var gameController: Node3D

var playerHoldButton: bool

var fillFuelButton: Node3D

var fillFuelMeter: Node3D

var fillFuealBar: Variant

var doorRay: Node3D

var playerTaken: bool

var playSound: bool

var noMoreFill: bool

var pickUpButton: Node3D

var tanklockAnim: Node3D

var fillingGasSoundHolder: Node3D

var tanklockAnimPlayed: bool
