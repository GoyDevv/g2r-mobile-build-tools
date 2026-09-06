# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/StoreProduct.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name StoreProduct
extends Node  # TODO: was MonoBehaviour
  func _init(productName: String, productType: Variant, value: int, idGooglePlay: String, idIOS: String):
    productName = productName
    productType = productType
    value = value
    idGooglePlay = idGooglePlay
    idIOS = idIOS

  func _init():
    productName = string.Empty
    idGooglePlay = string.Empty
    idIOS = string.Empty
    productType = global::ProductType.Consumable

  //	internal Purchasing.ProductType GetProductType()
  //	{
  //		return (Purchasing.ProductType)productType
  //	}

  func GetStoreID():
    return idGooglePlay

  var productName: String

  public global::ProductType productType

  var idGooglePlay: String

  var idIOS: String

  var value: int

  var localizedPriceString := "-"

  var price: int

  var isoCurrencyCode: String

  var localizedDescription: String

  var localizedTitle: String

  var active: bool
