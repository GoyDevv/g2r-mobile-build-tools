# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/seeBearTrap.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name seeBearTrap
extends Node  # TODO: was MonoBehaviour
  public seeBearTrap() {
  layerMask = 256

func _ready():
  layerMask = ~layerMask

func _process(_delta):
  var raycastHit := default(RaycastHit)
  var direction := this.SeeRay.transform.TransformDirection(Vector3.forward)
  if not playerTaken:
    if Physics.Raycast(SeeRay.transform.position, direction, out raycastHit, 5.0, layerMask):
      if raycastHit.collider.gameObject.tag == "BearTrapActivated":
        button.enabled = true
        ((removeBeartrap)button.GetComponent(typeof(removeBeartrap))).seeTrap = true
        if destroyTrap:
          removeBar.fillAmount = removeBar.fillAmount + 0.5 * Time.deltaTime
          if removeBar.fillAmount == 1.0:
            removeBar.fillAmount = 0.0
            if raycastHit.collider.gameObject.tag == "BearTrapActivated":
              Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
              ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 5.0
              ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 4.0
              ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 5.0
              joystick.SetActive(true)
              crawlButton.SetActive(true)
              allBedButtons.SetActive(true)
              ((removeBeartrap)button.GetComponent(typeof(removeBeartrap))).seeTrap = false
              player.get_node(\"TODO_CharacterController\")  # TODO: GetComponent.height = 2.76
              button.enabled = false
              destroyTrap = false
              if PlayerPrefs.GetInt("NightMareOnOff") == 0:
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(removeBeartrapSound)
              else:
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(removeBeartrapOrganicSound)
      elif (raycastHit.collider.gameObject.tag == "golv":
        ((removeBeartrap)button.GetComponent(typeof(removeBeartrap))).seeTrap = false
        button.enabled = false
        destroyTrap = false
    else:
      ((removeBeartrap)button.GetComponent(typeof(removeBeartrap))).seeTrap = false
      button.enabled = false
      destroyTrap = false

var layerMask: int

var button: Variant

var removeBar: Variant

var SeeRay: Node3D

var destroyTrap: bool

var playerTaken: bool

var player: Node3D

var joystick: Node3D

var crawlButton: Node3D

var allBedButtons: Node3D

var removeBeartrapSound: Variant

var removeBeartrapOrganicSound: Variant
