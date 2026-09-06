# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CountBooks.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CountBooks
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    bookText.text = books.ToString() + " / 8"
    if books == 8  and  not findAllBooks:
      findAllBooks = true
      allaBooksSkylt.SetActive(true)
      ((TextInactivate)allaBooksSkylt.GetComponent(typeof(TextInactivate))).travelDown = true

  func countUpBooks():
    books++

  var books: int

  var bookText: Variant

  var findAllBooks: bool

  var allaBooksSkylt: Node3D
