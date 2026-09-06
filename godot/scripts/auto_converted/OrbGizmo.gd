# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/OrbGizmo.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name OrbGizmo
extends Node  # TODO: was MonoBehaviour
  func _ready():
    MonoBehaviour.print("Orb count: " + self  # TODO: was transform.childCount)

  func OnDrawGizmos():
    if base.enabled:
      var enumerator := base.transform.GetEnumerator()
      try {
      while enumerator.MoveNext():
        var obj := enumerator.Current
        var transform := (Transform)obj
        Gizmos.DrawIcon(position, "particleGizmo.tif")
    finally {
    var disposable: Variant
    if (disposable = (enumerator as IDisposable)) != null:
      disposable.Dispose()
