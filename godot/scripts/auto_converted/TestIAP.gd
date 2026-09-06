# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/TestIAP.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name TestIAP
extends Node  # TODO: was MonoBehaviour
  func _ready():
    buttonWidth = Screen.width
    padding = (Screen.width / 6)

  func OnGUI():
    buttonHeight = (Screen.height / (12 + nonCOnsumableProducts.Count + subscriptions.Count))
    GUI.skin.button.fontSize = 20
    GUI.skin.label.fontSize = 25
    GUI.skin.label.alignment = TextAnchor.LowerCenter
    GUI.skin.textField.fontSize = 20
    GUI.skin.textField.alignment = TextAnchor.MiddleCenter
    nr = 0
    if showButtons:
      if not IAPManager.Instance.IsInitialized():
        if not initializationInProgress  and  Button("Initialize"):
          initializationInProgress = true
          IAPManager.Instance.InitializeIAPManager(new UnityAction<IAPOperationStatus, string, List<StoreProduct>>(InitializeResult))
      elif (!this.purchaseInProgress:
        Label("Consumable")
        if consumableProducts.Count > 0:
          if Button("\\/   Tap to select a consumable product   \\/"):
            if not showConsumable:
              showConsumable = true
            else:
              showConsumable = false
          if showConsumable:
            DropDown(7, ref indexNumberConsumable, ref showConsumable, consumableProducts)
          if (Button(string.Concat(new object[] {
          "BUY ",
          consumableProducts[indexNumberConsumable].name,
          " ",
          IAPManager.Instance.GetValue(consumableProducts[indexNumberConsumable].name),
          " Coins ",
          IAPManager.Instance.GetLocalizedPriceString(consumableProducts[indexNumberConsumable].name)
        purchaseInProgress = true
        IAPManager.Instance.BuyProduct(consumableProducts[indexNumberConsumable].name, new UnityAction<IAPOperationStatus, string, StoreProduct>(ProductBought))
    else:
      Label("No Consumable Products Defined")
    Label("Non Consumable")
    if nonCOnsumableProducts.Count > 0:
      if Button("\\/   Tap to select a non consumable product   \\/"):
        if not showNonConsumable:
          showNonConsumable = true
        else:
          showNonConsumable = false
      if showNonConsumable:
        DropDown(6, ref indexNumberNonConsumable, ref showNonConsumable, nonCOnsumableProducts)
      if (Button(string.Concat(new object[] {
      "BUY ",
      nonCOnsumableProducts[indexNumberNonConsumable].name,
      " ",
      IAPManager.Instance.GetLocalizedPriceString(nonCOnsumableProducts[indexNumberNonConsumable].name)
    purchaseInProgress = true
    IAPManager.Instance.BuyProduct(nonCOnsumableProducts[indexNumberNonConsumable].name, new UnityAction<IAPOperationStatus, string, StoreProduct>(ProductBought))
else:
  Label("No Non Consumable Products Defined")
Label("Subscription")
if subscriptions.Count > 0:
  if Button("\\/   Tap to select a subscription   \\/"):
    if not showSubscription:
      showSubscription = true
    else:
      showSubscription = false
  if showSubscription:
    DropDown(2, ref indexNumberSubscription, ref showSubscription, subscriptions)
  if (Button(string.Concat(new object[] {
  "BUY ",
  subscriptions[indexNumberSubscription].name,
  " ",
  IAPManager.Instance.GetLocalizedPriceString(subscriptions[indexNumberSubscription].name)
purchaseInProgress = true
IAPManager.Instance.BuyProduct(subscriptions[indexNumberSubscription].name, new UnityAction<IAPOperationStatus, string, StoreProduct>(ProductBought))
else:
  Label("No Subscription Defined")
if Button("Restore Purchases"):
  IAPManager.Instance.RestorePurchases(new UnityAction<IAPOperationStatus, string, StoreProduct>(ProductBought))
GUI.skin.label.alignment = TextAnchor.MiddleLeft
Label("Coins: " + coins)
for i in range(int(this.nonCOnsumableProducts.Count)):
  Label(nonCOnsumableProducts[i].name + " was bought " + nonCOnsumableProducts[i].bought)
for j in range(int(this.subscriptions.Count)):
  Label(subscriptions[j].name + " was bought " + subscriptions[j].bought)
if GUI.Button(new Rect(0.0, (float)Screen.height - buttonHeight, (float)(Screen.width / 3), buttonHeight), "Hide/Show Buttons"):
  showButtons = not showButtons

func ProductBought(status: Variant, message: String, product: Variant):
  purchaseInProgress = false
  if status == IAPOperationStatus.Success:
    if IAPManager.Instance.debug:
      print(string.Concat(new object[] {
      "Buy product completed: ",
      product.localizedTitle,
      " receive value: ",
      product.value
    ScreenWriter.Write(string.Concat(new object[] {
    "Buy product completed: ",
    product.localizedTitle,
    " receive value: ",
    product.value
if product.productType == ProductType.Consumable:
  coins += product.value
if product.productName == "UnlockLevel1":
if product.productName == "UnlockLevel2":
if product.productName == "Subscription":
if product.productType == ProductType.NonConsumable:
  nonCOnsumableProducts.First((TestIAP.MyStoreProducts cond) => cond.name.ToString() == product.productName).bought = true
if product.productType == ProductType.Subscription:
  subscriptions.First((TestIAP.MyStoreProducts cond) => cond.name.ToString() == product.productName).bought = true
elif (IAPManager.Instance.debug:
  print("Buy product failed: " + message)
  ScreenWriter.Write("Buy product failed: " + message)

func InitializeResult(status: Variant, message: String, shopProducts: Variant):
  initializationInProgress = false
  consumableProducts = new List<TestIAP.MyStoreProducts>()
  nonCOnsumableProducts = new List<TestIAP.MyStoreProducts>()
  subscriptions = new List<TestIAP.MyStoreProducts>()
  if status == IAPOperationStatus.Success:
    for i in range(int(shopProducts.Count)):
      if not (shopProducts[i].productName == "UnlockLevel1")  or  shopProducts[i].active:
      if not (shopProducts[i].productName == "UnlockLevel2")  or  shopProducts[i].active:
      if not (shopProducts[i].productName == "Subscription")  or  shopProducts[i].active:
      var productType := shopProducts[i].productType
      if productType != ProductType.Consumable:
        if productType != ProductType.NonConsumable:
          if productType == ProductType.Subscription:
            subscriptions.Add(new TestIAP.MyStoreProducts(IAPManager.Instance.ConvertNameToShopProduct(shopProducts[i].productName), shopProducts[i].active))
        else:
          nonCOnsumableProducts.Add(new TestIAP.MyStoreProducts(IAPManager.Instance.ConvertNameToShopProduct(shopProducts[i].productName), shopProducts[i].active))
      else:
        consumableProducts.Add(new TestIAP.MyStoreProducts(IAPManager.Instance.ConvertNameToShopProduct(shopProducts[i].productName), shopProducts[i].active))
  if IAPManager.Instance.debug:
    print(string.Concat(new object[] {
    "Init status: ",
    status,
    " message ",
    message
  ScreenWriter.Write(string.Concat(new object[] {
  "Init status: ",
  status,
  " message ",
  message

func Button(label: String):
  nr++
  return GUI.Button(new Rect(0.0, (nr - 1) * buttonHeight, buttonWidth, buttonHeight), label)

func Label(label: String):
  GUI.Label(new Rect(0.0, nr * buttonHeight, buttonWidth, buttonHeight), label)
  nr++

func DropDown(maxButtons: int, indexNumber: Variant, showDropDown: Variant, coll: Variant):
  var rect := new Rect(0.0, 0.0 * this.buttonHeight, this.buttonWidth, (float)maxButtons * this.buttonHeight)
  scrollViewVector = GUI.BeginScrollView(new Rect(rect.x, rect.y + nr * buttonHeight, rect.width, rect.height), scrollViewVector, new Rect(0.0, 0.0, rect.width - 100.0, Mathf.Max(rect.height, coll.Count * buttonHeight)))
  var num := Mathf.Min(rect.height, (float)coll.Count * this.buttonHeight)
  for i in range(int(coll.Count)):
    if GUI.Button(new Rect(padding, (float)i * buttonHeight, buttonWidth - 2.0 * padding, buttonHeight), coll[i].name + " " + IAPManager.Instance.GetLocalizedPriceString(coll[i].name)):
      showDropDown = false
      indexNumber = i
    if (float)i < num / buttonHeight:
      nr++
  GUI.EndScrollView()

private List<TestIAP.MyStoreProducts> consumableProducts = new List<TestIAP.MyStoreProducts>()

private List<TestIAP.MyStoreProducts> nonCOnsumableProducts = new List<TestIAP.MyStoreProducts>()

private List<TestIAP.MyStoreProducts> subscriptions = new List<TestIAP.MyStoreProducts>()

var scrollViewVector := Vector2.zero

var buttonWidth: float

var buttonHeight: float

var padding: float

var nr: int

var indexNumberConsumable: int

var indexNumberNonConsumable: int

var indexNumberSubscription: int

var coins: int

var purchaseInProgress: bool

var initializationInProgress: bool

var showConsumable: bool

var showNonConsumable: bool

var showSubscription: bool

var showButtons := true

class_name MyStoreProducts
extends Node  # TODO: was MonoBehaviour
  func _init(name: Variant, bought: bool):
    name = name
    bought = bought

  var name: Variant

  var bought: bool
