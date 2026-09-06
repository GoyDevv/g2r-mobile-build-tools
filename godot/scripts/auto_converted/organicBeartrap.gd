# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/organicBeartrap.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name organicBeartrap
extends Node  # TODO: was MonoBehaviour
  func _ready():
    StartCoroutine(StartAnim())

  func StartAnim():
    yield return new WaitForSeconds(2.0)
    self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BeartrapLive")
    var break: Variant

  func _process(_delta):
    if ((BearTrap)base.gameObject.GetComponent(typeof(BearTrap))).beartrapOn:
      self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Stop("BeartrapLive")
