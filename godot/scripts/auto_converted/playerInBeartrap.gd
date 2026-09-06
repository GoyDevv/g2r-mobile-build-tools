# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/playerInBeartrap.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name playerInBeartrap
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    if bloodON:
      bloodScreen.CrossFadeAlpha(0.0, 0.8, false)
      if bloodScreen.canvasRenderer.GetAlpha() < 0.1:
        bloodON = false
        bloodScreenTexture.SetActive(false)
    if bloodHitON:
      bloodScreenHit.CrossFadeAlpha(0.0, 0.8, false)
      if bloodScreenHit.canvasRenderer.GetAlpha() < 0.1:
        bloodHitON = false
        bloodScreenHitTexture.SetActive(false)
    if bloodBitenON:
      bloodScreenBiten.CrossFadeAlpha(0.0, 0.8, false)
      if bloodScreenBiten.canvasRenderer.GetAlpha() < 0.1:
        bloodBitenON = false
        bloodScreenBitenTexture.SetActive(false)

  func playerStuck():
    StartCoroutine(stuckTimer())
    bloodScreen.canvasRenderer.SetAlpha(1.0)

  func playerHit():
    StartCoroutine(hitTimer())
    bloodScreenHit.canvasRenderer.SetAlpha(1.0)

  func playerBiten():
    StartCoroutine(bitenTimer())
    bloodScreenBiten.canvasRenderer.SetAlpha(1.0)

  func stuckTimer():
    bloodScreenTexture.SetActive(true)
    yield return new WaitForSeconds(3.0)
    bloodON = true
    var break: Variant

  func hitTimer():
    yield return new WaitForSeconds(0.8)
    bloodScreenHitTexture.SetActive(true)
    yield return new WaitForSeconds(3.0)
    bloodHitON = true
    var break: Variant

  func bitenTimer():
    bloodScreenBitenTexture.SetActive(true)
    yield return new WaitForSeconds(3.0)
    bloodBitenON = true
    var break: Variant

  var bloodScreen: Variant

  var bloodScreenHit: Variant

  var bloodScreenBiten: Variant

  var bloodScreenTexture: Node3D

  var bloodScreenHitTexture: Node3D

  var bloodScreenBitenTexture: Node3D

  var bloodON: bool

  var bloodHitON: bool

  var bloodBitenON: bool
