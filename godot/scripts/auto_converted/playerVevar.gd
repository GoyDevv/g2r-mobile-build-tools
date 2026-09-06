# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/playerVevar.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name playerVevar
extends Node  # TODO: was MonoBehaviour
  public playerVevar() {
  layerMask = 256

func _ready():
  layerMask = ~layerMask

func _process(_delta):
  var raycastHit := default(RaycastHit)
  if vevInPlace  and  not noMoreVev:
    var direction := this.doorRay.transform.TransformDirection(Vector3.forward)
    if not playerTaken:
      if Physics.Raycast(doorRay.transform.position, direction, out raycastHit, 4.0, layerMask):
        if raycastHit.collider.gameObject.tag == "brunnsvev":
          brunnsVevButton.SetActive(true)
          if playerHoldButton:
            raycastHit.collider.self.self  # TODO: was transform.Rotate(0.0, 0.0, 100.0 * Time.deltaTime)
            winch.self.self  # TODO: was transform.Rotate(0.0, 0.0, 100.0 * Time.deltaTime)
            rope.self  # TODO: was transform.Translate(-Vector3.forward * Time.deltaTime * 0.5, Space.Self)
            ((vevarBrunnLjud)brunnsLjud.GetComponent(typeof(vevarBrunnLjud))).PlayerVevar = true
        elif (raycastHit.collider.gameObject.tag == "grus":
          brunnsVevButton.SetActive(false)
          playerHoldButton = false
          ((vevarBrunnLjud)brunnsLjud.GetComponent(typeof(vevarBrunnLjud))).PlayerVevar = false
        elif (raycastHit.collider.gameObject.tag == "Untagged":
          brunnsVevButton.SetActive(false)
          playerHoldButton = false
          ((vevarBrunnLjud)brunnsLjud.GetComponent(typeof(vevarBrunnLjud))).PlayerVevar = false
      else:
        brunnsVevButton.SetActive(false)
        playerHoldButton = false
        ((vevarBrunnLjud)brunnsLjud.GetComponent(typeof(vevarBrunnLjud))).PlayerVevar = false
    else:
      brunnsVevButton.SetActive(false)
      playerHoldButton = false
      ((vevarBrunnLjud)brunnsLjud.GetComponent(typeof(vevarBrunnLjud))).PlayerVevar = false

var layerMask: int

var playerHoldButton: bool

var brunnsVevButton: Node3D

var doorRay: Node3D

var playerTaken: bool

var playSound: bool

var rope: Node3D

var winch: Node3D

var noMoreVev: bool

var vevInPlace: bool

var brunnsLjud: Node3D
