# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/PlayVideoAds.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name PlayVideoAds
extends Node  # TODO: was MonoBehaviour
  func OnLevelWasLoaded(level: int):
    if level == 0:
      Time.timeScale = 1.0
      AudioListener.volume = 1.0
      AudioListener.pause = false
