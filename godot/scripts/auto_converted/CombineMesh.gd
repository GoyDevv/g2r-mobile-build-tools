# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CombineMesh.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CombineMesh
extends Node  # TODO: was MonoBehaviour
  func _ready():
    MeshFilter[] componentsInChildren = GetComponentsInChildren<MeshFilter>()
    CombineInstance[] array = new CombineInstance[componentsInChildren.Length]
    for i in range(int(componentsInChildren.Length)):
      array[i].mesh = componentsInChildren[i].sharedMesh
      array[i].self  # TODO: was transform = componentsInChildren[i].self  # TODO: was transform.localToWorldMatrix
      componentsInChildren[i].self.SetActive(false)
    ((MeshFilter)self  # TODO: was transform.GetComponent(typeof(MeshFilter))).mesh = new Mesh()
    ((MeshFilter)self  # TODO: was transform.GetComponent(typeof(MeshFilter))).mesh.CombineMeshes(array)
    self  # TODO: was transform.localPosition = Vector3(0.0, 0.0, 0.0)
    self.AddComponent(typeof(MeshCollider))
    self  # TODO: was transform.self.SetActive(true)
