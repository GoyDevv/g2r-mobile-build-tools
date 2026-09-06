# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/startNewDay.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name startNewDay
extends Node  # TODO: was MonoBehaviour
  func _ready():
    if PlayerPrefs.GetInt("DiffData") == 0:
      KnarrandeGolv.SetActive(true)
      tavla.SetActive(true)
      RandomNRTavelbitar = Random.Range(1, 4)
      if RandomNRTavelbitar == 1.0:
        tavelBitPlace1.SetActive(true)
      elif (this.RandomNRTavelbitar == 2f:
        tavelBitPlace2.SetActive(true)
      elif (this.RandomNRTavelbitar == 3f:
        tavelBitPlace3.SetActive(true)
    elif (PlayerPrefs.GetInt("DiffData") == 1:
      KnarrandeGolv.SetActive(false)
      tavla.SetActive(true)
      RandomNRTavelbitar = Random.Range(1, 4)
      if RandomNRTavelbitar == 1.0:
        tavelBitPlace1.SetActive(true)
      elif (this.RandomNRTavelbitar == 2f:
        tavelBitPlace2.SetActive(true)
      elif (this.RandomNRTavelbitar == 3f:
        tavelBitPlace3.SetActive(true)
    elif (PlayerPrefs.GetInt("DiffData") == 2:
      KnarrandeGolv.SetActive(true)
    elif (PlayerPrefs.GetInt("DiffData") == 3:
      KnarrandeGolvExtreme.SetActive(true)
      KnarrandeGolv.SetActive(false)
    elif (PlayerPrefs.GetInt("DiffData") == 4:
      KnarrandeGolv.SetActive(true)
      tavla.SetActive(true)
      GrannyMessage.SetActive(true)
      RandomNRTavelbitar = Random.Range(1, 4)
      if RandomNRTavelbitar == 1.0:
        tavelBitPlace1.SetActive(true)
      elif (this.RandomNRTavelbitar == 2f:
        tavelBitPlace2.SetActive(true)
      elif (this.RandomNRTavelbitar == 3f:
        tavelBitPlace3.SetActive(true)
    var SlideData := (saveSensitivityData)this.savedValue.GetComponent(typeof(saveSensitivityData))
    if PlayerPrefs.GetInt("slideData") == 0:
      SlideData.sliderValue = 150.0
    else:
      SlideData.sliderValue = PlayerPrefs.GetInt("slideData")
    if PlayerPrefs.GetInt("randomNR") == 0:
      RandomNR = Random.Range(1, 6)
      if RandomNR == 1.0:
        OP1.SetActive(true)
        OP1_2.SetActive(true)
        OP1_3.SetActive(true)
        OP1_4.SetActive(true)
        OP1_5.SetActive(true)
        OP1_6.SetActive(true)
        OP1_7.SetActive(true)
        PlayerPrefs.SetInt("randomNR", 1)
      elif (this.RandomNR == 2f:
        OP2.SetActive(true)
        OP2_2.SetActive(true)
        OP2_3.SetActive(true)
        OP2_4.SetActive(true)
        OP2_5.SetActive(true)
        PlayerPrefs.SetInt("randomNR", 2)
      elif (this.RandomNR == 3f:
        OP3.SetActive(true)
        OP3_2.SetActive(true)
        OP3_3.SetActive(true)
        OP3_4.SetActive(true)
        OP3_5.SetActive(true)
        OP3_6.SetActive(true)
        PlayerPrefs.SetInt("randomNR", 3)
      elif (this.RandomNR == 4f:
        OP4.SetActive(true)
        OP4_2.SetActive(true)
        OP4_3.SetActive(true)
        OP4_4.SetActive(true)
        OP4_5.SetActive(true)
        OP4_6.SetActive(true)
        OP4_7.SetActive(true)
        PlayerPrefs.SetInt("randomNR", 4)
      elif (this.RandomNR == 5f:
        OP5.SetActive(true)
        OP5_2.SetActive(true)
        OP5_3.SetActive(true)
        OP5_4.SetActive(true)
        OP5_5.SetActive(true)
        OP5_6.SetActive(true)
        OP5_7.SetActive(true)
        PlayerPrefs.SetInt("randomNR", 5)
    elif (PlayerPrefs.GetInt("randomNR") == 1:
      OP1.SetActive(true)
      OP1_2.SetActive(true)
      OP1_3.SetActive(true)
      OP1_4.SetActive(true)
      OP1_5.SetActive(true)
      OP1_6.SetActive(true)
      OP1_7.SetActive(true)
      PlayerPrefs.SetInt("randomNR", 2)
    elif (PlayerPrefs.GetInt("randomNR") == 2:
      OP2.SetActive(true)
      OP2_2.SetActive(true)
      OP2_3.SetActive(true)
      OP2_4.SetActive(true)
      OP2_5.SetActive(true)
      PlayerPrefs.SetInt("randomNR", 3)
    elif (PlayerPrefs.GetInt("randomNR") == 3:
      OP3.SetActive(true)
      OP3_2.SetActive(true)
      OP3_3.SetActive(true)
      OP3_4.SetActive(true)
      OP3_5.SetActive(true)
      OP3_6.SetActive(true)
      PlayerPrefs.SetInt("randomNR", 4)
    elif (PlayerPrefs.GetInt("randomNR") == 4:
      OP4.SetActive(true)
      OP4_2.SetActive(true)
      OP4_3.SetActive(true)
      OP4_4.SetActive(true)
      OP4_5.SetActive(true)
      OP4_6.SetActive(true)
      OP4_7.SetActive(true)
      PlayerPrefs.SetInt("randomNR", 5)
    elif (PlayerPrefs.GetInt("randomNR") == 5:
      OP5.SetActive(true)
      OP5_2.SetActive(true)
      OP5_3.SetActive(true)
      OP5_4.SetActive(true)
      OP5_5.SetActive(true)
      OP5_6.SetActive(true)
      OP5_7.SetActive(true)
      PlayerPrefs.SetInt("randomNR", 1)
    if daysCounter == 0.0:
      daysCounter = 1.0
    if PlayerPrefs.GetInt("fogOnExtreme") == 1:
      RenderSettings.fog = true
    elif (PlayerPrefs.GetInt("fogOnOff") == 1:
      RenderSettings.fog = true
    else:
      RenderSettings.fog = false
    yield return new WaitForSeconds(5.0)
    ((SoundEffectsPlayerInBed)soundHolder.GetComponent(typeof(SoundEffectsPlayerInBed))).startTextSound()
    yield return StartCoroutine(FadeText1(0.0, 1.0, 2.0))
    yield return new WaitForSeconds(2.0)
    fadeTextSpeed = 1.0
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
    yield return StartCoroutine(FadeText1(1.0, 0.0, 2.0))
    day1Text.SetActive(false)
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerInBed")
    kliverUrBedLjud.SetActive(true)
    if PlayerPrefs.GetInt("NightMareOnOff") == 1:
      bloodHanging.SetActive(true)
      rats.SetActive(true)
    else:
      bloodHanging.SetActive(false)
      rats.SetActive(false)
    if PlayerPrefs.GetInt("musikOnOff") == 0:
      if PlayerPrefs.GetInt("NightMareOnOff") == 1:
        musicHolderNightmare.SetActive(true)
      else:
        musicHolder.SetActive(true)
    blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
    yield return new WaitForSeconds(11.0)
    playerInBed.SetActive(false)
    Player.SetActive(true)
    if PlayerPrefs.GetInt("fogOnOff") == 1:
      clipPlaneHolder.get_node(\"TODO_Camera\")  # TODO: GetComponent.farClipPlane = 18.0
    else:
      clipPlaneHolder.get_node(\"TODO_Camera\")  # TODO: GetComponent.farClipPlane = 35.0
    joystick.SetActive(true)
    yield return StartCoroutine(FadeJoy(0.0, 0.5, 2.0))
    var a := 0.5
    var color := this.joystickTexture.color
    color.a = a
    joystickTexture.color = color
    var a2 := 0.5
    var color2 := this.joystickRingTexture.color
    color2.a = a2
    joystickRingTexture.color = color2
    crouchButton.SetActive(true)
    optionButton.SetActive(true)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = true
    mittPrick.SetActive(true)
    kliverUrBedLjud.SetActive(false)
    var break: Variant

  func _process(_delta):
    if not allaTavelbitarOnPlace  and  tavelbit1  and  tavelbit2  and  tavelbit3  and  tavelbit4:
      allaTavelbitarOnPlace = true
      ((GrannyGoneText)playerGetExtraDay.GetComponent(typeof(GrannyGoneText))).textOnOff = true

  func FadeText1(startLevel: float, endLevel: float, duration: float):
    for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
    var a := Mathf.Lerp(startLevel, endLevel, t)
    var color := this.day1.color
    color.a = a
    day1.color = color
    yield return null
  var break: Variant

func FadeText2(startLevel: float, endLevel: float, duration: float):
  for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
  var a := Mathf.Lerp(startLevel, endLevel, t)
  var color := this.day2.color
  color.a = a
  day2.color = color
  yield return null
var break: Variant

func FadeText3(startLevel: float, endLevel: float, duration: float):
  for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
  var a := Mathf.Lerp(startLevel, endLevel, t)
  var color := this.day3.color
  color.a = a
  day3.color = color
  yield return null
var break: Variant

func FadeText4(startLevel: float, endLevel: float, duration: float):
  for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
  var a := Mathf.Lerp(startLevel, endLevel, t)
  var color := this.day4.color
  color.a = a
  day4.color = color
  yield return null
var break: Variant

func FadeText5(startLevel: float, endLevel: float, duration: float):
  for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
  var a := Mathf.Lerp(startLevel, endLevel, t)
  var color := this.day5.color
  color.a = a
  day5.color = color
  yield return null
var break: Variant

func FadeText5LD(startLevel: float, endLevel: float, duration: float):
  for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
  var a := Mathf.Lerp(startLevel, endLevel, t)
  var color := this.day5LastDay.color
  color.a = a
  day5LastDay.color = color
  yield return null
var break: Variant

func FadeText6(startLevel: float, endLevel: float, duration: float):
  for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
  var a := Mathf.Lerp(startLevel, endLevel, t)
  var color := this.day6.color
  color.a = a
  day6.color = color
  yield return null
var break: Variant

func FadeJoy(startLevel: float, endLevel: float, duration: float):
  for (float t = 0.0 t < 1.0 t += Time.deltaTime * fadeTextSpeed) {
  var a := Mathf.Lerp(startLevel, endLevel, t)
  var color := this.joystickTexture.color
  color.a = a
  joystickTexture.color = color
  yield return null
var break: Variant

func newDay():
  daysCounter += 1.0
  if daysCounter == 2.0:
    fadeTextSpeed = 3.0
    ((SoundEffectsPlayerInBed)soundHolder.GetComponent(typeof(SoundEffectsPlayerInBed))).startTextSound()
    yield return StartCoroutine(FadeText2(0.0, 1.0, 2.0))
    yield return new WaitForSeconds(2.0)
    if not slendrinaAppeard  and  GameObject.Find("Teddy(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Teddy(Clone)"))
      Object.Instantiate<GameObject>(Teddy, TeddyPos.position, TeddyPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Teddy(Clone)").self  # TODO: was transform.name = "Teddy"
    fadeTextSpeed = 1.0
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
    yield return StartCoroutine(FadeText2(1.0, 0.0, 2.0))
    day2Text.SetActive(false)
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerInBed2")
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = 1.0
    kliverUrBedLjud.SetActive(true)
    blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
    yield return new WaitForSeconds(11.0)
    playerInBed.SetActive(false)
    Player.SetActive(true)
    haveToLeaveText.SetActive(true)
    ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).day2 = true
    ((Footsteps)playerCam.GetComponent(typeof(Footsteps))).day2 = true
    joystick.SetActive(true)
    yield return StartCoroutine(FadeJoy(0.0, 0.5, 2.0))
    var a := 0.5
    var color := this.joystickTexture.color
    color.a = a
    joystickTexture.color = color
    var a2 := 0.5
    var color2 := this.joystickRingTexture.color
    color2.a = a2
    joystickRingTexture.color = color2
    crouchButton.SetActive(true)
    optionButton.SetActive(true)
    allBedButtons.SetActive(true)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = true
    ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerBed = 0.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerNearGranny = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
    GrannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.588, 0.588, 0.588)
    mittPrick.SetActive(true)
    kliverUrBedLjud.SetActive(false)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimeOff = false
  elif (this.daysCounter == 3f:
    if PlayerPrefs.GetInt("ADSon") == 0:
      //				if (Advertisement.IsReady())
      //				{
      //					AdManager.Instance.ShowRegularAds(new Action<ShowResult>(OnAdClosed))
      //				}
      //				else {
      fadeTextSpeed = 3.0
      ((SoundEffectsPlayerInBed)soundHolder.GetComponent(typeof(SoundEffectsPlayerInBed))).startTextSound()
      yield return StartCoroutine(FadeText3(0.0, 1.0, 2.0))
      yield return new WaitForSeconds(2.0)
      if not slendrinaAppeard  and  GameObject.Find("Teddy(Clone)"):
        Object.queue_free  # TODO: Destroy(GameObject.Find("Teddy(Clone)"))
        Object.Instantiate<GameObject>(Teddy, TeddyPos.position, TeddyPos.rotation)
        yield return new WaitForSeconds(0.5)
        GameObject.Find("Teddy(Clone)").self  # TODO: was transform.name = "Teddy"
      fadeTextSpeed = 1.0
      ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
      yield return StartCoroutine(FadeText3(1.0, 0.0, 2.0))
      day3Text.SetActive(false)
      if PlayerPrefs.GetInt("DiffData") != 4:
        doorRoom2.self.tag = "innerdoorLocked"
      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerInBed3")
      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = 1.0
      kliverUrBedLjud.SetActive(true)
      blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
      yield return new WaitForSeconds(11.0)
      playerInBed.SetActive(false)
      Player.SetActive(true)
      ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).day2 = false
      ((Footsteps)playerCam.GetComponent(typeof(Footsteps))).day2 = false
      ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).day3 = true
      ((Footsteps)playerCam.GetComponent(typeof(Footsteps))).day3 = true
      joystick.SetActive(true)
      yield return StartCoroutine(FadeJoy(0.0, 0.5, 2.0))
      var a3 := 0.5
      var color3 := this.joystickTexture.color
      color3.a = a3
      joystickTexture.color = color3
      var a4 := 0.5
      var color4 := this.joystickRingTexture.color
      color4.a = a4
      joystickRingTexture.color = color4
      crouchButton.SetActive(true)
      optionButton.SetActive(true)
      allBedButtons.SetActive(true)
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = true
      ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerBed = 0.0
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerNearGranny = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
      GrannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.588, 0.588, 0.588)
      mittPrick.SetActive(true)
      kliverUrBedLjud.SetActive(false)
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0
      ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimeOff = false
      AudioListener.pause = false
      Time.timeScale = 1.0
    yield return new WaitForSeconds(1.0)
    fadeTextSpeed = 3.0
    ((SoundEffectsPlayerInBed)soundHolder.GetComponent(typeof(SoundEffectsPlayerInBed))).startTextSound()
    yield return StartCoroutine(FadeText3(0.0, 1.0, 2.0))
    yield return new WaitForSeconds(2.0)
    if not slendrinaAppeard  and  GameObject.Find("Teddy(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Teddy(Clone)"))
      Object.Instantiate<GameObject>(Teddy, TeddyPos.position, TeddyPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Teddy(Clone)").self  # TODO: was transform.name = "Teddy"
    fadeTextSpeed = 1.0
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
    yield return StartCoroutine(FadeText3(1.0, 0.0, 2.0))
    day3Text.SetActive(false)
    if PlayerPrefs.GetInt("DiffData") != 4:
      doorRoom2.self.tag = "innerdoorLocked"
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerInBed3")
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = 1.0
    kliverUrBedLjud.SetActive(true)
    blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
    yield return new WaitForSeconds(11.0)
    playerInBed.SetActive(false)
    Player.SetActive(true)
    ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).day2 = false
    ((Footsteps)playerCam.GetComponent(typeof(Footsteps))).day2 = false
    ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).day3 = true
    ((Footsteps)playerCam.GetComponent(typeof(Footsteps))).day3 = true
    joystick.SetActive(true)
    yield return StartCoroutine(FadeJoy(0.0, 0.5, 2.0))
    var a5 := 0.5
    var color5 := this.joystickTexture.color
    color5.a = a5
    joystickTexture.color = color5
    var a6 := 0.5
    var color6 := this.joystickRingTexture.color
    color6.a = a6
    joystickRingTexture.color = color6
    crouchButton.SetActive(true)
    optionButton.SetActive(true)
    allBedButtons.SetActive(true)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = true
    ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerBed = 0.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerNearGranny = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
    GrannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.588, 0.588, 0.588)
    mittPrick.SetActive(true)
    kliverUrBedLjud.SetActive(false)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimeOff = false
    AudioListener.pause = false
    Time.timeScale = 1.0
  elif (PlayerPrefs.GetInt("ADSon") == 1:
    fadeTextSpeed = 3.0
    ((SoundEffectsPlayerInBed)soundHolder.GetComponent(typeof(SoundEffectsPlayerInBed))).startTextSound()
    yield return StartCoroutine(FadeText3(0.0, 1.0, 2.0))
    yield return new WaitForSeconds(2.0)
    if not slendrinaAppeard  and  GameObject.Find("Teddy(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Teddy(Clone)"))
      Object.Instantiate<GameObject>(Teddy, TeddyPos.position, TeddyPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Teddy(Clone)").self  # TODO: was transform.name = "Teddy"
    fadeTextSpeed = 1.0
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
    yield return StartCoroutine(FadeText3(1.0, 0.0, 2.0))
    day3Text.SetActive(false)
    if PlayerPrefs.GetInt("DiffData") != 4:
      doorRoom2.self.tag = "innerdoorLocked"
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerInBed3")
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = 1.0
    kliverUrBedLjud.SetActive(true)
    blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
    yield return new WaitForSeconds(11.0)
    playerInBed.SetActive(false)
    Player.SetActive(true)
    ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).day2 = false
    ((Footsteps)playerCam.GetComponent(typeof(Footsteps))).day2 = false
    ((FPSControllerNEW)Player.GetComponent(typeof(FPSControllerNEW))).day3 = true
    ((Footsteps)playerCam.GetComponent(typeof(Footsteps))).day3 = true
    joystick.SetActive(true)
    yield return StartCoroutine(FadeJoy(0.0, 0.5, 2.0))
    var a7 := 0.5
    var color7 := this.joystickTexture.color
    color7.a = a7
    joystickTexture.color = color7
    var a8 := 0.5
    var color8 := this.joystickRingTexture.color
    color8.a = a8
    joystickRingTexture.color = color8
    crouchButton.SetActive(true)
    optionButton.SetActive(true)
    allBedButtons.SetActive(true)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = true
    ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerBed = 0.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerNearGranny = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
    GrannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.588, 0.588, 0.588)
    mittPrick.SetActive(true)
    kliverUrBedLjud.SetActive(false)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimeOff = false
elif (this.daysCounter == 4f:
  fadeTextSpeed = 3.0
  ((SoundEffectsPlayerInBed)soundHolder.GetComponent(typeof(SoundEffectsPlayerInBed))).startTextSound()
  yield return StartCoroutine(FadeText4(0.0, 1.0, 2.0))
  yield return new WaitForSeconds(2.0)
  if not slendrinaAppeard  and  GameObject.Find("Teddy(Clone)"):
    Object.queue_free  # TODO: Destroy(GameObject.Find("Teddy(Clone)"))
    Object.Instantiate<GameObject>(Teddy, TeddyPos.position, TeddyPos.rotation)
    yield return new WaitForSeconds(0.5)
    GameObject.Find("Teddy(Clone)").self  # TODO: was transform.name = "Teddy"
  fadeTextSpeed = 1.0
  ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
  yield return StartCoroutine(FadeText4(1.0, 0.0, 2.0))
  day4Text.SetActive(false)
  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerInBed2")
  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = 1.0
  kliverUrBedLjud.SetActive(true)
  bloodscreenDay4.SetActive(true)
  bloodOnBed.SetActive(true)
  blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
  yield return new WaitForSeconds(11.0)
  playerInBed.SetActive(false)
  Player.SetActive(true)
  joystick.SetActive(true)
  yield return StartCoroutine(FadeJoy(0.0, 0.5, 2.0))
  var a9 := 0.5
  var color9 := this.joystickTexture.color
  color9.a = a9
  joystickTexture.color = color9
  var a10 := 0.5
  var color10 := this.joystickRingTexture.color
  color10.a = a10
  joystickRingTexture.color = color10
  crouchButton.SetActive(true)
  optionButton.SetActive(true)
  allBedButtons.SetActive(true)
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = true
  ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerBed = 0.0
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerNearGranny = false
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
  GrannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.588, 0.588, 0.588)
  mittPrick.SetActive(true)
  kliverUrBedLjud.SetActive(false)
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimeOff = false
elif (this.daysCounter == 5f:
  fadeTextSpeed = 3.0
  ((SoundEffectsPlayerInBed)soundHolder.GetComponent(typeof(SoundEffectsPlayerInBed))).startTextSound()
  if PlayerPrefs.GetInt("DiffData") == 2  or  PlayerPrefs.GetInt("DiffData") == 3:
    yield return StartCoroutine(FadeText5LD(0.0, 1.0, 2.0))
    yield return new WaitForSeconds(2.0)
    fadeTextSpeed = 1.0
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
    yield return StartCoroutine(FadeText5LD(1.0, 0.0, 2.0))
    day5LastDayText.SetActive(false)
  elif (this.tavelbit1  and  this.tavelbit2  and  this.tavelbit3  and  this.tavelbit4:
    yield return StartCoroutine(FadeText5(0.0, 1.0, 2.0))
    yield return new WaitForSeconds(2.0)
    fadeTextSpeed = 1.0
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
    yield return StartCoroutine(FadeText5(1.0, 0.0, 2.0))
    day5Text.SetActive(false)
  else:
    yield return StartCoroutine(FadeText5LD(0.0, 1.0, 2.0))
    yield return new WaitForSeconds(2.0)
    fadeTextSpeed = 1.0
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
    yield return StartCoroutine(FadeText5LD(1.0, 0.0, 2.0))
    day5LastDayText.SetActive(false)
  if not slendrinaAppeard  and  GameObject.Find("Teddy(Clone)"):
    Object.queue_free  # TODO: Destroy(GameObject.Find("Teddy(Clone)"))
    Object.Instantiate<GameObject>(Teddy, TeddyPos.position, TeddyPos.rotation)
    yield return new WaitForSeconds(0.5)
    GameObject.Find("Teddy(Clone)").self  # TODO: was transform.name = "Teddy"
  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerInBed")
  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = 1.0
  kliverUrBedLjud.SetActive(true)
  blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
  yield return new WaitForSeconds(11.0)
  playerInBed.SetActive(false)
  Player.SetActive(true)
  joystick.SetActive(true)
  yield return StartCoroutine(FadeJoy(0.0, 0.5, 2.0))
  var a11 := 0.5
  var color11 := this.joystickTexture.color
  color11.a = a11
  joystickTexture.color = color11
  var a12 := 0.5
  var color12 := this.joystickRingTexture.color
  color12.a = a12
  joystickRingTexture.color = color12
  crouchButton.SetActive(true)
  optionButton.SetActive(true)
  allBedButtons.SetActive(true)
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = true
  ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerBed = 0.0
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerNearGranny = false
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
  GrannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.588, 0.588, 0.588)
  mittPrick.SetActive(true)
  kliverUrBedLjud.SetActive(false)
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0
  ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimeOff = false
elif (this.daysCounter == 6f:
  if tavelbit1  and  tavelbit2  and  tavelbit3  and  tavelbit4:
    fadeTextSpeed = 3.0
    ((SoundEffectsPlayerInBed)soundHolder.GetComponent(typeof(SoundEffectsPlayerInBed))).startTextSound()
    yield return StartCoroutine(FadeText6(0.0, 1.0, 2.0))
    yield return new WaitForSeconds(2.0)
    if not slendrinaAppeard  and  GameObject.Find("Teddy(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Teddy(Clone)"))
      Object.Instantiate<GameObject>(Teddy, TeddyPos.position, TeddyPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Teddy(Clone)").self  # TODO: was transform.name = "Teddy"
    fadeTextSpeed = 1.0
    ((backgroundSound)soundHolder2.GetComponent(typeof(backgroundSound))).fadeUp = true
    yield return StartCoroutine(FadeText6(1.0, 0.0, 2.0))
    day6Text.SetActive(false)
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("PlayerInBed2")
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["PlayerInBed"].speed = 1.0
    kliverUrBedLjud.SetActive(true)
    bloodscreenDay4.SetActive(true)
    bloodOnBed.SetActive(true)
    blackScreenTexture.CrossFadeAlpha(0.0, 6.0, false)
    yield return new WaitForSeconds(11.0)
    playerInBed.SetActive(false)
    Player.SetActive(true)
    joystick.SetActive(true)
    yield return StartCoroutine(FadeJoy(0.0, 0.5, 2.0))
    var a13 := 0.5
    var color13 := this.joystickTexture.color
    color13.a = a13
    joystickTexture.color = color13
    var a14 := 0.5
    var color14 := this.joystickRingTexture.color
    color14.a = a14
    joystickRingTexture.color = color14
    crouchButton.SetActive(true)
    optionButton.SetActive(true)
    allBedButtons.SetActive(true)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).enabled = true
    ((EnemyEye)GrannyEye.GetComponent(typeof(EnemyEye))).seeRange = 200.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).timerBed = 0.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerNearGranny = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHaveTeddy = false
    GrannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.588, 0.588, 0.588)
    mittPrick.SetActive(true)
    kliverUrBedLjud.SetActive(false)
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).playerHiding = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).grannyInBastu = false
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimer = 15.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuDoorTimer = 20.0
    ((EnemyAIGranny)Granny.GetComponent(typeof(EnemyAIGranny))).bastuTimeOff = false
  elif (PlayerPrefs.GetInt("DiffData") == 4:
    StartCoroutine(((playerDead)gameController.GetComponent(typeof(playerDead))).gameOverNoGranny())
  elif (PlayerPrefs.GetInt("DiffGOsceneData") == 0:
    PlayerPrefs.SetInt("DiffGOsceneData", 1)
    StartCoroutine(((playerDead)gameController.GetComponent(typeof(playerDead))).startEndScene3())
  elif (PlayerPrefs.GetInt("DiffGOsceneData") == 1:
    PlayerPrefs.SetInt("DiffGOsceneData", 2)
    StartCoroutine(((playerDead)gameController.GetComponent(typeof(playerDead))).startEndScene2())
  elif (PlayerPrefs.GetInt("DiffGOsceneData") == 2:
    PlayerPrefs.SetInt("DiffGOsceneData", 0)
    StartCoroutine(((playerDead)gameController.GetComponent(typeof(playerDead))).startEndScene())
elif (this.daysCounter == 7f:
  if PlayerPrefs.GetInt("DiffData") == 4:
    StartCoroutine(((playerDead)gameController.GetComponent(typeof(playerDead))).gameOverNoGranny())
  elif (PlayerPrefs.GetInt("DiffGOsceneData") == 0:
    PlayerPrefs.SetInt("DiffGOsceneData", 1)
    StartCoroutine(((playerDead)gameController.GetComponent(typeof(playerDead))).startEndScene3())
  elif (PlayerPrefs.GetInt("DiffGOsceneData") == 1:
    PlayerPrefs.SetInt("DiffGOsceneData", 2)
    StartCoroutine(((playerDead)gameController.GetComponent(typeof(playerDead))).startEndScene2())
  elif (PlayerPrefs.GetInt("DiffGOsceneData") == 2:
    PlayerPrefs.SetInt("DiffGOsceneData", 0)
    StartCoroutine(((playerDead)gameController.GetComponent(typeof(playerDead))).startEndScene())
var break: Variant

//	private void OnAdClosed(ShowResult result)
//	{
//		print("Regular ads closed")
//	}

var fadeBlackSpeed: float

var fadeTextSpeed: float

var blackScreenTexture: Variant

var bloodscreenImage: Variant

var bloodscreen: Node3D

var bloodOnBed: Node3D

var bloodscreenDay4: Node3D

var day1: Variant

var day1Text: Node3D

var day2: Variant

var day2Text: Node3D

var day3: Variant

var day3Text: Node3D

var day4: Variant

var day4Text: Node3D

var day5: Variant

var day5Text: Node3D

var day5LastDay: Variant

var day5LastDayText: Node3D

var day6: Variant

var day6Text: Node3D

var animationHolder: Node3D

var playerInBed: Node3D

var Player: Node3D

var playerCam: Node3D

var clipPlaneHolder: Node3D

var playerHead: Node3D

var joystick: Node3D

var joystickTexture: Variant

var joystickRingTexture: Variant

var crouchButton: Node3D

var optionButton: Node3D

var allBedButtons: Node3D

var mittPrick: Node3D

var Granny: Node3D

var GrannyEye: Node3D

var GrannyEyeColor: Node3D

var daysCounter: float

var doorRoom1: Node3D

var doorRoom2: Node3D

var doorklocka1: Node3D

var doorklocka2: Node3D

var gameController: Node3D

var soundHolder: Node3D

var soundHolder2: Node3D

var musicHolder: Node3D

var musicHolderNightmare: Node3D

var kliverUrBedLjud: Node3D

var haveToLeaveText: Node3D

var KnarrandeGolv: Node3D

var KnarrandeGolvExtreme: Node3D

var adsPauseContinueButton: Node3D

var scriptC: Variant

var savedValue: Node3D

var RandomNR: float

var OP1: Node3D

var OP1_2: Node3D

var OP1_3: Node3D

var OP1_4: Node3D

var OP1_5: Node3D

var OP1_6: Node3D

var OP1_7: Node3D

var OP2: Node3D

var OP2_2: Node3D

var OP2_3: Node3D

var OP2_4: Node3D

var OP2_5: Node3D

var OP3: Node3D

var OP3_2: Node3D

var OP3_3: Node3D

var OP3_4: Node3D

var OP3_5: Node3D

var OP3_6: Node3D

var OP4: Node3D

var OP4_2: Node3D

var OP4_3: Node3D

var OP4_4: Node3D

var OP4_5: Node3D

var OP4_6: Node3D

var OP4_7: Node3D

var OP5: Node3D

var OP5_2: Node3D

var OP5_3: Node3D

var OP5_4: Node3D

var OP5_5: Node3D

var OP5_6: Node3D

var OP5_7: Node3D

var RandomNRTavelbitar: float

var tavla: Node3D

var tavelbitar: Node3D

var tavelbit1: bool

var tavelbit2: bool

var tavelbit3: bool

var tavelbit4: bool

var allaTavelbitarOnPlace: bool

var playerGetExtraDay: Node3D

var tavelBitPlace1: Node3D

var tavelBitPlace2: Node3D

var tavelBitPlace3: Node3D

var Teddy: Node3D

var TeddyPos: Node3D

var slendrinaAppeard: bool

var slendrinaMomAppeard: bool

var GrannyMessage: Node3D

var allTexts: Node3D

var bloodHanging: Node3D

var rats: Node3D
