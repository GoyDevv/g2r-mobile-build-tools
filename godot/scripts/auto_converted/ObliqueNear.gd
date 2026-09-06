# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/ObliqueNear.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name ObliqueNear
extends Node  # TODO: was MonoBehaviour
  func CalculateObliqueMatrix(projection: Variant, clipPlane: Variant):
    var b := projection.inverse * new Vector4(Mathf.Sign(clipPlane.x), Mathf.Sign(clipPlane.y), 1.0, 1.0)
    var vector := clipPlane * (2.0 / Vector4.Dot(clipPlane, b))
    projection[2] = vector.x - projection[3]
    projection[6] = vector.y - projection[7]
    projection[10] = vector.z - projection[11]
    projection[14] = vector.w - projection[15]
    return projection

  func OnPreCull():
    var projectionMatrix := base.GetComponent<Camera>().projectionMatrix
    var worldToCameraMatrix := base.GetComponent<Camera>().worldToCameraMatrix
    var rhs := worldToCameraMatrix.MultiplyPoint(this.plane.position)
    var vector := worldToCameraMatrix.MultiplyVector(-Vector3.up)
    vector.Normalize()
    var clipPlane := vector
    clipPlane.w = -Vector3.Dot(vector, rhs)
    get_node(\"TODO_Camera\")  # TODO: GetComponent.projectionMatrix = CalculateObliqueMatrix(projectionMatrix, clipPlane)

  var plane: Node3D
