# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/IAPManager.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


public class IAPManager //: IStoreListener {
public static IAPManager Instance {
get {
if IAPManager.instance == null:
  IAPManager.instance = new IAPManager()
return IAPManager.instance

func InitializeIAPManager(UnityAction<IAPOperationStatus: Variant, string: Variant, InitComplete: Variant):
  var iapsettings := Resources.Load<IAPSettings>("IAPData")
  if iapsettings == null:
    print("No products available -> Go to Window->Gley->Easy IAP and define your products")
    return
  shopProducts = iapsettings.shopProducts
  debug = iapsettings.debug
  if debug:
    print(this + "Initialization Started")
    ScreenWriter.Write(this + "Initialization Started")
  //		if (IAPManager.m_StoreController == null)
  //		{
  //			OnInitComplete = InitComplete
  //			InitializePurchasing()
  //		}

func IsInitialized():
  return false
  //return IAPManager.m_StoreController != null  and  IAPManager.m_StoreExtensionProvider != null

func BuyProduct(productName: Variant, UnityAction<IAPOperationStatus: Variant, string: Variant, OnCompleteMethod: Variant):
  if debug:
    print(this + "Buy Process Started for " + productName)
    ScreenWriter.Write(this + "Buy Process Started for " + productName)
  OnCompleteMethod = OnCompleteMethod
  for i in range(int(this.shopProducts.Count)):
    if shopProducts[i].productName == productName.ToString():
      BuyProductID(shopProducts[i].GetStoreID())

func RestorePurchases(UnityAction<IAPOperationStatus: Variant, string: Variant, OnCompleteMethod: Variant):
  if not IsInitialized():
    if debug:
      print(this + "RestorePurchases FAIL. Not initialized.")
      ScreenWriter.Write(this + "RestorePurchases FAIL. Not initialized.")
    return
  if Application.platform == RuntimePlatform.IPhonePlayer  or  Application.platform == RuntimePlatform.OSXPlayer:
    if debug:
      print(this + "RestorePurchases started ...")
      ScreenWriter.Write(this + "RestorePurchases started ...")
    OnCompleteMethod = OnCompleteMethod
    //IAppleExtensions extension = IAPManager.m_StoreExtensionProvider.GetExtension<IAppleExtensions>()
    //			extension.RestoreTransactions(delegate(bool result)
    //			{
    //				if (debug)
    //				{
    //					print(string.Concat(new object[]
    //					{
    //						this,
    //						"RestorePurchases continuing: ",
    //						result,
    //						". If no further messages, no purchases available to restore."
    //					}))
    //					ScreenWriter.Write(string.Concat(new object[]
    //					{
    //						this,
    //						"RestorePurchases continuing: ",
    //						result,
    //						". If no further messages, no purchases available to restore."
    //					}))
    //				}
    //			})
  elif (this.debug:
    print(this + "RestorePurchases FAIL. Not supported on this platform. Current = " + Application.platform)
    ScreenWriter.Write(this + "RestorePurchases FAIL. Not supported on this platform. Current = " + Application.platform)

public global::ProductType GetProductType(ShopProductNames product) {
if IsInitialized():
  return shopProducts.First((StoreProduct cond) => string.Equals(cond.productName, product.ToString())).productType
print("Not Initialized -> Call IAPManager.Instance.InitializeIAPManager() before anything else")
return global::ProductType.Consumable

func GetValue(product: Variant):
  if IsInitialized():
    return shopProducts.First((StoreProduct cond) => string.Equals(cond.productName, product.ToString())).value
  print("Not Initialized -> Call IAPManager.Instance.InitializeIAPManager() before anything else")
  return 0

func GetLocalizedPriceString(product: Variant):
  if IsInitialized():
    if shopProducts != null:
      return shopProducts.First((StoreProduct cond) => string.Equals(cond.productName, product.ToString())).localizedPriceString
    print("No products available -> Go to Window->Gley->Easy IAP and define your products")
  else:
    print("Not Initialized -> Call IAPManager.Instance.InitializeIAPManager() before anything else")
  return "-"

func GetPrice(product: Variant):
  if IsInitialized():
    return shopProducts.First((StoreProduct cond) => string.Equals(cond.productName, product.ToString())).price
  print("Not Initialized -> Call IAPManager.Instance.InitializeIAPManager() before anything else")
  return 0

func GetIsoCurrencyCode(product: Variant):
  if IsInitialized():
    return shopProducts.First((StoreProduct cond) => string.Equals(cond.productName, product.ToString())).isoCurrencyCode
  print("Not Initialized -> Call IAPManager.Instance.InitializeIAPManager() before anything else")
  return "-"

func GetLocalizedDescription(product: Variant):
  if IsInitialized():
    return shopProducts.First((StoreProduct cond) => string.Equals(cond.productName, product.ToString())).localizedDescription
  print("Not Initialized -> Call IAPManager.Instance.InitializeIAPManager() before anything else")
  return "-"

func GetLocalizedTitle(product: Variant):
  if IsInitialized():
    return shopProducts.First((StoreProduct cond) => string.Equals(cond.productName, product.ToString())).localizedTitle
  print("Not Initialized -> Call IAPManager.Instance.InitializeIAPManager() before anything else")
  return "-"

func IsActive(product: Variant):
  if IsInitialized():
    return shopProducts.First((StoreProduct cond) => string.Equals(cond.productName, product.ToString())).active
  print("Not Initialized -> Call IAPManager.Instance.InitializeIAPManager() before anything else")
  return false

func ConvertNameToShopProduct(name: String):
  return (ShopProductNames)Enum.Parse(typeof(ShopProductNames), name)

func BuyProductID(productId: String):
  if debug:
    print(this + "Buy product with id: " + productId)
    ScreenWriter.Write(this + "Buy product with id: " + productId)
  if IsInitialized():
    //			Product product = IAPManager.m_StoreController.products.WithID(productId)
    //			if (product != null  and  product.availableToPurchase)
    //			{
    //				IAPManager.m_StoreController.InitiatePurchase(product)
    //			}
    //			else
    //			{
    //				if (debug)
    //				{
    //					print(this + "BuyProductID: FAIL. Not purchasing product, either is not found or is not available for purchase")
    //					ScreenWriter.Write(this + "BuyProductID: FAIL. Not purchasing product, either is not found or is not available for purchase")
    //				}
    //				if (OnCompleteMethod != null)
    //				{
    //					OnCompleteMethod(IAPOperationStatus.Fail, "Not purchasing product, either is not found or is not available for purchase", null)
    //				}
    //			}
  else:
    if debug:
      print(this + "BuyProductID FAIL. Store not initialized.")
      ScreenWriter.Write(this + "BuyProductID FAIL. Store not initialized.")
    if OnCompleteMethod != null:
      OnCompleteMethod(IAPOperationStatus.Fail, "Store not initialized.", null)

func InitializePurchasing():
  //		if (IsInitialized())
  //		{
  //			OnInitComplete(IAPOperationStatus.Success, "Already initialized", null)
  //			return
  //		}
  //		builder = ConfigurationBuilder.Instance(StandardPurchasingModule.Instance(), new IPurchasingModule[0])
  //		for (int i = 0 i < shopProducts.Count i++)
  //		{
  //			builder.AddProduct(shopProducts[i].GetStoreID(), shopProducts[i].GetProductType())
  //		}
  //		UnityPurchasing.Initialize(this, builder)

//	public void OnInitialized(IStoreController controller, IExtensionProvider extensions)
//	{
//		IAPManager.m_StoreController = controller
//		IAPManager.m_StoreExtensionProvider = extensions
//		for (int i = 0 i < shopProducts.Count i++)
//		{
//			Product product = IAPManager.m_StoreController.products.WithID(shopProducts[i].GetStoreID())
//			if (debug)
//			{
//				print(string.Concat(new object[]
//				{
//					this,
//					product.metadata.localizedTitle,
//					" is available ",
//					product.availableToPurchase
//				}))
//				ScreenWriter.Write(string.Concat(new object[]
//				{
//					this,
//					product.metadata.localizedTitle,
//					" is available ",
//					product.availableToPurchase
//				}))
//			}
//			IAPSecurityException ex
//			if (shopProducts[i].productType == global::ProductType.Subscription  and  product != null  and  product.hasReceipt  and  ReceiptIsValid(shopProducts[i].productName, product.receipt, out ex))
//			{
//				shopProducts[i].active = true
//			}
//			IAPSecurityException ex2
//			if (shopProducts[i].productType == global::ProductType.NonConsumable  and  product != null  and  product.hasReceipt  and  ReceiptIsValid(shopProducts[i].productName, product.receipt, out ex2))
//			{
//				shopProducts[i].active = true
//			}
//			if (product != null  and  product.availableToPurchase)
//			{
//				shopProducts[i].localizedPriceString = product.metadata.localizedPriceString
//				shopProducts[i].price = decimal.ToInt32(product.metadata.localizedPrice)
//				shopProducts[i].isoCurrencyCode = product.metadata.isoCurrencyCode
//				shopProducts[i].localizedDescription = product.metadata.localizedDescription
//				shopProducts[i].localizedTitle = product.metadata.localizedTitle
//			}
//		}
//		OnInitComplete(IAPOperationStatus.Success, "Success", shopProducts)
//	}
//
//	public void OnInitializeFailed(InitializationFailureReason error)
//	{
//		OnInitComplete(IAPOperationStatus.Fail, error.ToString(), null)
//	}
//
//	public void OnPurchaseFailed(Product product, PurchaseFailureReason reason)
//	{
//		if (debug)
//		{
//			print(string.Concat(new object[]
//			{
//				this,
//				"Buy Product failed for ",
//				product.metadata.localizedTitle,
//				" Failed. Reason: ",
//				reason
//			}))
//			ScreenWriter.Write(string.Concat(new object[]
//			{
//				this,
//				"Buy Product failed for ",
//				product.metadata.localizedTitle,
//				" Failed. Reason: ",
//				reason
//			}))
//		}
//		if (OnCompleteMethod != null)
//		{
//			OnCompleteMethod(IAPOperationStatus.Fail, product.metadata.localizedTitle + " Failed. Reason: " + reason, null)
//		}
//	}
//
//	public PurchaseProcessingResult ProcessPurchase(PurchaseEventArgs e)
//	{
//		if (debug)
//		{
//			print(this + "Product bought " + e.purchasedProduct.definition.id)
//			ScreenWriter.Write(this + "Product bought " + e.purchasedProduct.definition.id)
//		}
//		for (int i = 0 i < shopProducts.Count i++)
//		{
//			if (string.Equals(e.purchasedProduct.definition.id, shopProducts[i].GetStoreID(), StringComparison.Ordinal))
//			{
//				IAPSecurityException ex
//				bool flag = ReceiptIsValid(shopProducts[i].productName, e.purchasedProduct.receipt, out ex)
//				if (flag)
//				{
//					if (shopProducts[i].productType == global::ProductType.Subscription  or  shopProducts[i].productType == global::ProductType.NonConsumable)
//					{
//						shopProducts[i].active = true
//					}
//					if (OnCompleteMethod != null)
//					{
//						OnCompleteMethod(IAPOperationStatus.Success, "Purchase Successful", shopProducts[i])
//					}
//				}
//				else if (OnCompleteMethod != null)
//				{
//					OnCompleteMethod(IAPOperationStatus.Fail, "Invalid Receipt " + ex.Message + ex.Data, null)
//				}
//				break
//			}
//		}
//		return PurchaseProcessingResult.Complete
//	}

func ReceiptIsValid(productName: String, receipt: String, exception: Variant):
  exception = null
  return true

var debug: bool

//	private static IStoreController m_StoreController

//	private static IExtensionProvider m_StoreExtensionProvider

var shopProducts: Variant

//	private ConfigurationBuilder builder

private UnityAction<IAPOperationStatus, string, List<StoreProduct>> OnInitComplete

private UnityAction<IAPOperationStatus, string, StoreProduct> OnCompleteMethod

var instance: Variant
