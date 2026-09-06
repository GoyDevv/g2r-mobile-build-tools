# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/NoMoreAds.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name NoMoreAds
extends Node  # TODO: was MonoBehaviour
  func _ready():
    IAPManager.Instance.InitializeIAPManager(new UnityAction<IAPOperationStatus, string, List<StoreProduct>>(InitComplete))

  func InitComplete(status: Variant, errorMessage: String, allStoreProducts: Variant):
    if status == IAPOperationStatus.Success:
      for i in range(int(allStoreProducts.Count)):
        if allStoreProducts[i].productName == ShopProductNames.NoAds.ToString()  and  allStoreProducts[i].active:
          NoMoreAds.SetAdAvailable(true)
      RefreshMenu()
    else:
      print("Initialization failed" + errorMessage)

  func _enter_tree():
    RefreshMenu()

  func SetAdAvailable(state: bool):
    if not state:
      PlayerPrefs.SetInt("ADSon", 0)
    else:
      PlayerPrefs.SetInt("ADSon", 1)

  func IsAdAvailable():
    var result: int
    if PlayerPrefs.HasKey("ADSon"):
      result = PlayerPrefs.GetInt("ADSon")
    else:
      result = 0
    return result != 0

  func RefreshMenu():
    if not NoMoreAds.IsAdAvailable():
      noAdsButton.SetActive(true)
    else:
      noAdsButton.SetActive(false)

  func RemoveAds():
    IAPManager.Instance.BuyProduct(ShopProductNames.NoAds, new UnityAction<IAPOperationStatus, string, StoreProduct>(productBought))

  func productBought(status: Variant, errorMessage: String, boughtProduct: Variant):
    if status == IAPOperationStatus.Success  and  boughtProduct.productName == ShopProductNames.NoAds.ToString():
      NoMoreAds.SetAdAvailable(true)
      noAdsButton.SetActive(false)

  var noAdsButton: Node3D

  private const string adAvailableFileName = "ADSon"
