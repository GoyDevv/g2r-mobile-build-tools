# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/CheckExitDoor.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name CheckExitDoor
extends Node  # TODO: was MonoBehaviour
  func _ready():

  func _process(_delta):
    if PlayerPrefs.GetInt("DiffData") == 1:
      if not easyDiff  and  PlayerPrefs.GetInt("twoLocksOnOff") == 1:
        ExtralockTimerHard()
        extraLockExtreme.SetActive(true)
        ExtralockTimer()
        easyDiff = true
    elif (PlayerPrefs.GetInt("DiffData") == 0:
      if not normalDiff:
        normalDiff = true
        if PlayerPrefs.GetInt("twoLocksOnOff") == 1:
          ExtralockTimerHard()
          extraLockExtreme.SetActive(true)
        ExtralockTimer()
    elif (PlayerPrefs.GetInt("DiffData") == 2:
      if not hardDiff:
        hardDiff = true
        if PlayerPrefs.GetInt("twoLocksOnOff") == 1:
          extraLockExtreme.SetActive(true)
        ExtralockTimer()
        ExtralockTimerHard()
    elif (PlayerPrefs.GetInt("DiffData") == 3:
      if not extremeDiff:
        extremeDiff = true
        ExtralockTimer()
        ExtralockTimerHard()
        extraLockExtreme.SetActive(true)
    elif (PlayerPrefs.GetInt("DiffData") == 4  and  !this.practiseDiff:
      practiseDiff = true
      if PlayerPrefs.GetInt("twoLocksOnOff") == 1:
        ExtralockTimerHard()
        extraLockExtreme.SetActive(true)
      ExtralockTimer()
      ((Collider)Granny.self.GetComponent(typeof(Collider))).enabled = false
      ((Renderer)GrannySkin.self.GetComponent(typeof(Renderer))).enabled = false
      GrannyBone.SetActive(false)

  func openExitdoor():
    if PlayerPrefs.GetInt("DiffData") == 2:
      if PlayerPrefs.GetInt("twoLocksOnOff") == 1:
        if lampa1ok  and  lampa2ok  and  planka1Bort  and  planka2Bort  and  hangLockBort  and  extraLockPlaced  and  DpadlockBort  and  batteryLockOk  and  extremeLockOk:
          playerStop = GameObject.Find("Main Camera")
          playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
          ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
          playerStopscript.enabled = false
          swipe.SetActive(false)
          joystick.SetActive(false)
          crouchButton.SetActive(false)
          trapButton.SetActive(false)
          removeBar.fillAmount = 0.0
          trapBar.SetActive(false)
          ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
          ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
          blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
          yield return new WaitForSeconds(5.0)
          SceneManager.LoadScene("EndScene")
        else:
          CantopenDoorYetText.SetActive(true)
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimerOnOff = true
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimer = 0.0
      elif (this.lampa1ok  and  this.lampa2ok  and  this.planka1Bort  and  this.planka2Bort  and  this.hangLockBort  and  this.extraLockPlaced  and  this.DpadlockBort  and  this.batteryLockOk:
        playerStop = GameObject.Find("Main Camera")
        playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
        playerStopscript.enabled = false
        swipe.SetActive(false)
        joystick.SetActive(false)
        crouchButton.SetActive(false)
        trapButton.SetActive(false)
        removeBar.fillAmount = 0.0
        trapBar.SetActive(false)
        ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
        blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
        yield return new WaitForSeconds(5.0)
        SceneManager.LoadScene("EndScene")
      else:
        CantopenDoorYetText.SetActive(true)
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimerOnOff = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimer = 0.0
    elif (PlayerPrefs.GetInt("DiffData") == 3:
      if lampa1ok  and  lampa2ok  and  planka1Bort  and  planka2Bort  and  hangLockBort  and  extraLockPlaced  and  DpadlockBort  and  batteryLockOk  and  extremeLockOk:
        playerStop = GameObject.Find("Main Camera")
        playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
        playerStopscript.enabled = false
        swipe.SetActive(false)
        joystick.SetActive(false)
        crouchButton.SetActive(false)
        trapButton.SetActive(false)
        removeBar.fillAmount = 0.0
        trapBar.SetActive(false)
        ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
        blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
        yield return new WaitForSeconds(5.0)
        SceneManager.LoadScene("EndScene")
      else:
        CantopenDoorYetText.SetActive(true)
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimerOnOff = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimer = 0.0
    elif (PlayerPrefs.GetInt("DiffData") == 1:
      if PlayerPrefs.GetInt("twoLocksOnOff") == 1:
        if lampa1ok  and  lampa2ok  and  planka1Bort  and  planka2Bort  and  hangLockBort  and  extraLockPlaced  and  DpadlockBort  and  batteryLockOk  and  extremeLockOk:
          playerStop = GameObject.Find("Main Camera")
          playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
          ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
          playerStopscript.enabled = false
          swipe.SetActive(false)
          joystick.SetActive(false)
          crouchButton.SetActive(false)
          trapButton.SetActive(false)
          removeBar.fillAmount = 0.0
          trapBar.SetActive(false)
          ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
          ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
          blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
          yield return new WaitForSeconds(5.0)
          SceneManager.LoadScene("EndScene")
        else:
          CantopenDoorYetText.SetActive(true)
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimerOnOff = true
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimer = 0.0
      elif (this.lampa1ok  and  this.lampa2ok  and  this.planka1Bort  and  this.planka2Bort  and  this.hangLockBort  and  !this.extraLockPlaced:
        playerStop = GameObject.Find("Main Camera")
        playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
        playerStopscript.enabled = false
        swipe.SetActive(false)
        joystick.SetActive(false)
        crouchButton.SetActive(false)
        trapButton.SetActive(false)
        removeBar.fillAmount = 0.0
        trapBar.SetActive(false)
        ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
        blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
        yield return new WaitForSeconds(5.0)
        SceneManager.LoadScene("EndScene")
      elif (this.lampa1ok  and  this.lampa2ok  and  this.planka1Bort  and  this.planka2Bort  and  this.hangLockBort  and  this.extraLockPlaced  and  this.DpadlockBort:
        playerStop = GameObject.Find("Main Camera")
        playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
        playerStopscript.enabled = false
        swipe.SetActive(false)
        joystick.SetActive(false)
        crouchButton.SetActive(false)
        trapButton.SetActive(false)
        removeBar.fillAmount = 0.0
        trapBar.SetActive(false)
        ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
        blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
        yield return new WaitForSeconds(5.0)
        SceneManager.LoadScene("EndScene")
      else:
        CantopenDoorYetText.SetActive(true)
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimerOnOff = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimer = 0.0
    elif (PlayerPrefs.GetInt("DiffData") == 0  or  PlayerPrefs.GetInt("DiffData") == 4:
      if PlayerPrefs.GetInt("twoLocksOnOff") == 1:
        if lampa1ok  and  lampa2ok  and  planka1Bort  and  planka2Bort  and  hangLockBort  and  extraLockPlaced  and  DpadlockBort  and  batteryLockOk  and  extremeLockOk:
          playerStop = GameObject.Find("Main Camera")
          playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
          ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
          ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
          ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
          playerStopscript.enabled = false
          swipe.SetActive(false)
          joystick.SetActive(false)
          crouchButton.SetActive(false)
          trapButton.SetActive(false)
          removeBar.fillAmount = 0.0
          trapBar.SetActive(false)
          ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
          ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
          blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
          yield return new WaitForSeconds(5.0)
          SceneManager.LoadScene("EndScene")
        else:
          CantopenDoorYetText.SetActive(true)
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimerOnOff = true
          ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimer = 0.0
      elif (this.lampa1ok  and  this.lampa2ok  and  this.planka1Bort  and  this.planka2Bort  and  this.hangLockBort  and  !this.extraLockPlaced:
        playerStop = GameObject.Find("Main Camera")
        playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
        playerStopscript.enabled = false
        swipe.SetActive(false)
        joystick.SetActive(false)
        crouchButton.SetActive(false)
        trapButton.SetActive(false)
        removeBar.fillAmount = 0.0
        trapBar.SetActive(false)
        ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
        blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
        yield return new WaitForSeconds(5.0)
        SceneManager.LoadScene("EndScene")
      elif (this.lampa1ok  and  this.lampa2ok  and  this.planka1Bort  and  this.planka2Bort  and  this.hangLockBort  and  this.extraLockPlaced  and  this.DpadlockBort:
        playerStop = GameObject.Find("Main Camera")
        playerStopscript = (MonoBehaviour)playerStop.GetComponent("CameraFollowExample")
        ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = false
        ((Footsteps)footstepScriptHolder.GetComponent(typeof(Footsteps))).stopwalk()
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).forwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).backwardSpeed = 0.0
        ((FPSControllerNEW)player.GetComponent(typeof(FPSControllerNEW))).sidestepSpeed = 0.0
        playerStopscript.enabled = false
        swipe.SetActive(false)
        joystick.SetActive(false)
        crouchButton.SetActive(false)
        trapButton.SetActive(false)
        removeBar.fillAmount = 0.0
        trapBar.SetActive(false)
        ((openDoors)dooropener.GetComponent(typeof(openDoors))).playerTaken = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).playerTaken = true
        ((soundEffects)soundHolder.GetComponent(typeof(soundEffects))).openExitDoor()
        blackScreenTexture.CrossFadeAlpha(1.0, 0.1, false)
        yield return new WaitForSeconds(5.0)
        SceneManager.LoadScene("EndScene")
      else:
        CantopenDoorYetText.SetActive(true)
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimerOnOff = true
        ((PickUp)seeHolder.GetComponent(typeof(PickUp))).textTimer = 0.0
    var break: Variant

  func ExtralockTimer():
    extraLockPlaced = true
    extraLock.SetActive(true)
    if PlayerPrefs.GetInt("randomNR") == 1:
      padlockCodePL2.SetActive(true)
    elif (PlayerPrefs.GetInt("randomNR") == 2:
      padlockCodePL3.SetActive(true)
    elif (PlayerPrefs.GetInt("randomNR") == 3:
      padlockCodePL4.SetActive(true)
    elif (PlayerPrefs.GetInt("randomNR") == 4:
      padlockCodePL5.SetActive(true)
    elif (PlayerPrefs.GetInt("randomNR") == 5:
      padlockCodePL1.SetActive(true)

  func ExtralockTimerHard():
    extraLockHard.SetActive(true)
    if PlayerPrefs.GetInt("randomNR") == 1:
      battery2.SetActive(true)
    elif (PlayerPrefs.GetInt("randomNR") == 2:
      battery3.SetActive(true)
    elif (PlayerPrefs.GetInt("randomNR") == 3:
      battery4.SetActive(true)
    elif (PlayerPrefs.GetInt("randomNR") == 4:
      battery5.SetActive(true)
    elif (PlayerPrefs.GetInt("randomNR") == 5:
      battery1.SetActive(true)

  var blackScreenTexture: Variant

  var Granny: Node3D

  var GrannySkin: Node3D

  var GrannyBone: Node3D

  var player: Node3D

  var playerStop: Node3D

  var playerStopscript: Variant

  var swipe: Node3D

  var footstepScriptHolder: Node3D

  var joystick: Node3D

  var crouchButton: Node3D

  var removeBar: Variant

  var trapButton: Node3D

  var trapBar: Node3D

  var dooropener: Node3D

  var seeHolder: Node3D

  var soundHolder: Node3D

  var fadeBlackSpeed: float

  var lampa1ok: bool

  var lampa2ok: bool

  var planka1Bort: bool

  var planka2Bort: bool

  var hangLockBort: bool

  var DpadlockBort: bool

  var batteryLockOk: bool

  var extremeLockOk: bool

  var CantopenDoorYetText: Node3D

  var gameController: Node3D

  var counter: float

  var ELtimer: float

  var startTimer: bool

  var extraLock: Node3D

  var extraLockHard: Node3D

  var extraLockExtreme: Node3D

  var extraLockOK: bool

  var extraLockPlaced: bool

  var padlockCodePL1: Node3D

  var padlockCodePL2: Node3D

  var padlockCodePL3: Node3D

  var padlockCodePL4: Node3D

  var padlockCodePL5: Node3D

  var battery1: Node3D

  var battery2: Node3D

  var battery3: Node3D

  var battery4: Node3D

  var battery5: Node3D

  var easyDiff: bool

  var normalDiff: bool

  var hardDiff: bool

  var extremeDiff: bool

  var practiseDiff: bool

  var ExtraLockOnDoorText: Node3D
