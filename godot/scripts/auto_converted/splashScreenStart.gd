# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/splashScreenStart.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name splashScreenStart
extends Node  # TODO: was MonoBehaviour
  func _ready():
    StartCoroutine(readyToStart())

  func readyToStart():
    yield return new WaitForSeconds(3.4)
    get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(sound2)
    yield return new WaitForSeconds(2.0)
    dvloper.sprite = dvloperUtsmetad
    yield return new WaitForSeconds(0.05)
    dvloper.sprite = dvloperVanlig
    yield return new WaitForSeconds(5.0)
    SceneManager.LoadScene("Menu")
    var break: Variant

  var sound: Variant

  var sound2: Variant

  var dvloperVanlig: Variant

  var dvloperUtsmetad: Variant

  var dvloper: Variant
