# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/plattaflyttas.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name plattaflyttas
extends Node  # TODO: was MonoBehaviour
  func update():

  func MovePlatta():
    if Upp:
      var z := base.gameObject.transform.localPosition.z - 0.5
      var localPosition := base.gameObject.transform.localPosition
      localPosition.z = z
      self.self  # TODO: was transform.localPosition = localPosition
      AudioSource.PlayClipAtPoint(flyttaPlatta, position)
    elif (this.H:
      var x := base.gameObject.transform.localPosition.x - 0.5
      var localPosition2 := base.gameObject.transform.localPosition
      localPosition2.x = x
      self.self  # TODO: was transform.localPosition = localPosition2
      AudioSource.PlayClipAtPoint(flyttaPlatta, position)
    elif (this.Ner:
      var z2 := base.gameObject.transform.localPosition.z + 0.5
      var localPosition3 := base.gameObject.transform.localPosition
      localPosition3.z = z2
      self.self  # TODO: was transform.localPosition = localPosition3
      AudioSource.PlayClipAtPoint(flyttaPlatta, position)
    elif (this.V:
      var x2 := base.gameObject.transform.localPosition.x + 0.5
      var localPosition4 := base.gameObject.transform.localPosition
      localPosition4.x = x2
      self.self  # TODO: was transform.localPosition = localPosition4
      AudioSource.PlayClipAtPoint(flyttaPlatta, position)

  var Upp: bool

  var H: bool

  var Ner: bool

  var V: bool

  var flyttaPlatta: Variant
