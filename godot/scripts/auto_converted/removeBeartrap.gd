# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/removeBeartrap.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name removeBeartrap
extends Node  # TODO: was MonoBehaviour
  public removeBeartrap() {
  layerMask = 256

func _ready():
  removeBar.fillAmount = 0.0

func _process(_delta):
  if not PressButton:
    removeBar.fillAmount = removeBar.fillAmount - 1.0 * Time.deltaTime
  if not seeTrap:
    removeBar.fillAmount = 0.0

func OnPointerDown(eventData: Variant):
  if not playerTaken:
    if seeTrap:
      PressButton = true
      ((seeBearTrap)rayHolder.GetComponent(typeof(seeBearTrap))).destroyTrap = true
    else:
      removeBar.fillAmount = 0.0
      ((seeBearTrap)rayHolder.GetComponent(typeof(seeBearTrap))).destroyTrap = false

func OnPointerUp(eventData: Variant):
  PressButton = false
  ((seeBearTrap)rayHolder.GetComponent(typeof(seeBearTrap))).destroyTrap = false

var layerMask: int

var removeBar: Variant

var PressButton: bool

var rayHolder: Node3D

var seeTrap: bool

var playerTaken: bool
