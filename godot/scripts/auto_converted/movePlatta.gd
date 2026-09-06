# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/movePlatta.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name movePlatta
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    var raycastHit := default(RaycastHit)

    #if UNITY_EDITOR
    for i in range(int(InputHelper.GetTouches().Count)):
      if InputHelper.GetTouches()[i].phase == TouchPhase.Began:
        var ray := Camera.main.ScreenPointToRay(InputHelper.GetTouches()[i].position)
        if Physics.Raycast(ray, out raycastHit, 8.0)  and  raycastHit.collider.gameObject.tag == "platta":
          ((plattaflyttas)raycastHit.collider.self.GetComponent(typeof(plattaflyttas))).MovePlatta()
          print("Moving platta")
    #else
    for i in range(int(UnityEngine.Input.touchCount)):
      if UnityEngine.Input.GetTouch(i).phase == TouchPhase.Began:
        var ray := Camera.main.ScreenPointToRay(UnityEngine.Input.GetTouch(i).position)
        if Physics.Raycast(ray, out raycastHit, 8.0)  and  raycastHit.collider.gameObject.tag == "platta":
          ((plattaflyttas)raycastHit.collider.self.GetComponent(typeof(plattaflyttas))).MovePlatta()
          print("Moving platta")
    #endif
