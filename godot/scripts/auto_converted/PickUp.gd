# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/PickUp.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name PickUp
extends Node  # TODO: was MonoBehaviour
  func _init():
    layerMask = 256

  func _ready():
    layerMask = ~layerMask

  func _process(_delta):
    var raycastHit := default(RaycastHit)
    var direction := this.SeeRay.transform.TransformDirection(Vector3.forward)
    if not playerTaken:
      if Physics.Raycast(SeeRay.transform.position, direction, out raycastHit, 5.0, layerMask):
        if raycastHit.collider.gameObject.tag == "avbitare":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          AvbitarTongText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveAvbitare = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            avbitare.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            AvbitarTongText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "hammer":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          hammerText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveHammare = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            hammare.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            hammerText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "vas":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havevas = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            vas.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "vas2":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havevas2 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            vas2.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "safekey":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          safeKeyText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havesafeKey = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            safeKey.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            safeKeyText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppNyckel)
        elif (raycastHit.collider.gameObject.tag == "exitkey":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          HusnyckelText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveexitKey = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            exitKey.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            HusnyckelText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppNyckel)
        elif (raycastHit.collider.gameObject.tag == "hanglockkey":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          hangLockKeyText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havehanglockKey = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            hanglockKey.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            hangLockKeyText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppNyckel)
        elif (raycastHit.collider.gameObject.tag == "dpadlockCode":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          padlockCodeText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havepadlockCode = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            padlockCode.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            padlockCodeText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "armborst":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          CrossbowText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havearmborst = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            armborst.SetActive(true)
            arrowButton.SetActive(false)
            arrowArmborst.SetActive(false)
            Armborstladdad.SetActive(false)
            ArmborstOladdad.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            CrossbowText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppCrossbow)
        elif (raycastHit.collider.gameObject.tag == "arrow":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          TranquilizerDartText.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havearmborst:
              if not ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveArrow:
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveArrow = true
                pickUp = false
                Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
                arrowButton.SetActive(true)
                shootArrowRay.SetActive(true)
                arrowArmborst.SetActive(true)
                Armborstladdad.SetActive(true)
                ArmborstOladdad.SetActive(false)
                mittenRing.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).armborstArrowOK = true
                TranquilizerDartText.SetActive(false)
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
                ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).CrossbowLoad()
              elif (((InventoryController)this.gameController.GetComponent(typeof(InventoryController))).haveArrow:
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveArrow = true
                pickUp = false
                Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
                arrowButton.SetActive(true)
                shootArrowRay.SetActive(true)
                arrowArmborst.SetActive(true)
                Armborstladdad.SetActive(true)
                ArmborstOladdad.SetActive(false)
                mittenRing.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).armborstArrowOK = true
                TranquilizerDartText.SetActive(false)
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
                Object.Instantiate<Transform>(newArrow, dropPoint.position, dropPoint.quaternion  # TODO: Unity->Godot rotation)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              NeedCrossbowText.SetActive(true)
              textTimerOnOff = true
        elif (raycastHit.collider.gameObject.tag == "weaponkey":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          weaponKeyText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveweaponKey = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            weaponKey.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            weaponKeyText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "screwdriver":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          screwdriverText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havescrewdriver = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            screwdriver.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            screwdriverText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "plankawalk":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          plankText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveplanka = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            planka.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            plankText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "battery":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          batteryText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebattery = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            battery.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            batteryText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "tb1":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          tavelbitText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb1 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            tb1.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            tavelbitText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "tb2":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          tavelbitText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb2 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            tb2.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            tavelbitText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "tb3":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          tavelbitText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb3 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            tb3.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            tavelbitText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "tb4":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          tavelbitText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetb4 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            tb4.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            tavelbitText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "playhousekey":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          playhouseKeyText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveplayhouseKey = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            playhouseKey.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            playhouseKeyText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppNyckel)
        elif (raycastHit.collider.gameObject.tag == "melon":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          melonText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havemelon = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            melon.SetActive(true)
            textTimer = 0.0
            if not haveSeenMelonText:
              haveSeenMelonText = true
              somethingInsideMelonText.SetActive(true)
              textTimerOnOff = true
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            melonText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "teddy":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          teddyText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveteddy = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            teddy.SetActive(true)
            ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = true
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            teddyText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(pickUpTeddy)
        elif (raycastHit.collider.gameObject.tag == "kugg1":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          cogwheelText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havekugg1 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            kugg1.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            cogwheelText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "kugg2":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          cogwheelText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havekugg2 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            kugg2.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            cogwheelText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "message":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havemessage = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            message.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "brunnsvevpickup":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          winchhandleText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebrunnsvev = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            brunnsvev.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            winchhandleText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "shotgun":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          ShotgunText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveoldShotgun = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            oldShotgun.SetActive(true)
            if oldShotgunLoaded:
              ammo.SetActive(true)
              oldShotgunAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Load")
              shootButton.SetActive(true)
              shootRay.SetActive(true)
              ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).loadedPickup()
            else:
              oldShotgunAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("OpenEmpty")
              shootButton.SetActive(false)
              shootRay.SetActive(false)
              ammo.SetActive(false)
              ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).emptyShotgun()
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            ShotgunText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "ammo":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          AmmoText.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveoldShotgun:
              if not oldShotgunLoaded:
                oldShotgunLoaded = true
                Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
                shootButton.SetActive(true)
                shootRay.SetActive(true)
                ammo.SetActive(true)
                oldShotgunAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Load")
                mittenRing.SetActive(false)
                AmmoText.SetActive(false)
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
                ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).loadShotgun()
              elif (this.oldShotgunLoaded:
                oldShotgunLoaded = true
                ShotgunLoadedText.SetActive(true)
                textTimerOnOff = true
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              NeedShotgunText.SetActive(true)
              textTimerOnOff = true
        elif (raycastHit.collider.gameObject.tag == "shotgunp1":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          PartOfShotgunText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel1 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            gunDel1.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            PartOfShotgunText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "shotgunp2":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          PartOfShotgunText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel2 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            gunDel2.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            PartOfShotgunText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "shotgunp3":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          PartOfShotgunText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegunDel3 = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            gunDel3.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            PartOfShotgunText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "carkey":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          carKeyText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havecarKey = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            carKey.SetActive(true)
            ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).playerHaveCarKey = true
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            carKeyText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "topplock":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          EnginePartText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetopplock = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            topplock.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            EnginePartText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "carbattery":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          CarBatteryText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havecarbattery = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            carbattery.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            CarBatteryText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "gascan":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          GasolineCanText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegascan = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            gascan.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            GasolineCanText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(pickUpGascan)
        elif (raycastHit.collider.gameObject.tag == "wrench":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          WrenchText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havewrench = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            wrench.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            WrenchText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "sparkplug":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          SparkPlugText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havesparkplug = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            sparkplug.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            SparkPlugText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "meat":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          MeatText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havemeat = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            meat.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            MeatText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "specialkey":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          specialKeyText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havespecialkey = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            specialkey.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            specialKeyText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "book":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          bookText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebook = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            book.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            bookText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "pepperspray":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          peppersprayText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havepepperspray = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            pepperspray.SetActive(true)
            ((sprayPepper)sprayButton.GetComponent(typeof(sprayPepper))).sprayTime = false
            sprayParticle.SetActive(false)
            sprayButton.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            peppersprayText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "remotecontrol":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          RemoteControlText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveremote = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            remote.SetActive(true)
            useRemoteButton.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            RemoteControlText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "birdseed":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          BirdSeedText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebirdSeed = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            birdSeed.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            BirdSeedText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "freezetrap":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          freezeTrapText.SetActive(true)
          if pickUp:
            pickUp = false
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).CheckInventory()
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havefreezeTrap = true
            Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            freezeTrap.SetActive(true)
            dropObjectButton.SetActive(true)
            mittenRing.SetActive(false)
            freezeTrapText.SetActive(false)
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(plockaUppObject)
        elif (raycastHit.collider.gameObject.tag == "bluekabel":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveAvbitare:
              if not playSound:
                playSound = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(klippKabel)
                LampaDoor1.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.0, 1.0, 0.0)
                ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).lampa1ok = true
                ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).counter = ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).counter + 1.0
              Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
              avklipptKabel.SetActive(true)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedAvbitarTongText.SetActive(true)
          audio()
        elif (raycastHit.collider.gameObject.tag == "bluekabelcellar":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveAvbitare:
              if not playSound:
                playSound = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(klippKabel)
                LampaDoor2.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.0, 1.0, 0.0)
                ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).lampa2ok = true
                ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).counter = ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).counter + 1.0
              Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
              avklipptKabelCellar.SetActive(true)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedAvbitarTongText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "bluekabelvind":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveAvbitare:
              if not playSound:
                playSound = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(klippKabel)
                fan.get_node(\"TODO_Animation\")  # TODO: GetComponent.Stop("FanSpinn")
                fanCollider.SetActive(false)
              Object.queue_free  # TODO: Destroy(KabelVind)
              avklipptKabelVind.SetActive(true)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedAvbitarTongText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "planka":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveHammare:
              if not playSound:
                if ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).planka1Bort:
                  playSound = true
                  Object.queue_free  # TODO: Destroy((HingeJoint)raycastHit.collider.self.GetComponent(typeof(HingeJoint)))
                  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(taBortPlanka)
                  ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).planka2Bort = true
                  ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).counter = ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).counter + 1.0
                  raycastHit.collider.self.tag = "Untagged"
                else:
                  ((Rigidbody)raycastHit.collider.self.GetComponent(typeof(Rigidbody))).isKinematic = false
                  playSound = true
                  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(taBortPlanka)
                  ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).planka1Bort = true
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedhammerText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "plankavind":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveHammare:
              ((Rigidbody)raycastHit.collider.self.GetComponent(typeof(Rigidbody))).isKinematic = false
              get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(taBortPlanka)
              raycastHit.collider.self.tag = "plankawalk"
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedhammerText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "exitdoor":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveexitKey:
              if not playSound:
                playSound = true
                StartCoroutine(((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).openExitdoor())
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(doorLocked)
              NeedHusnyckelText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "hanglock":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havehanglockKey:
              if not playSound:
                playSound = true
                ((Rigidbody)raycastHit.collider.self.GetComponent(typeof(Rigidbody))).isKinematic = false
                ((Rigidbody)Bom.self.GetComponent(typeof(Rigidbody))).isKinematic = false
                ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).hangLockBort = true
                ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).counter = ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).counter + 1.0
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(klippKabel)
                raycastHit.collider.self.tag = "Untagged"
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedhangLockKeyText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "hanglockgarage":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havehanglockKey:
              if not playSound:
                playSound = true
                ((Rigidbody)raycastHit.collider.self.GetComponent(typeof(Rigidbody))).isKinematic = false
                ((openDoors)doorRayHolder.GetComponent(typeof(openDoors))).garageportLock = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(klippKabel)
                raycastHit.collider.self.tag = "Untagged"
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedhangLockKeyText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "phpadlock":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveplayhouseKey:
              if not playSound:
                playSound = true
                ((Rigidbody)raycastHit.collider.self.GetComponent(typeof(Rigidbody))).isKinematic = false
                playhouseDoor.self.tag = "innerdoorClosed"
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(klippKabel)
                raycastHit.collider.self.tag = "Untagged"
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedplayhouseKeyText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "dpadlock":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havepadlockCode:
              if not playSound:
                playSound = true
                ((Rigidbody)raycastHit.collider.self.GetComponent(typeof(Rigidbody))).isKinematic = false
                DdoorLock.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("DlockAnim")
                ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).DpadlockBort = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(klippKabel)
                raycastHit.collider.self.tag = "Untagged"
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedpadlockCodeText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "batteryholder":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebattery:
              if not playSound:
                playSound = true
                raycastHit.collider.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BatteryLockOpen")
                ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).batteryLockOk = true
                batterySpak.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BattSpakOK")
                battery.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebattery = false
                batteryOnPlace.SetActive(true)
                dropObjectButton.SetActive(false)
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(placeBattery)
                raycastHit.collider.self.tag = "Untagged"
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              textTimerOnOff = true
              NeedbatteryText.SetActive(true)
              batterySpak.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("BattSpakNotOK")
          audio()
        elif (raycastHit.collider.gameObject.tag == "safedoor":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havesafeKey:
              if not playSound:
                playSound = true
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("safeDoorOpen")
                raycastHit.collider.self.tag = "Untagged"
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(safeDoorOpen)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(safeDoordoorLocked)
              NeedsafeKeyText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "vapenskopdoor":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveweaponKey:
              if not playSound:
                playSound = true
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VapenDoorOpen")
                raycastHit.collider.self.tag = "Untagged"
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(vapenDoorOpen)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(safeDoordoorLocked)
              NeedweaponKeyText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "tavelbitar":
          if not ((startNewDay)gameController.GetComponent(typeof(startNewDay))).allaTavelbitarOnPlace:
            pickUpButton.SetActive(true)
            mittenRing.SetActive(true)
            if pickUp:
              pickUp = false
              missinTavelbitarText.SetActive(true)
              textTimerOnOff = true
          else:
            pickUpButton.SetActive(false)
            mittenRing.SetActive(false)
        elif (raycastHit.collider.gameObject.tag == "screw1":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havescrewdriver:
              if not playSound:
                playSound = true
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Screw1Open")
                raycastHit.collider.self.tag = "Untagged"
                ((skruvplatta)skruvPlatta.GetComponent(typeof(skruvplatta))).skruv1 = true
                StartCoroutine(((skruvplatta)skruvPlatta.GetComponent(typeof(skruvplatta))).Screw1Bort())
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedscrewdriverText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "screw2":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havescrewdriver:
              if not playSound:
                playSound = true
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Screw2Open")
                raycastHit.collider.self.tag = "Untagged"
                ((skruvplatta)skruvPlatta.GetComponent(typeof(skruvplatta))).skruv2 = true
                StartCoroutine(((skruvplatta)skruvPlatta.GetComponent(typeof(skruvplatta))).Screw2Bort())
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedscrewdriverText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "camera":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveHammare:
              if not playSound:
                playSound = true
                kamera.SetActive(false)
                kameraBroken.SetActive(true)
                if not playerInPrison:
                  kameraSeeTrigger.SetActive(false)
                  galler.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
                  gallerColliders.SetActive(false)
                raycastHit.collider.self.tag = "Untagged"
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(hitCam)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              textTimerOnOff = true
              NeedhammerText.SetActive(true)
          audio()
        elif (raycastHit.collider.gameObject.tag == "giljocutarea":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havemelon:
              if not playSound:
                playSound = true
                giljoCutArea.SetActive(false)
                melonInPlace.SetActive(true)
                ((giljotinTrigger)giljotin.GetComponent(typeof(giljotinTrigger))).meloninPlace = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(placeMelon)
                melon.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havemelon = false
                pickUp = false
                dropObject = false
                dropObjectButton.SetActive(false)
                mittenRing.SetActive(false)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              cutThingsHereText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "stortkugg":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havekugg1:
              if not playSound:
                playSound = true
                kugg1inPlace.SetActive(true)
                kugg1OK = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(placebrunnsvev)
                kugg1.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havekugg1 = false
                pickUp = false
                dropObject = false
                dropObjectButton.SetActive(false)
                mittenRing.SetActive(false)
                if kugg2OK:
                  playHouseLucka.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("openToyLock")
                  raycastHit.collider.self.tag = "Untagged"
            elif (((InventoryController)this.gameController.GetComponent(typeof(InventoryController))).havekugg2:
              if not playSound:
                playSound = true
                kugg2inPlace.SetActive(true)
                kugg2OK = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(placebrunnsvev)
                kugg2.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havekugg2 = false
                pickUp = false
                dropObject = false
                dropObjectButton.SetActive(false)
                mittenRing.SetActive(false)
                if kugg1OK:
                  playHouseLucka.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("openToyLock")
                  raycastHit.collider.self.tag = "Untagged"
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              SomethingMissingHereText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "brunn":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebrunnsvev:
              if not playSound:
                playSound = true
                brunnsvevInPlace.SetActive(true)
                pickUpButton.SetActive(false)
                ((playerVevar)brunnsvevsHolder.GetComponent(typeof(playerVevar))).vevInPlace = true
                raycastHit.collider.self.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(placebrunnsvev)
                brunnsvev.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebrunnsvev = false
                pickUp = false
                dropObject = false
                dropObjectButton.SetActive(false)
                mittenRing.SetActive(false)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedWinchhandleText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "screwout1":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havescrewdriver:
              if not playSound:
                playSound = true
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("ELscrew")
                raycastHit.collider.self.tag = "Untagged"
                ((skruvplattaOutside)skruvPlattaOutside.GetComponent(typeof(skruvplattaOutside))).skruv1 = true
                StartCoroutine(((skruvplattaOutside)skruvPlattaOutside.GetComponent(typeof(skruvplattaOutside))).Screw1Bort())
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedscrewdriverText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "screwout2":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havescrewdriver:
              if not playSound:
                playSound = true
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("ELscrew")
                raycastHit.collider.self.tag = "Untagged"
                ((skruvplattaOutside)skruvPlattaOutside.GetComponent(typeof(skruvplattaOutside))).skruv2 = true
                StartCoroutine(((skruvplattaOutside)skruvPlattaOutside.GetComponent(typeof(skruvplattaOutside))).Screw2Bort())
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedscrewdriverText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "screwout3":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havescrewdriver:
              if not playSound:
                playSound = true
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("ELscrew")
                raycastHit.collider.self.tag = "Untagged"
                ((skruvplattaOutside)skruvPlattaOutside.GetComponent(typeof(skruvplattaOutside))).skruv3 = true
                StartCoroutine(((skruvplattaOutside)skruvPlattaOutside.GetComponent(typeof(skruvplattaOutside))).Screw3Bort())
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedscrewdriverText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "screwout4":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havescrewdriver:
              if not playSound:
                playSound = true
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("ELscrew")
                raycastHit.collider.self.tag = "Untagged"
                ((skruvplattaOutside)skruvPlattaOutside.GetComponent(typeof(skruvplattaOutside))).skruv4 = true
                StartCoroutine(((skruvplattaOutside)skruvPlattaOutside.GetComponent(typeof(skruvplattaOutside))).Screw4Bort())
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedscrewdriverText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "topplocksskruv":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havewrench:
              if not playSound:
                playSound = true
                ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).topplocksskruvar = ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).topplocksskruvar + 1.0
                Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(skruva)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedWrenchText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "topplockPlace":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetopplock:
              if not playSound:
                playSound = true
                ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).topplockOK = true
                topplockInPlace.SetActive(true)
                topplock.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havetopplock = false
                dropObjectButton.SetActive(false)
                Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(drarIspak)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedEnginePartText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "carbatteryPlace":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havecarbattery:
              if not playSound:
                playSound = true
                ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).batteryOK = true
                carbatteryInPlace.SetActive(true)
                carbattery.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havecarbattery = false
                Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
                dropObjectButton.SetActive(false)
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(drarIspak)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedCarBatteryText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "fueltankPlace":
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if not ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havegascan  and  not playSound:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              playSound = true
              textTimer = 0.0
              NeedGasolineText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "sparkplugPlace":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havesparkplug:
              if not playSound:
                playSound = true
                ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).sparkplugOK = true
                sparkPlugInPlace.SetActive(true)
                sparkPlugCable.SetActive(false)
                sparkplug.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havesparkplug = false
                dropObjectButton.SetActive(false)
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(drarIspak)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedSparkPlugText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "platevind":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havemeat:
              if not playSound:
                playSound = true
                if spider.activeSelf:
                  ((spiderControll)spider.GetComponent(typeof(spiderControll))).foodTime = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(meatPlate)
                meatOnPlate.SetActive(true)
                spiderTrigger.SetActive(false)
                meat.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havemeat = false
                dropObjectButton.SetActive(false)
                Object.queue_free  # TODO: Destroy(raycastHit.collider.self)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              emptyPlateText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "vind2lock":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havespecialkey:
              if not playSound:
                playSound = true
                specialkeyLock.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("vind2LockOpen")
                specialkeyDoor.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("vind2DoorOpen")
                specialkeyLock.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(vind2Lockopen)
                specialkeyDoor.get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(vind2Dooropen)
                specialkeyInPlace.SetActive(true)
                specialkey.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havespecialkey = false
                dropObjectButton.SetActive(false)
                raycastHit.collider.self.tag = "Untagged"
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              NeedSpecialKeyText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "bookplace":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebook:
              if not playSound:
                playSound = true
                secretWall.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("fakeWallMove")
                bookInPlace.SetActive(true)
                book.SetActive(false)
                ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebook = false
                dropObjectButton.SetActive(false)
                raycastHit.collider.self.tag = "Untagged"
                if not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByArrow  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).hitByPepper  and  not ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).freeze:
                  Granny.SetActive(false)
                  Granny.position = GrannyStartPos.position
                  Granny.SetActive(true)
                ((startNewDay)gameController.GetComponent(typeof(startNewDay))).slendrinaMomAppeard = true
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              MaybePutSomethingHereText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "spak":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if not playSound:
              playSound = true
              raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Spak")
              raycastHit.collider.self.tag = "Untagged"
              ((CheckExitDoor)gameController.GetComponent(typeof(CheckExitDoor))).extremeLockOk = true
              extremeLockOn.SetActive(false)
              extremeLockOff.SetActive(true)
              get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(drarIspak)
          audio()
        elif (raycastHit.collider.gameObject.tag == "lockmotor":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
            pickUp = false
            textTimer = 0.0
            NeedFindSwitchText.SetActive(true)
            textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "remoteLock":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp  and  not ((InventoryController)gameController.GetComponent(typeof(InventoryController))).haveremote:
            ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
            pickUp = false
            textTimer = 0.0
            NeedRemoteControlText.SetActive(true)
            textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "birdseedplate":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if ((InventoryController)gameController.GetComponent(typeof(InventoryController))).havebirdSeed:
              if not playSound:
                playSound = true
                raycastHit.collider.self.tag = "Untagged"
                ((CrowControl)crow.GetComponent(typeof(CrowControl))).CrowStartEat = true
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.PlayOneShot(fillSeed)
            else:
              ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()
              textTimer = 0.0
              emptyBowlText.SetActive(true)
              textTimerOnOff = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "sprint1":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if not playSound:
              playSound = true
              raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("sprintAnim")
              raycastHit.collider.self.tag = "Untagged"
              ((prisonDoorOpenClose)prisonDoor.GetComponent(typeof(prisonDoorOpenClose))).sprint1Bort = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "prisondoorlocked":
          mittenRing.SetActive(false)
          pickUp = false
        elif (raycastHit.collider.gameObject.tag == "sprint2":
          pickUpButton.SetActive(true)
          mittenRing.SetActive(true)
          if pickUp:
            pickUp = false
            if not playSound:
              playSound = true
              raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("sprintAnim")
              raycastHit.collider.self.tag = "Untagged"
              ((prisonDoorOpenClose)prisonDoor.GetComponent(typeof(prisonDoorOpenClose))).sprint2Bort = true
          audio()
        elif (raycastHit.collider.gameObject.tag == "Untagged":
          pickUpButton.SetActive(false)
          mittenRing.SetActive(false)
          ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoObjectText()
        elif (raycastHit.collider.gameObject.tag == "golv":
          ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoObjectText()
        elif (raycastHit.collider.gameObject.tag == "grus":
          ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoObjectText()
        elif (raycastHit.collider.gameObject.tag == "car":
          ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoObjectText()
        elif (raycastHit.collider.gameObject.tag == "smalldoorLocked":
          pickUpButton.SetActive(false)
          RemoteControlText.SetActive(false)
        else:
          ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoObjectText()
      else:
        pickUpButton.SetActive(false)
        mittenRing.SetActive(false)
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoObjectText()
    else:
      pickUpButton.SetActive(false)
    if textTimerOnOff:
      textTimer += Time.deltaTime
      if textTimer > 3.0:
        textTimerOnOff = false
        textTimer = 0.0
        ((InventoryController)gameController.GetComponent(typeof(InventoryController))).NoText()

  func audio():
    playSound = false

  var gameController: Node3D

  var Granny: Node3D

  var GrannyStartPos: Node3D

  var SeeRay: Node3D

  var layerMask: int

  var playerTaken: bool

  var pickUp: bool

  var dropObject: bool

  var placeObject: bool

  var pickUpButton: Node3D

  var dropPoint: Node3D

  var dropPointPlanka: Node3D

  var dropObjectButton: Node3D

  var placeObjectButton: Node3D

  var soundHolder: Node3D

  var SpraysoundHolder: Node3D

  var mittenRing: Node3D

  var avklipptKabelCellar: Node3D

  var avklipptKabelVind: Node3D

  var KabelVind: Node3D

  var avklipptKabel: Node3D

  var fan: Node3D

  var fanCollider: Node3D

  var playSound: bool

  var klippKabel: Variant

  var taBortPlanka: Variant

  var doorLocked: Variant

  var safeDoordoorLocked: Variant

  var safeDoorOpen: Variant

  var vapenDoorOpen: Variant

  var hitCam: Variant

  var plockaUppObject: Variant

  var plockaUppNyckel: Variant

  var plockaUppCrossbow: Variant

  var placeBattery: Variant

  var pickUpTeddy: Variant

  var placebrunnsvev: Variant

  var placeMelon: Variant

  var drarIspak: Variant

  var meatPlate: Variant

  var vind2Dooropen: Variant

  var vind2Lockopen: Variant

  var pickUpGascan: Variant

  var skruva: Variant

  var fillSeed: Variant

  var LampaDoor1: Node3D

  var LampaDoor2: Node3D

  var doorRayHolder: Node3D

  var Bom: Node3D

  var DdoorLock: Node3D

  var arrowButton: Node3D

  var arrowArmborst: Node3D

  var Armborstladdad: Node3D

  var ArmborstOladdad: Node3D

  var avbitare: Node3D

  var newAvbitare: Node3D

  var hammare: Node3D

  var newHammare: Node3D

  var vas: Node3D

  var newvas: Node3D

  var vas2: Node3D

  var newvas2: Node3D

  var safeKey: Node3D

  var newsafeKey: Node3D

  var exitKey: Node3D

  var newexitKey: Node3D

  var hanglockKey: Node3D

  var newhanglockKey: Node3D

  var padlockCode: Node3D

  var newpadlockCode: Node3D

  var armborst: Node3D

  var newarmborst: Node3D

  var newArrow: Node3D

  var shootArrowRay: Node3D

  var weaponKey: Node3D

  var newweaponKey: Node3D

  var screwdriver: Node3D

  var newscrewdriver: Node3D

  var planka: Node3D

  var newplanka: Node3D

  var battery: Node3D

  var newbattery: Node3D

  var playhouseKey: Node3D

  var newplayhouseKey: Node3D

  var carKey: Node3D

  var newcarKey: Node3D

  var melon: Node3D

  var newmelon: Node3D

  var teddy: Node3D

  var newteddy: Node3D

  var kugg1: Node3D

  var newkugg1: Node3D

  var kugg2: Node3D

  var newkugg2: Node3D

  var message: Node3D

  var newmessage: Node3D

  var brunnsvev: Node3D

  var newbrunnsvev: Node3D

  var oldShotgun: Node3D

  var oldShotgunAnim: Node3D

  var newoldShotgun: Node3D

  var oldShotgunLoaded: bool

  var shootButton: Node3D

  var shootRay: Node3D

  var ammo: Node3D

  var gunDel1: Node3D

  var newgunDel1: Node3D

  var gunDel2: Node3D

  var newgunDel2: Node3D

  var gunDel3: Node3D

  var newgunDel3: Node3D

  var topplock: Node3D

  var newtopplock: Node3D

  var topplockInPlace: Node3D

  var carbattery: Node3D

  var newcarbattery: Node3D

  var carbatteryInPlace: Node3D

  var gascan: Node3D

  var newgascan: Node3D

  var wrench: Node3D

  var newwrench: Node3D

  var sparkplug: Node3D

  var newsparkplug: Node3D

  var sparkPlugInPlace: Node3D

  var sparkPlugCable: Node3D

  var meat: Node3D

  var newmeat: Node3D

  var spider: Node3D

  var meatOnPlate: Node3D

  var spiderTrigger: Node3D

  var specialkey: Node3D

  var newspecialkey: Node3D

  var specialkeyLock: Node3D

  var specialkeyDoor: Node3D

  var specialkeyInPlace: Node3D

  var book: Node3D

  var newbook: Node3D

  var pepperspray: Node3D

  var newpepperspray: Node3D

  var remote: Node3D

  var newremote: Node3D

  var birdSeed: Node3D

  var newbirdSeed: Node3D

  var freezeTrap: Node3D

  var newfreezeTrap: Node3D

  var sprayButton: Node3D

  var sprayParticle: Node3D

  var useRemoteButton: Node3D

  var secretWall: Node3D

  var bookInPlace: Node3D

  var plankaHighlighted: bool

  var highlightedPlanka: Node3D

  var highlightedPlankaTrigger: Node3D

  var plankaHole: Node3D

  var skruvPlatta: Node3D

  var skruvPlattaOutside: Node3D

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

  var ShotgunLoadedText: Node3D

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

  var MaybePutSomethingHereText: Node3D

  var CantopenDoorYetText: Node3D

  var kamera: Node3D

  var kameraBroken: Node3D

  var kameraSeeTrigger: Node3D

  var galler: Node3D

  var gallerColliders: Node3D

  var playerInPrison: bool

  var prisonDoor: Node3D

  var batteryOnPlace: Node3D

  var batterySpak: Node3D

  var tb1: Node3D

  var newtb1: Node3D

  var tb2: Node3D

  var newtb2: Node3D

  var tb3: Node3D

  var newtb3: Node3D

  var tb4: Node3D

  var newtb4: Node3D

  var playhouseDoor: Node3D

  var giljoCutArea: Node3D

  var melonInPlace: Node3D

  var giljotin: Node3D

  var somethingInsideMelonText: Node3D

  var haveSeenMelonText: bool

  var kugg1OK: bool

  var kugg2OK: bool

  var playHouseLucka: Node3D

  var SomethingMissingHereText: Node3D

  var kugg1inPlace: Node3D

  var kugg2inPlace: Node3D

  var brunnsvevInPlace: Node3D

  var brunnsvevsHolder: Node3D

  var extremeLockOn: Node3D

  var extremeLockOff: Node3D

  var crow: Node3D

  var textTimerOnOff: bool

  var textTimer: float
