# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/InventoryController.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name InventoryController
extends Node  # TODO: was MonoBehaviour
  func _process(_delta):
    if textTimerOnOff:
      textTimer += Time.deltaTime
      if textTimer > 3.0:
        textTimerOnOff = false
        textTimer = 0.0
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoObjectText()

  func CheckInventory():
    dropObjectButton.SetActive(false)
    if haveAvbitare:
      avbitare.SetActive(false)
      haveAvbitare = false
      Object.Instantiate<Transform>(newAvbitare, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.haveHammare:
      hammare.SetActive(false)
      haveHammare = false
      Object.Instantiate<Transform>(newHammare, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havevas:
      vas.SetActive(false)
      havevas = false
      Object.Instantiate<Transform>(newvas, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havesafeKey:
      safeKey.SetActive(false)
      havesafeKey = false
      Object.Instantiate<Transform>(newsafeKey, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.haveexitKey:
      exitKey.SetActive(false)
      haveexitKey = false
      Object.Instantiate<Transform>(newexitKey, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havehanglockKey:
      hanglockKey.SetActive(false)
      havehanglockKey = false
      Object.Instantiate<Transform>(newhanglockKey, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havepadlockCode:
      padlockCode.SetActive(false)
      havepadlockCode = false
      Object.Instantiate<Transform>(newpadlockCode, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havearmborst:
      armborst.SetActive(false)
      havearmborst = false
      arrowButton.SetActive(false)
      shootArrowRay.SetActive(false)
      Object.Instantiate<Transform>(newarmborst, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
      if armborstArrowOK:
        Object.Instantiate<Transform>(newArrow, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
        haveArrow = false
        armborstArrowOK = false
    elif (this.haveweaponKey:
      weaponKey.SetActive(false)
      haveweaponKey = false
      Object.Instantiate<Transform>(newweaponKey, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havescrewdriver:
      screwdriver.SetActive(false)
      havescrewdriver = false
      Object.Instantiate<Transform>(newscrewdriver, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.haveplanka:
      planka.SetActive(false)
      haveplanka = false
      Object.Instantiate<Transform>(newplanka, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
      placeObject = false
      placeObjectButton.SetActive(false)
    elif (this.havebattery:
      battery.SetActive(false)
      havebattery = false
      Object.Instantiate<Transform>(newbattery, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havetb1:
      tb1.SetActive(false)
      havetb1 = false
      Object.Instantiate<Transform>(newtb1, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havetb2:
      tb2.SetActive(false)
      havetb2 = false
      Object.Instantiate<Transform>(newtb2, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havetb3:
      tb3.SetActive(false)
      havetb3 = false
      Object.Instantiate<Transform>(newtb3, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havetb4:
      tb4.SetActive(false)
      havetb4 = false
      Object.Instantiate<Transform>(newtb4, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havevas2:
      vas2.SetActive(false)
      havevas2 = false
      Object.Instantiate<Transform>(newvas2, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.haveplayhouseKey:
      playhouseKey.SetActive(false)
      haveplayhouseKey = false
      Object.Instantiate<Transform>(newplayhouseKey, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havemelon:
      melon.SetActive(false)
      havemelon = false
      Object.Instantiate<Transform>(newmelon, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.haveteddy:
      teddy.SetActive(false)
      haveteddy = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
      Object.Instantiate<Transform>(newteddy, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havekugg1:
      kugg1.SetActive(false)
      havekugg1 = false
      Object.Instantiate<Transform>(newkugg1, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havekugg2:
      kugg2.SetActive(false)
      havekugg2 = false
      Object.Instantiate<Transform>(newkugg2, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havemessage:
      message.SetActive(false)
      havemessage = false
      Object.Instantiate<Transform>(newmessage, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havebrunnsvev:
      brunnsvev.SetActive(false)
      havebrunnsvev = false
      Object.Instantiate<Transform>(newbrunnsvev, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.haveoldShotgun:
      oldShotgun.SetActive(false)
      haveoldShotgun = false
      shootButton.SetActive(false)
      shootRay.SetActive(false)
      Object.Instantiate<Transform>(newoldShotgun, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havegunDel1:
      gunDel1.SetActive(false)
      havegunDel1 = false
      Object.Instantiate<Transform>(newgunDel1, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havegunDel2:
      gunDel2.SetActive(false)
      havegunDel2 = false
      Object.Instantiate<Transform>(newgunDel2, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havegunDel3:
      gunDel3.SetActive(false)
      havegunDel3 = false
      Object.Instantiate<Transform>(newgunDel3, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havecarKey:
      carKey.SetActive(false)
      havecarKey = false
      ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).playerHaveCarKey = false
      Object.Instantiate<Transform>(newcarKey, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havetopplock:
      topplock.SetActive(false)
      havetopplock = false
      Object.Instantiate<Transform>(newtopplock, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havecarbattery:
      carbattery.SetActive(false)
      havecarbattery = false
      Object.Instantiate<Transform>(newcarbattery, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havegascan:
      gascan.SetActive(false)
      havegascan = false
      Object.Instantiate<Transform>(newgascan, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havewrench:
      wrench.SetActive(false)
      havewrench = false
      Object.Instantiate<Transform>(newwrench, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havesparkplug:
      sparkplug.SetActive(false)
      havesparkplug = false
      Object.Instantiate<Transform>(newsparkplug, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havemeat:
      meat.SetActive(false)
      havemeat = false
      Object.Instantiate<Transform>(newmeat, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havespecialkey:
      specialkey.SetActive(false)
      havespecialkey = false
      Object.Instantiate<Transform>(newspecialkey, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havebook:
      book.SetActive(false)
      havebook = false
      Object.Instantiate<Transform>(newbook, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havepepperspray:
      pepperspray.SetActive(false)
      havepepperspray = false
      sprayButton.SetActive(false)
      Object.Instantiate<Transform>(newpepperspray, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.haveremote:
      remote.SetActive(false)
      haveremote = false
      useRemoteButton.SetActive(false)
      Object.Instantiate<Transform>(newremote, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havebirdSeed:
      birdSeed.SetActive(false)
      havebirdSeed = false
      Object.Instantiate<Transform>(newbirdSeed, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
    elif (this.havefreezeTrap:
      freezeTrap.SetActive(false)
      havefreezeTrap = false
      Object.Instantiate<Transform>(newfreezeTrap, dropPointFreezeTrap.position, dropPointFreezeTrap.quaternion  # TODO: Unity->Godot rotation)
    textTimerOnOff = true

  func placePlankaHole():
    if plankaHighlighted:
      plankaHighlighted = false
      highlightedPlanka.SetActive(false)
      highlightedPlankaTrigger.SetActive(false)
      plankaHole.SetActive(true)
      planka.SetActive(false)
      haveplanka = false
      placeObject = false
      placeObjectButton.SetActive(false)
      dropObjectButton.SetActive(false)
      mittenRing.SetActive(false)

  func NoText():
    NeedhangLockKeyText.SetActive(false)
    NeedhammerText.SetActive(false)
    NeedsafeKeyText.SetActive(false)
    NeedAvbitarTongText.SetActive(false)
    NeedHusnyckelText.SetActive(false)
    NeedpadlockCodeText.SetActive(false)
    NeedCrossbowText.SetActive(false)
    CantopenDoorYetText.SetActive(false)
    NeedweaponKeyText.SetActive(false)
    NeedscrewdriverText.SetActive(false)
    NeedbatteryText.SetActive(false)
    missinTavelbitarText.SetActive(false)
    NeedplayhouseKeyText.SetActive(false)
    cutThingsHereText.SetActive(false)
    SomethingMissingHereText.SetActive(false)
    somethingInsideMelonText.SetActive(false)
    NeedWinchhandleText.SetActive(false)
    NeedFindSwitchText.SetActive(false)
    NeedShotgunText.SetActive(false)
    ShotgunLoadedText.SetActive(false)
    NeedcarKeyText.SetActive(false)
    NeedCarBatteryText.SetActive(false)
    NeedGasolineText.SetActive(false)
    NeedEnginePartText.SetActive(false)
    NeedWrenchText.SetActive(false)
    NeedSparkPlugText.SetActive(false)
    emptyPlateText.SetActive(false)
    NeedSpecialKeyText.SetActive(false)
    NeedRemoteControlText.SetActive(false)
    MaybePutSomethingHereText.SetActive(false)
    MaybeUsePlanksText.SetActive(false)

  func NoObjectText():
    pickUpButton.SetActive(false)
    mittenRing.SetActive(false)
    hangLockKeyText.SetActive(false)
    hammerText.SetActive(false)
    safeKeyText.SetActive(false)
    AvbitarTongText.SetActive(false)
    HusnyckelText.SetActive(false)
    padlockCodeText.SetActive(false)
    CrossbowText.SetActive(false)
    TranquilizerDartText.SetActive(false)
    weaponKeyText.SetActive(false)
    screwdriverText.SetActive(false)
    plankText.SetActive(false)
    batteryText.SetActive(false)
    tavelbitText.SetActive(false)
    playhouseKeyText.SetActive(false)
    melonText.SetActive(false)
    teddyText.SetActive(false)
    cogwheelText.SetActive(false)
    winchhandleText.SetActive(false)
    PartOfShotgunText.SetActive(false)
    ShotgunText.SetActive(false)
    AmmoText.SetActive(false)
    carKeyText.SetActive(false)
    EnginePartText.SetActive(false)
    SparkPlugText.SetActive(false)
    GasolineCanText.SetActive(false)
    CarBatteryText.SetActive(false)
    WrenchText.SetActive(false)
    MeatText.SetActive(false)
    specialKeyText.SetActive(false)
    bookText.SetActive(false)
    peppersprayText.SetActive(false)
    RemoteControlText.SetActive(false)
    BirdSeedText.SetActive(false)
    emptyBowlText.SetActive(false)
    freezeTrapText.SetActive(false)

  func PlanktextTimer():
    textTimerOnOff = true
    MaybeUsePlanksText.SetActive(true)

  var Granny: Node3D

  var gameController: Node3D

  var mittenRing: Node3D

  var pickUpButton: Node3D

  var dropPoint: Node3D

  var dropPointFreezeTrap: Node3D

  var dropObjectButton: Node3D

  var arrowButton: Node3D

  var sprayButton: Node3D

  var useRemoteButton: Node3D

  var placeObject: bool

  var placeObjectButton: Node3D

  var plankaHighlighted: bool

  var highlightedPlanka: Node3D

  var highlightedPlankaTrigger: Node3D

  var plankaHole: Node3D

  var tb1: Node3D

  var newtb1: Node3D

  var havetb1: bool

  var tb2: Node3D

  var newtb2: Node3D

  var havetb2: bool

  var tb3: Node3D

  var newtb3: Node3D

  var havetb3: bool

  var tb4: Node3D

  var newtb4: Node3D

  var havetb4: bool

  var avbitare: Node3D

  var newAvbitare: Node3D

  var haveAvbitare: bool

  var hammare: Node3D

  var newHammare: Node3D

  var haveHammare: bool

  var vas: Node3D

  var newvas: Node3D

  var havevas: bool

  var vas2: Node3D

  var newvas2: Node3D

  var havevas2: bool

  var safeKey: Node3D

  var newsafeKey: Node3D

  var havesafeKey: bool

  var exitKey: Node3D

  var newexitKey: Node3D

  var haveexitKey: bool

  var hanglockKey: Node3D

  var newhanglockKey: Node3D

  var havehanglockKey: bool

  var padlockCode: Node3D

  var newpadlockCode: Node3D

  var havepadlockCode: bool

  var armborst: Node3D

  var newarmborst: Node3D

  var havearmborst: bool

  var newArrow: Node3D

  var haveArrow: bool

  var armborstArrowOK: bool

  var shootArrowRay: Node3D

  var weaponKey: Node3D

  var newweaponKey: Node3D

  var haveweaponKey: bool

  var screwdriver: Node3D

  var newscrewdriver: Node3D

  var havescrewdriver: bool

  var planka: Node3D

  var newplanka: Node3D

  var haveplanka: bool

  var battery: Node3D

  var newbattery: Node3D

  var havebattery: bool

  var playhouseKey: Node3D

  var newplayhouseKey: Node3D

  var haveplayhouseKey: bool

  var carKey: Node3D

  var newcarKey: Node3D

  var havecarKey: bool

  var melon: Node3D

  var newmelon: Node3D

  var havemelon: bool

  var teddy: Node3D

  var newteddy: Node3D

  var haveteddy: bool

  var kugg1: Node3D

  var newkugg1: Node3D

  var havekugg1: bool

  var kugg2: Node3D

  var newkugg2: Node3D

  var havekugg2: bool

  var message: Node3D

  var newmessage: Node3D

  var havemessage: bool

  var brunnsvev: Node3D

  var newbrunnsvev: Node3D

  var havebrunnsvev: bool

  var oldShotgun: Node3D

  var oldShotgunAnim: Node3D

  var newoldShotgun: Node3D

  var haveoldShotgun: bool

  var oldShotgunLoaded: bool

  var shootButton: Node3D

  var shootRay: Node3D

  var ammo: Node3D

  var gunDel1: Node3D

  var newgunDel1: Node3D

  var havegunDel1: bool

  var gunDel2: Node3D

  var newgunDel2: Node3D

  var havegunDel2: bool

  var gunDel3: Node3D

  var newgunDel3: Node3D

  var havegunDel3: bool

  var topplock: Node3D

  var newtopplock: Node3D

  var havetopplock: bool

  var carbattery: Node3D

  var newcarbattery: Node3D

  var havecarbattery: bool

  var gascan: Node3D

  var newgascan: Node3D

  var havegascan: bool

  var wrench: Node3D

  var newwrench: Node3D

  var havewrench: bool

  var sparkplug: Node3D

  var newsparkplug: Node3D

  var havesparkplug: bool

  var meat: Node3D

  var newmeat: Node3D

  var havemeat: bool

  var specialkey: Node3D

  var newspecialkey: Node3D

  var havespecialkey: bool

  var book: Node3D

  var newbook: Node3D

  var havebook: bool

  var pepperspray: Node3D

  var newpepperspray: Node3D

  var havepepperspray: bool

  var remote: Node3D

  var newremote: Node3D

  var haveremote: bool

  var birdSeed: Node3D

  var newbirdSeed: Node3D

  var havebirdSeed: bool

  var freezeTrap: Node3D

  var newfreezeTrap: Node3D

  var havefreezeTrap: bool

  var NeedShotgunText: Node3D

  var NeedhangLockKeyText: Node3D

  var NeedpadlockCodeText: Node3D

  var NeedhammerText: Node3D

  var NeedsafeKeyText: Node3D

  var NeedAvbitarTongText: Node3D

  var NeedHusnyckelText: Node3D

  var NeedCrossbowText: Node3D

  var NeedweaponKeyText: Node3D

  var NeedscrewdriverText: Node3D

  var NeedbatteryText: Node3D

  var NeedplayhouseKeyText: Node3D

  var cutThingsHereText: Node3D

  var NeedWinchhandleText: Node3D

  var NeedFindSwitchText: Node3D

  var missinTavelbitarText: Node3D

  var NeedcarKeyText: Node3D

  var NeedCarBatteryText: Node3D

  var NeedSparkPlugText: Node3D

  var emptyPlateText: Node3D

  var emptyBowlText: Node3D

  var NeedEnginePartText: Node3D

  var NeedWrenchText: Node3D

  var NeedGasolineText: Node3D

  var NeedSpecialKeyText: Node3D

  var NeedRemoteControlText: Node3D

  var CantopenDoorYetText: Node3D

  var SomethingMissingHereText: Node3D

  var somethingInsideMelonText: Node3D

  var ShotgunLoadedText: Node3D

  var MaybePutSomethingHereText: Node3D

  var MaybeUsePlanksText: Node3D

  var hangLockKeyText: Node3D

  var padlockCodeText: Node3D

  var hammerText: Node3D

  var safeKeyText: Node3D

  var AvbitarTongText: Node3D

  var HusnyckelText: Node3D

  var CrossbowText: Node3D

  var TranquilizerDartText: Node3D

  var weaponKeyText: Node3D

  var screwdriverText: Node3D

  var plankText: Node3D

  var batteryText: Node3D

  var tavelbitText: Node3D

  var playhouseKeyText: Node3D

  var melonText: Node3D

  var teddyText: Node3D

  var cogwheelText: Node3D

  var winchhandleText: Node3D

  var PartOfShotgunText: Node3D

  var ShotgunText: Node3D

  var AmmoText: Node3D

  var carKeyText: Node3D

  var EnginePartText: Node3D

  var SparkPlugText: Node3D

  var GasolineCanText: Node3D

  var CarBatteryText: Node3D

  var WrenchText: Node3D

  var MeatText: Node3D

  var specialKeyText: Node3D

  var bookText: Node3D

  var peppersprayText: Node3D

  var RemoteControlText: Node3D

  var BirdSeedText: Node3D

  var freezeTrapText: Node3D

  var textTimerOnOff: bool

  var textTimer: float
