# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/AdManager.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name AdManager
extends Node  # TODO: was MonoBehaviour
  public static AdManager Instance {
  get {
  if AdManager.instance == null:
    AdManager.instance = Object.null  # TODO: FindObjectOfType<AdManager>
    if AdManager.instance == null:
      AdManager.instance = new GameObject("Spawned AdManager", new Type[] {
      typeof(AdManager)
return AdManager.instance
set {
AdManager.instance = value

func _init():
  Object.pass  # TODO: DontDestroyOnLoad(self)
  //Advertisement.Initialize(gameID, testMode)

//	public void ShowRegularAds(Action<ShowResult> callback)
//	{
//		if (Advertisement.IsReady(adsPlacementId))
//		{
//			ShowOptions showOptions = new ShowOptions()
//			showOptions.resultCallback = callback
//			Advertisement.Show(adsPlacementId, showOptions)
//		}
//		else
//		{
//			print("Ads not ready")
//		}
//	}

var instance: Variant

var gameID := string.Empty

var testMode := true

var adsPlacementId: String
