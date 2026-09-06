# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CalculatePathTest.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CalculatePathTest
extends Node  # TODO: was MonoBehaviour
  func OnDrawGizmos():
    if target == null:
      return
    var navMeshPath := new NavMeshPath()
    NavMesh.CalculatePath(position, target.position, -1, navMeshPath)
    Gizmos.color = Color.red
    Gizmos.DrawRay(position, Vector3.up)
    Gizmos.DrawRay(target.position, Vector3.up)
    Gizmos.color = Color.green
    var b := 0.2 * Vector3.up
    for (int i = 1 i < navMeshPath.corners.Length i++) {
    Gizmos.DrawLine(navMeshPath.corners[i - 1] + b, navMeshPath.corners[i] + b)

var target: Node3D
