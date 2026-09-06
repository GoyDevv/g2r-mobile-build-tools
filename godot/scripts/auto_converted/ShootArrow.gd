# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ShootArrow.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ShootArrow
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    var raycastHit := default(RaycastHit)
    var direction := this.SeeRay.transform.TransformDirection(Vector3.forward)
    if Physics.Raycast(SeeRay.transform.position, direction, out raycastHit, 100.0)  and  shooting:
      shooting = false
      shootButton.SetActive(false)
      laddad.SetActive(false)
      Oladdad.SetActive(true)
      Arrow.SetActive(false)
      ((InventoryController)gameController.GetComponent(typeof(InventoryController))).armborstArrowOK = false
      ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveArrow = false
      var rigidbody := UnityEngine.Object.Instantiate<Rigidbody>(this.arrow, this.bulletSpawn.transform.position, this.bulletSpawn.transform.rotation)
      rigidbody.velocity = (raycastHit.point - bulletSpawn.position).normalized * 30.0
      rigidbody.rotation = Quaternion.LookRotation(rigidbody.velocity)
      ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).CrossbowShoot()

  var SeeRay: Node3D

  var arrow: Variant

  var bulletSpawn: Node3D

  var shooting: bool

  var shootButton: Node3D

  var gameController: Node3D

  var laddad: Node3D

  var Oladdad: Node3D

  var Arrow: Node3D

  var soundHolder: Node3D

  var velocity: Vector3
