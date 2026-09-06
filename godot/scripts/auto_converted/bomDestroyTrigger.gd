# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/bomDestroyTrigger.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name bomDestroyTrigger
extends Node  # TODO: was MonoBehaviour
  func OnTriggerEnter(other: Variant):
    if other.gameObject.tag == "bomdestroyer":
      self.tag = "Untagged"
      ((Rigidbody)GetComponent(typeof(Rigidbody))).isKinematic = false
      ((EnemyAIGranny)granny.GetComponent(typeof(EnemyAIGranny))).bastuBomNere = false
      if not soundPlaying:
        soundPlaying = true
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(taBortPlanka)
      StartCoroutine(destroyPlank())

  func destroyPlank():
    yield return new WaitForSeconds(10.0)
    Object.queue_free  # TODO: Destroy(self)
    var break: Variant

  var taBortPlanka: Variant

  var soundPlaying: bool

  var granny: Node3D
