# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/EnemyAIGranny.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name EnemyAIGranny
extends Node  # TODO: was MonoBehaviour
  func _init():
    offScreenDot = 0.8
    waypointStart = true
    timerOnOff = true

  func _ready():
    hitByArrow = false
    hitByGun = false
    hitByCar = false
    hitByPepper = false
    hitByPepperStart = false
    freeze = false
    grannyLock.SetActive(false)
    grannyPepperReact = false
    GrannyGonnaSmack = false
    bastuKilled = false
    grannyStandBesideCar = false
    playerInPrison = false
    target = nav1
    number = Random.Range(1, 33)
    if number == 1.0  or  number == 2.0:
      target = GameObject.Find("Nav1").self  # TODO: was transform
    if number == 3.0  or  number == 4.0:
      target = GameObject.Find("Nav2").self  # TODO: was transform
    if number == 5.0  or  number == 6.0:
      target = GameObject.Find("Nav3").self  # TODO: was transform
    if number == 7.0  or  number == 8.0:
      target = GameObject.Find("Nav4").self  # TODO: was transform
    if number == 9.0  or  number == 10.0:
      target = GameObject.Find("Nav5").self  # TODO: was transform
    if number == 11.0  or  number == 12.0:
      target = GameObject.Find("Nav6").self  # TODO: was transform
    if number == 13.0  or  number == 14.0:
      target = GameObject.Find("Nav7").self  # TODO: was transform
    if number == 15.0  or  number == 16.0:
      target = GameObject.Find("Nav8").self  # TODO: was transform
    if number == 17.0  or  number == 18.0:
      target = GameObject.Find("Nav9").self  # TODO: was transform
    if number == 19.0  or  number == 20.0:
      target = GameObject.Find("Nav10").self  # TODO: was transform
    if number == 21.0  or  number == 22.0:
      target = GameObject.Find("Nav11").self  # TODO: was transform
    if number == 23.0  or  number == 24.0:
      target = GameObject.Find("Nav12").self  # TODO: was transform
    if number == 25.0  or  number == 26.0:
      target = GameObject.Find("Nav13").self  # TODO: was transform
    if number == 27.0  or  number == 28.0:
      target = GameObject.Find("Nav14").self  # TODO: was transform
    if number == 29.0  or  number == 30.0:
      target = GameObject.Find("Nav15").self  # TODO: was transform
    if number == 31.0  or  number == 32.0:
      target = GameObject.Find("Nav16").self  # TODO: was transform
    navComponent = (NavMeshAgent)self  # TODO: was transform.GetComponent(typeof(NavMeshAgent))
    player = GameObject.Find("Player").self  # TODO: was transform
    playerPos = GameObject.Find("Main Camera").self  # TODO: was transform
    nav1 = GameObject.Find("Nav1").self  # TODO: was transform
    nav2 = GameObject.Find("Nav2").self  # TODO: was transform
    nav3 = GameObject.Find("Nav3").self  # TODO: was transform
    nav4 = GameObject.Find("Nav4").self  # TODO: was transform
    nav5 = GameObject.Find("Nav5").self  # TODO: was transform
    nav6 = GameObject.Find("Nav6").self  # TODO: was transform
    nav7 = GameObject.Find("Nav7").self  # TODO: was transform
    nav8 = GameObject.Find("Nav8").self  # TODO: was transform
    nav9 = GameObject.Find("Nav9").self  # TODO: was transform
    nav10 = GameObject.Find("Nav10").self  # TODO: was transform
    nav11 = GameObject.Find("Nav11").self  # TODO: was transform
    nav12 = GameObject.Find("Nav12").self  # TODO: was transform
    nav13 = GameObject.Find("Nav13").self  # TODO: was transform
    nav14 = GameObject.Find("Nav14").self  # TODO: was transform
    nav15 = GameObject.Find("Nav15").self  # TODO: was transform
    nav16 = GameObject.Find("Nav16").self  # TODO: was transform
    navComponent.speed = 1.2
    if PlayerPrefs.GetInt("DiffData") == 0  or  PlayerPrefs.GetInt("DiffData") == 4:
      grannysVarSpeed = 4.3
      grannysAnimSpeed = 2.0
    elif (PlayerPrefs.GetInt("DiffData") == 1:
      grannysVarSpeed = 3.0
      grannysAnimSpeed = 1.5
    elif (PlayerPrefs.GetInt("DiffData") == 2:
      grannysVarSpeed = 5.0
      grannysAnimSpeed = 2.7
    elif (PlayerPrefs.GetInt("DiffData") == 3  or  PlayerPrefs.GetInt("DiffData") == 5:
      grannysVarSpeed = 7.0
      grannysAnimSpeed = 3.3

  func _physics_process(_delta):
    var raycastHit := default(RaycastHit)
    if PlayerPrefs.GetInt("DiffData") != 4:
      if playerHaveTeddy  and  not freeze:
        grannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.2264151, 0.0, 0.0)
        grannyEyeColorTimerOn = true
        grannyEyeColorTimer = 0.0
        ((fadeUpDownTeddyMusic)teddyMusicHolder.GetComponent(typeof(fadeUpDownTeddyMusic))).startFade = true
      elif (this.grannyEyeColorTimerOn:
        grannyEyeColorTimer += Time.deltaTime
        if grannyEyeColorTimer > 7.0:
          grannyEyeColorTimerOn = false
          grannyEyeColorTimer = 0.0
          grannyEyeColor.self.get_node(\"TODO_Renderer\")  # TODO: GetComponent.material.color = new Color(0.5882353, 0.5882353, 0.5882353)
          ((fadeUpDownTeddyMusic)teddyMusicHolder.GetComponent(typeof(fadeUpDownTeddyMusic))).startFade = false
    if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
      var num := 0
      var rotation := base.transform.rotation
      rotation.x = num
      quaternion  # TODO: Unity->Godot rotation = rotation
      if target:
        distanceWaypoint = Vector3.Distance(target.position, position)
      distance = Vector3.Distance(playerPos.position, grannyEye.position)
    if playerGetCaught  and  playerFallDeath:
      navComponent.speed = 0.0
      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
    if not playerGetCaught:
      if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze  and  target == null:
        target = nav1
      if not grannyIsFollow  and  not grannyLookUnderBed  and  not playerGetCaught  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
        safeTimer += Time.deltaTime
        if safeTimer >= 80.0:
          safeTimer = 0.0
          if target.name != "Player":
            grannyHearObject = false
            grannyHearPlayer = false
            number = Random.Range(1, 33)
            newNav()
      if not playerGetCaught:
        if hitByArrow:
          ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannyDead = true
          if not ragdollSpawn:
            ragdollSpawn = true
            navComponent.speed = 0.0
            self.tag = "Untagged"
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("arrowHit")
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["arrowHit"].speed = 0.8
            StartCoroutine(grannyHitByArrow())
            huntPlayer = false
        elif (this.hitByGun:
          ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannyDead = true
          if not ragdollSpawn:
            ragdollSpawn = true
            navComponent.speed = 0.0
            grannyHitByGun()
            huntPlayer = false
        elif (this.hitByCar:
          ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannyDead = true
          if not ragdollSpawn:
            ragdollSpawn = true
            navComponent.speed = 0.0
            self.tag = "Untagged"
            grannyHitByCar()
            huntPlayer = false
        elif (this.freeze:
          ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannyDead = true
          if not ragdollSpawn:
            ragdollSpawn = true
            navComponent.speed = 0.0
            self.tag = "Untagged"
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("freezeTrap")
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["freezeTrap"].speed = 1.0
            StartCoroutine(grannyFreeze())
            huntPlayer = false
      if navComponent.velocity != Vector3.zero:
        if not grannyLookUnderBed  and  not playerGetCaught  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
          stopWalk = false
          GrannyMoving = true
          if not startWalk:
            if not grannyIsFollow:
              if not grannySeeDoor  and  not grannySeeLockedDoor  and  not droppingBeartrap:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
                navComponent.speed = 1.2
            elif (this.seePlayer:
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
              navComponent.stoppingDistance = 2.0
      elif (this.navComponent.velocity == Vector3.zero  and  !this.hitByArrow  and  !this.hitByGun  and  !this.bastuKilled  and  !this.hitByCar  and  !this.hitByPepperStart  and  !this.freeze  and  !this.grannyLookUnderBed:
        startWalk = false
        GrannyMoving = false
        if not stopWalk:
          stopWalk = true
          if not attackingPlayer:
            if not GrannySearch  and  not huntPlayer:
              if grannyHearPlayer:
                if navComponent.velocity == Vector3.zero:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Look")
              elif (this.grannyHearObject:
                if navComponent.velocity == Vector3.zero:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Look")
              elif (this.navComponent.velocity == Vector3.zero:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
      if target  and  not grannyLookUnderBed  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
        navComponent.destination = target.position
        if not seePlayer  and  not grannyIsFollow  and  not GrannySearching:
          if prisondoorClosed:
            if waypointStart  and  not waypointStop:
              waypointStart = false
              waypointStop = true
              timer = 0.0
              if target.name == "TempNavObjects(Clone)":
                startTimerSearch = true
                GrannySearching = true
                StartCoroutine(cleaning())
              if target.name == "TempNav(Clone)":
                startTimerSearch = true
                GrannySearching = true
          elif (this.distanceWaypoint < 5f:
            if waypointStart  and  not waypointStop:
              waypointStart = false
              waypointStop = true
              timer = 0.0
              if target.name == "TempNavObjects(Clone)":
                startTimerSearch = true
                GrannySearching = true
                StartCoroutine(cleaning())
              if target.name == "TempNav(Clone)":
                startTimerSearch = true
                GrannySearching = true
          elif (this.distanceWaypoint > 3f  and  !this.waypointStop:
            waypointStart = true
            waypointStop = false
      if waypointStop  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze  and  not startTimerSearch  and  (not grannyHearObject  or  not grannyHearPlayer):
        timer += Time.deltaTime
      if timer >= 10.0  and  not grannyLookUnderBed  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
        waypointStop = false
        waypointStart = true
        timer = 0.0
        if not grannyIsFollow:
          number = Random.Range(1, 33)
          if not grannyHearPlayer  or  not grannyHearObject:
            newNav()
      if seePlayer:
        if not grannyLookUnderBed  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
          grannyHearPlayer = false
          grannyHearObject = false
          timerSee = 0.0
          safeTimer = 0.0
          if not huntPlayer:
            huntPlayer = true
            if PlayerPrefs.GetInt("NightMareOnOff") == 1:
              ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).startFade = true
            if not grannyIsFollow:
              grannyIsFollow = true
              followPlayer()
      elif (this.playerHaveTeddy:
        if PlayerPrefs.GetInt("DiffData") != 4  and  not grannyLookUnderBed  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
          grannyHearPlayer = false
          grannyHearObject = false
          timerSee = 0.0
          safeTimer = 0.0
          if not huntPlayer:
            huntPlayer = true
            if PlayerPrefs.GetInt("NightMareOnOff") == 1:
              ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).startFade = true
            if not grannyIsFollow:
              grannyIsFollow = true
              followPlayer()
      elif (this.playerStartCar  and  PlayerPrefs.GetInt("DiffData") != 4  and  !this.grannyLookUnderBed  and  !this.hitByArrow  and  !this.hitByGun  and  !this.bastuKilled  and  !this.hitByCar  and  !this.hitByPepperStart  and  !this.freeze:
        grannyHearPlayer = false
        grannyHearObject = false
        timerSee = 0.0
        safeTimer = 0.0
        seePlayer = true
        if not huntPlayer:
          huntPlayer = true
          if PlayerPrefs.GetInt("NightMareOnOff") == 1:
            ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).startFade = true
          if not grannyIsFollow:
            grannyIsFollow = true
            followPlayer()
      if grannyIsFollow  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
        if not seePlayer:
          seePlayerTimer = true
        else:
          seePlayerTimer = false
          timerSee = 0.0
          safeTimer = 0.0
      if seePlayerTimer  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
        timerSee += Time.deltaTime
        if timerSee >= 6.0:
          seePlayerTimer = false
          grannyIsFollow = false
          huntPlayer = false
          if PlayerPrefs.GetInt("NightMareOnOff") == 1:
            ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).startFade = false
          timerSee = 0.0
          safeTimer = 0.0
          startTimerSearch = true
          GrannySearching = true
      if startTimerSearch  and  not grannyLookUnderBed  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
        if GrannySearching:
          navComponent.speed = 0.0
          if not GrannySearch  and  navComponent.velocity == Vector3.zero:
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Look")
        timerSearch += Time.deltaTime
        if timerSearch >= 8.0:
          if navComponent.velocity != Vector3.zero:
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
          else:
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
          grannyHearPlayer = false
          grannyHearObject = false
          if not grannyIsFollow:
            startTimerSearch = false
            GrannySearching = false
            GrannySearch = false
            timerSearch = 0.0
            if not grannySeeDoor  and  not grannySeeLockedDoor:
              navComponent.speed = 1.2
            number = Random.Range(1, 33)
            if not grannyHearPlayer  or  not grannyHearObject:
              newNav()
              if PlayerPrefs.GetInt("DiffData") != 4:
                StartCoroutine(dropBearTrap())
              if playerInPrison  and  prisondoorClosed:
                ((GrannySounds)grannySounds.GetComponent(typeof(GrannySounds))).grannySkrattar()
              else:
                ((GrannySounds)grannySounds.GetComponent(typeof(GrannySounds))).startGrannySound()
      if PlayerPrefs.GetInt("DiffData") != 4:
        var direction := this.doorRay.transform.TransformDirection(Vector3.forward)
        var vector := this.doorRay.transform.TransformDirection(Vector3.down)
        if Physics.Raycast(doorRay.transform.position, direction, out raycastHit, 3.0):
          if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
            Debug.DrawRay(doorRay.position, self  # TODO: was transform.forward, Color.green)
            if raycastHit.collider.gameObject.tag == "innerdoorClosed":
              grannySeeDoor = true
              if not seePlayer:
                if playerHaveTeddy:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                elif (this.playerStartCar:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                else:
                  navComponent.speed = 0.0
              seeClosedDoorTimer += Time.deltaTime
              if navComponent.velocity == Vector3.zero:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
              if seeClosedDoorTimer >= 2.0:
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorOpen")
                if not grannyIsFollow:
                  navComponent.speed = 1.2
                  if navComponent.velocity != Vector3.zero:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                  else:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
                else:
                  navComponent.speed = grannysVarSpeed
                  if navComponent.velocity != Vector3.zero:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                  else:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
                seeClosedDoorTimer = 0.0
            elif (raycastHit.collider.gameObject.tag == "innerdoorLocked":
              if not stopSeeLockedDoor:
                grannySeeLockedDoor = true
                seeClosedDoorTimer += Time.deltaTime
                if grannySeeLockedDoor  and  not seePlayer:
                  if playerHaveTeddy:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  elif (this.playerStartCar:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  else:
                    navComponent.speed = 0.0
                if navComponent.velocity == Vector3.zero:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  navComponent.speed = 0.0
                if seeClosedDoorTimer <= 2.0:
                  raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorLocked")
                if seeClosedDoorTimer >= 4.0:
                  raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorOpen")
                  if not grannyIsFollow:
                    navComponent.speed = 1.2
                    if navComponent.velocity != Vector3.zero:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                    else:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
                  else:
                    navComponent.speed = grannysVarSpeed
                    if navComponent.velocity != Vector3.zero:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                    else:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
                  if grannySeeLockedDoor  and  seeClosedDoorTimer >= 10.0:
                    grannySeeLockedDoor = false
                    stopSeeLockedDoor = true
                    seeClosedDoorTimer = 0.0
                    grannyHearPlayer = false
                    grannyHearObject = false
                    number = Random.Range(1, 33)
                    newNav()
            elif (raycastHit.collider.gameObject.tag == "steeldoorLocked":
              if not stopSeeLockedDoor:
                grannySeeLockedDoor = true
                seeClosedDoorTimer += Time.deltaTime
                if grannySeeLockedDoor  and  not seePlayer:
                  if playerHaveTeddy:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  elif (this.playerStartCar:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  else:
                    navComponent.speed = 0.0
                if navComponent.velocity == Vector3.zero:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  navComponent.speed = 0.0
                if seeClosedDoorTimer <= 2.0:
                  raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorLocked")
                if seeClosedDoorTimer >= 4.0:
                  if not grannyIsFollow:
                    navComponent.speed = 1.2
                    if navComponent.velocity != Vector3.zero:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                    else:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
                  else:
                    navComponent.speed = grannysVarSpeed
                    if navComponent.velocity != Vector3.zero:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                    else:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
                  if grannySeeLockedDoor  and  seeClosedDoorTimer >= 10.0:
                    grannySeeLockedDoor = false
                    stopSeeLockedDoor = true
                    seeClosedDoorTimer = 0.0
                    grannyHearPlayer = false
                    grannyHearObject = false
                    number = Random.Range(1, 33)
                    newNav()
            elif (raycastHit.collider.gameObject.tag == "bastudoorLocked":
              if not stopSeeLockedDoor:
                grannySeeLockedDoor = true
                seeClosedDoorTimer += Time.deltaTime
                if grannySeeLockedDoor  and  not seePlayer:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  navComponent.speed = 0.0
                if navComponent.velocity == Vector3.zero:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                if seeClosedDoorTimer >= 4.0:
                  if not grannyIsFollow:
                    navComponent.speed = 1.2
                    if navComponent.velocity != Vector3.zero:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                    else:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
                  else:
                    navComponent.speed = grannysVarSpeed
                    if navComponent.velocity != Vector3.zero:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                    else:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
                  if grannySeeLockedDoor  and  seeClosedDoorTimer >= 10.0:
                    grannySeeLockedDoor = false
                    stopSeeLockedDoor = false
                    seeClosedDoorTimer = 0.0
                    grannyHearPlayer = false
                    grannyHearObject = false
                    number = Random.Range(1, 33)
                    newNav()
            elif (raycastHit.collider.gameObject.tag == "smalldoorClosed":
              grannySeeDoor = true
              if not seePlayer:
                if playerHaveTeddy:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                elif (this.playerStartCar:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                else:
                  navComponent.speed = 0.0
              seeClosedDoorTimer += Time.deltaTime
              if navComponent.velocity == Vector3.zero:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
              if seeClosedDoorTimer >= 2.0:
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("SmallDoorOpen")
                if navComponent.velocity != Vector3.zero:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                else:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                if not grannyIsFollow:
                  navComponent.speed = 1.2
                  if navComponent.velocity != Vector3.zero:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
                  else:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                else:
                  navComponent.speed = grannysVarSpeed
                  if navComponent.velocity != Vector3.zero:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
                  else:
                    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                seeClosedDoorTimer = 0.0
            elif (raycastHit.collider.gameObject.tag == "garde1Closed":
              grannySeeDoor = true
              if grannyIsFollow:
                if not seePlayer:
                  if playerHiding:
                    navComponent.speed = 0.0
                    seeClosedDoorTimer += Time.deltaTime
                    if navComponent.velocity == Vector3.zero:
                      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                    if seeClosedDoorTimer >= 2.0:
                      raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("Garde1Open")
                      if navComponent.velocity != Vector3.zero:
                        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                      else:
                        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                      if not grannyIsFollow:
                        navComponent.speed = 1.2
                        if navComponent.velocity != Vector3.zero:
                          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
                        else:
                          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                      else:
                        navComponent.speed = grannysVarSpeed
                        if navComponent.velocity != Vector3.zero:
                          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
                        else:
                          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                      seeClosedDoorTimer = 0.0
                  seePlayerTimer = true
                else:
                  seePlayerTimer = false
                  timerSee = 0.0
                  safeTimer = 0.0
            elif (raycastHit.collider.gameObject.tag == "Untagged":
              grannySeeDoor = false
              grannySeeLockedDoor = false
              stopSeeLockedDoor = false
              if navComponent.velocity != Vector3.zero:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
        else:
          grannySeeDoor = false
          grannySeeLockedDoor = false
          stopSeeLockedDoor = false
          if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze  and  navComponent.velocity != Vector3.zero:
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
      var vector2 := Vector3(0.0, -1.0, 0.0)
      if Physics.Raycast(checkGround.transform.position, vector2, out raycastHit, 5.0):
        Debug.DrawRay(checkGround.position, vector2, Color.yellow)
        if raycastHit.collider.gameObject.name == "StairColliderC":
          if not seeStairs:
            seeStairs = true
            attackDistance = 4.5
        elif (raycastHit.collider.gameObject.name == "Golv"  and  this.seeStairs:
          seeStairs = false
          attackDistance = 4.0
          ((GrannyFootstep)animationHolder.GetComponent(typeof(GrannyFootstep))).walkGrus = false
        if raycastHit.collider.gameObject.tag == "grus":
          ((GrannyFootstep)animationHolder.GetComponent(typeof(GrannyFootstep))).walkGrus = true
        if raycastHit.collider.gameObject.tag == "golv":
          ((GrannyFootstep)animationHolder.GetComponent(typeof(GrannyFootstep))).walkGrus = false
    if distance < attackDistance  and  seePlayer  and  not grannyLookUnderBed  and  not playerHidingInCoffin  and  not playerHidingInCoffinBackyard  and  not playerHidingInCar  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze  and  not playerInHole  and  not playerGetCaught:
      playerGetCaught = true
      attackingPlayer = true
      StartCoroutine(Playercaught())
      self  # TODO: was transform.LookAt(playerPos)
    if not playerGetCaught  and  not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
      if distanceWaypoint < 4.0  and  playerHidingUnderBed  and  grannyIsFollow:
        if not grannyLookUnderBed  and  navComponent.velocity != Vector3.zero:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
        navComponent.speed = 0.0
        facePlayerBed()
        if not grannyLookUnderBed:
          timerBed += Time.deltaTime
        if timerBed >= 3.0  and  playerHidingUnderBed:
          optionButton.SetActive(false)
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("lookBed")
          grannyLookUnderBed = true
          timerBed = 0.0
          safeTimer = 0.0
          allBedButtons.SetActive(false)
          if hidingUnderBed1:
            ((bedEyes)bedCam1.GetComponent(typeof(bedEyes))).lookAtGranny = true
            if not soundPlaying:
              soundPlaying = true
              ((soundEffectsBeds)soundHolder1.GetComponent(typeof(soundEffectsBeds))).playerCaught()
          if hidingUnderBed2:
            ((bedEyes2)bedCam2.GetComponent(typeof(bedEyes2))).lookAtGranny = true
            if not soundPlaying:
              soundPlaying = true
              ((soundEffectsBeds)soundHolder2.GetComponent(typeof(soundEffectsBeds))).playerCaught()
          if hidingUnderBed3:
            ((bedEyes3)bedCam3.GetComponent(typeof(bedEyes3))).lookAtGranny = true
            if not soundPlaying:
              soundPlaying = true
              ((soundEffectsBeds)soundHolder3.GetComponent(typeof(soundEffectsBeds))).playerCaught()
          StartCoroutine(((playerCaughtUnderBed)gameController.GetComponent(typeof(playerCaughtUnderBed))).EndDayUnderBed())
          soundPlaying = false
      elif (this.distanceWaypoint < 4f  and  this.playerHidingInCoffin  and  this.grannyIsFollow:
        navComponent.speed = 0.0
        facePlayerBed()
        if navComponent.velocity != Vector3.zero:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
        if not grannyLookUnderBed:
          timerBed += Time.deltaTime
        if timerBed >= 3.0  and  playerHidingInCoffin:
          optionButton.SetActive(false)
          timerBed = 0.0
          safeTimer = 0.0
          allBedButtons.SetActive(false)
          StartCoroutine(Playercaught())
      elif (this.distanceWaypoint < 4f  and  this.playerHidingInCoffinBackyard  and  this.grannyIsFollow:
        navComponent.speed = 0.0
        facePlayerBed()
        if navComponent.velocity != Vector3.zero:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
        if not grannyLookUnderBed:
          timerBed += Time.deltaTime
        if timerBed >= 3.0  and  playerHidingInCoffinBackyard:
          optionButton.SetActive(false)
          timerBed = 0.0
          safeTimer = 0.0
          allBedButtons.SetActive(false)
          StartCoroutine(Playercaught())
      elif (this.distanceWaypoint < 4f  and  this.playerHidingInCar  and  this.grannyIsFollow  and  this.grannyStandBesideCar:
        if not ((checkTheCar)gameController.GetComponent(typeof(checkTheCar))).carMoving:
          navComponent.speed = 0.0
          facePlayerBed()
          if navComponent.velocity != Vector3.zero:
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
          if not grannyLookUnderBed:
            timerBed += Time.deltaTime
          if timerBed >= 3.0  and  playerHidingInCar:
            optionButton.SetActive(false)
            timerBed = 0.0
            safeTimer = 0.0
            allBedButtons.SetActive(false)
            startCarButton.SetActive(false)
            forwardButton.SetActive(false)
            reverseButton.SetActive(false)
            StartCoroutine(Playercaught())
      elif (!this.playerHidingUnderBed  and  !this.playerHidingInCoffin  and  !this.playerHidingInCoffinBackyard  and  !this.playerHidingInCar  and  this.grannyIsFollow:
        followPlayer()
      if grannyHearPlayer  and  not seePlayer  and  not grannyIsFollow:
        if GameObject.Find("TempNav(Clone)Old"):
          target = GameObject.Find("TempNav(Clone)").self  # TODO: was transform
        else:
          target = GameObject.Find("TempNav(Clone)").self  # TODO: was transform
        if not grannySeeDoor  and  not grannySeeLockedDoor:
          navComponent.speed = grannysVarSpeed
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
        grannyHearObject = false
        droppingBeartrap = false
      if grannyHearObject  and  not seePlayer  and  not grannyIsFollow:
        if GameObject.Find("TempNavObjects(Clone)Old"):
          if GameObject.Find("TempNavObjects(Clone)"):
            target = GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform
          else:
            target = nav1
        else:
          target = GameObject.Find("TempNavObjects(Clone)").self  # TODO: was transform
        if not grannySeeDoor  and  not grannySeeLockedDoor:
          navComponent.speed = grannysVarSpeed
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
        grannyHearPlayer = false
        droppingBeartrap = false
        if not resetSafeTimer:
          resetSafeTimer = true
          safeTimer = 0.0
      if playerHidingUnderBed  and  seePlayer  and  grannyIsFollow:
        if hidingUnderBed1:
          target = bedtargetTemp1
        if hidingUnderBed2:
          target = bedtargetTemp2
        if hidingUnderBed3:
          target = bedtargetTemp3
        seePlayer = false
        navComponent.stoppingDistance = 2.0
        droppingBeartrap = false
      elif (this.playerHidingInCoffin  and  this.seePlayer  and  this.grannyIsFollow:
        target = coffintargetTemp4
      elif (this.playerHidingInCoffinBackyard  and  this.seePlayer  and  this.grannyIsFollow:
        target = coffintargetTempBY
      elif (this.playerHidingInCar  and  this.seePlayer  and  this.grannyIsFollow:
        target = cartargetTemp
      GrannyDecisions()
    if playerNearGranny  and  not playerGetCaught  and  not playerHiding:
      var vector3 := this.playerPos.position - base.transform.position
      var maxRadiansDelta := this.speed * Time.deltaTime
      var forward := Vector3.RotateTowards(base.transform.forward, vector3, maxRadiansDelta, 0.0)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(forward)
    if grannyInBastu  and  bastuswitchOn  and  bastuBomNere  and  not freeze:
      bastuTimer -= Time.deltaTime
      bastuDoorTimer -= Time.deltaTime
      if bastuTimer <= 0.0:
        grannyInBastu = false
        bastuKilled = true
        StartCoroutine(grannyHitByArrow())
      if not bastuTimeOff  and  bastuDoorTimer <= 0.0:
        bastuTimeOff = true
        bastuDoor.self.tag = "innerdoorLocked"
        bastuDoorCarv.carving = not enabled
    if grannyInBastu  and  not bastuswitchOn  and  bastuBomNere  and  not freeze:
      if not bastuTimeOff:
        bastuDoorTimer -= Time.deltaTime
        if bastuDoorTimer <= 0.0:
          bastuTimeOff = true
          bastuDoor.self.tag = "innerdoorLocked"
          bastuDoorCarv.carving = not enabled
          StartbastuSafeTimer = true
      if StartbastuSafeTimer:
        bastuSafeTimer += Time.deltaTime
        if bastuSafeTimer >= 30.0:
          StartbastuSafeTimer = false
          bastuDoor.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorOpen")
    if grannyInBastu  and  not bastuswitchOn  and  not bastuBomNere:
      bastuDoorTimer = 20.0
    if hitByPepper  and  not playerGetCaught:
      huntPlayer = false
      if PlayerPrefs.GetInt("NightMareOnOff") == 1:
        ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).startFade = false
      grannyLock.SetActive(true)
      seePlayer = false
      grannyIsFollow = false
      playerNearGranny = false
      self.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      ((EnemyEye)grannyEye.GetComponent(typeof(EnemyEye))).enabled = false
      blindTimer -= Time.deltaTime
      if blindTimer < 0.0:
        self.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
        ((EnemyEye)grannyEye.GetComponent(typeof(EnemyEye))).enabled = true
        grannyCloseTrigger.SetActive(false)
        grannyLock.SetActive(false)
        hitByPepper = false
        blindTimer = 30.0
        grannyPepperReact = false
      if not grannyPepperReact:
        grannyPepperReact = true
        grannyHitByPepper()
    elif (this.playerGetCaught  and  this.hitByPepper:
      grannyLock.SetActive(false)
      self.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
      ((EnemyEye)grannyEye.GetComponent(typeof(EnemyEye))).enabled = true
      blindTimer = 30.0
    if hitByPepperStart:
      if not animationHolder.GetComponent<Animation>().IsPlaying("pepperHit"):
        if not animationHolder.GetComponent<Animation>().IsPlaying("pepperHit"):
          hitByPepperStart = false
          pepperAnimDone()

  func grannyHitByPepper():
    navComponent.speed = 0.0
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("pepperHit")

  func pepperAnimDone():
    newNav()

  func grannyHitByArrow():
    yield return new WaitForSeconds(3.0)
    if not ((playerDead)gameController.GetComponent(typeof(playerDead))).endSceneRunning:
      Object.Instantiate<Transform>(grannyRagdoll, position, quaternion  # TODO: Unity->Godot rotation)
      grannyDisaper.SetActive(false)
      if PlayerPrefs.GetInt("DiffData") == 0:
        ((GrannyGoneText)grannyGoneNormalText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 1:
        ((GrannyGoneText)grannyGoneEasyText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 2:
        ((GrannyGoneText)grannyGoneHardText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 3  or  PlayerPrefs.GetInt("DiffData") == 5:
        ((GrannyGoneText)grannyGoneExtremeText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
    var break: Variant

  func grannyHitByCar():
    if not ((playerDead)gameController.GetComponent(typeof(playerDead))).endSceneRunning:
      Object.Instantiate<Transform>(grannyRagdoll, position, quaternion  # TODO: Unity->Godot rotation)
      grannyDisaper.SetActive(false)
      if PlayerPrefs.GetInt("DiffData") == 0:
        ((GrannyGoneText)grannyGoneNormalText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 1:
        ((GrannyGoneText)grannyGoneEasyText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 2:
        ((GrannyGoneText)grannyGoneHardText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 3  or  PlayerPrefs.GetInt("DiffData") == 5:
        ((GrannyGoneText)grannyGoneExtremeText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true

  func grannyHitByGun():
    if not ((playerDead)gameController.GetComponent(typeof(playerDead))).endSceneRunning:
      Object.Instantiate<Transform>(grannyForceRagdoll, position, quaternion  # TODO: Unity->Godot rotation)
      grannyDisaper.SetActive(false)
      if PlayerPrefs.GetInt("DiffData") == 0:
        ((GrannyGoneText)grannyGoneNormalShotText.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 1:
        ((GrannyGoneText)grannyGoneEasyShotText.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 2:
        ((GrannyGoneText)grannyGoneHardShotText.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 3  or  PlayerPrefs.GetInt("DiffData") == 5:
        ((GrannyGoneText)grannyGoneExtremeShotText.GetComponent(typeof(GrannyGoneText))).textOnOff = true

  func grannyFreeze():
    yield return new WaitForSeconds(2.5)
    if not ((playerDead)gameController.GetComponent(typeof(playerDead))).endSceneRunning:
      Object.Instantiate<Transform>(grannyFreezedoll, position, quaternion  # TODO: Unity->Godot rotation)
      grannyDisaper.SetActive(false)
      if PlayerPrefs.GetInt("DiffData") == 0:
        ((GrannyGoneText)grannyGoneNormalText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 1:
        ((GrannyGoneText)grannyGoneEasyText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 2:
        ((GrannyGoneText)grannyGoneHardText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
      elif (PlayerPrefs.GetInt("DiffData") == 3  or  PlayerPrefs.GetInt("DiffData") == 5:
        ((GrannyGoneText)grannyGoneExtremeText1.GetComponent(typeof(GrannyGoneText))).textOnOff = true
    var break: Variant

  func dropBearTrap():
    yield return new WaitForSeconds(10.0)
    if not grannyIsFollow  and  not hitByArrow  and  not hitByGun  and  not grannyInBastu  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
      navComponent.speed = 0.0
      droppingBeartrap = true
      yield return new WaitForSeconds(1.0)
      if PlayerPrefs.GetInt("NightMareOnOff") == 0:
        Object.Instantiate<GameObject>(bearTrap, bearTrapSP.position, bearTrapSP.rotation)
      else:
        Object.Instantiate<GameObject>(bearTrapOrganic, bearTrapSP.position, bearTrapSP.rotation)
      yield return new WaitForSeconds(1.0)
      droppingBeartrap = false
      navComponent.speed = 1.2
      if navComponent.velocity != Vector3.zero:
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
      else:
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
    var break: Variant

  func OnTriggerStay(other: Variant):
    if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze  and  other.gameObject.tag == "Player"  and  not playerHiding:
      playerNearGranny = true
      target = player
      GrannyGonnaSmack = true

  func OnTriggerExit(other: Variant):
    if other.gameObject.tag == "Player":
      GrannyGonnaSmack = false

  func GrannyDecisions():
    if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
      if grannyIsFollow:
        if distance < 4.0:
          facePlayer()
        elif (this.distance > 6f:
          playerNearGranny = false
      elif (this.distance > 6f  and  this.target != this.player  and  !this.GrannyGonnaSmack:
        playerNearGranny = false

  func facePlayer():
    if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
      var vector := this.target.position - base.transform.position
      var maxRadiansDelta := this.speed * Time.deltaTime
      var forward := Vector3.RotateTowards(base.transform.forward, vector, maxRadiansDelta, 0.0)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(forward)

  func facePlayerBed():
    var maxRadiansDelta := this.speed * Time.deltaTime
    if hidingUnderBed1:
      var vector := this.bedtargetTemp1.position - base.transform.position
      self  # TODO: was transform.LookAt(bedtargetTemp1)
      var forward := Vector3.RotateTowards(base.transform.forward, vector, maxRadiansDelta, 0.0)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(forward)
    if hidingUnderBed2:
      var vector2 := this.bedtargetTemp2.position - base.transform.position
      self  # TODO: was transform.LookAt(bedtargetTemp2)
      var forward2 := Vector3.RotateTowards(base.transform.forward, vector2, maxRadiansDelta, 0.0)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(forward2)
    if hidingUnderBed3:
      var vector3 := this.bedtargetTemp3.position - base.transform.position
      self  # TODO: was transform.LookAt(bedtargetTemp3)
      var forward3 := Vector3.RotateTowards(base.transform.forward, vector3, maxRadiansDelta, 0.0)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(forward3)
    if hidingInCoffin4:
      var vector4 := this.coffintargetTemp4.position - base.transform.position
      self  # TODO: was transform.LookAt(coffintargetTemp4)
      var forward4 := Vector3.RotateTowards(base.transform.forward, vector4, maxRadiansDelta, 0.0)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(forward4)
    if hidingInCoffinBY:
      var vector5 := this.coffintargetTempBY.position - base.transform.position
      self  # TODO: was transform.LookAt(coffintargetTempBY)
      var forward5 := Vector3.RotateTowards(base.transform.forward, vector5, maxRadiansDelta, 0.0)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(forward5)
    if hidingInCar:
      var vector6 := this.cartargetTemp.position - base.transform.position
      self  # TODO: was transform.LookAt(cartargetTemp)
      var forward6 := Vector3.RotateTowards(base.transform.forward, vector6, maxRadiansDelta, 0.0)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.LookRotation(forward6)

  func Playercaught():
    if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze  and  not playerInHole:
      if playerCaughtLastTime:
        if not playerHidingUnderBed:
          if playerHidingInCoffin:
            player.position = PlayerCoffinPos.position
            Player.SetActive(true)
            coffinHead1.SetActive(false)
            coffinLock.self  # TODO: was transform.localEulerAngles = Vector3(-153.846, 0.0, 0.0)
            navComponent.speed = 0.0
            if not dontHitPlayer:
              ((playerCrawl)playerHukaKnapp.GetComponent(typeof(playerCrawl))).standUp()
              playerHukaKnappParent.SetActive(false)
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Hit")
              ((playerCaught)player.GetComponent(typeof(playerCaught))).startFOV = true
              ((playerCaught)player.GetComponent(typeof(playerCaught))).grannyTakePlayer = true
              if PlayerPrefs.GetInt("NightMareOnOff") == 1:
                ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannySmackPlayer = true
                ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).playerCaught = true
              yield return new WaitForSeconds(0.6)
              yield return new WaitForSeconds(0.3)
              ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerHit()
              GrannyGonnaSmack = false
            else:
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
          elif (this.playerHidingInCoffinBackyard:
            player.position = PlayerCoffinBYPos.position
            Player.SetActive(true)
            coffinHead2.SetActive(false)
            coffinLockBY.self  # TODO: was transform.localEulerAngles = Vector3(165.669, 0.0, 0.0)
            navComponent.speed = 0.0
            if not dontHitPlayer:
              ((playerCrawl)playerHukaKnapp.GetComponent(typeof(playerCrawl))).standUp()
              playerHukaKnappParent.SetActive(false)
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Hit")
              ((playerCaught)player.GetComponent(typeof(playerCaught))).startFOV = true
              ((playerCaught)player.GetComponent(typeof(playerCaught))).grannyTakePlayer = true
              if PlayerPrefs.GetInt("NightMareOnOff") == 1:
                ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannySmackPlayer = true
                ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).playerCaught = true
              yield return new WaitForSeconds(0.6)
              yield return new WaitForSeconds(0.3)
              ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerHit()
              GrannyGonnaSmack = false
            else:
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
          elif (this.playerHidingInCar:
            player.position = PlayerCarPos.position
            Player.SetActive(true)
            carHead.SetActive(false)
            navComponent.speed = 0.0
            if not dontHitPlayer:
              ((playerCrawl)playerHukaKnapp.GetComponent(typeof(playerCrawl))).standUp()
              playerHukaKnappParent.SetActive(false)
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Hit")
              ((playerCaught)player.GetComponent(typeof(playerCaught))).startFOV = true
              ((playerCaught)player.GetComponent(typeof(playerCaught))).grannyTakePlayer = true
              ((soundEffects)playerSounds.GetComponent(typeof(soundEffects))).CarOut()
              if PlayerPrefs.GetInt("NightMareOnOff") == 1:
                ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannySmackPlayer = true
                ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).playerCaught = true
              playerStartCar = false
              engineOnSound.SetActive(false)
              engineOffSound.SetActive(true)
              engineStartSound.SetActive(false)
              grannyStandBesideCar = false
              ObjectHolder.SetActive(true)
              yield return new WaitForSeconds(0.6)
              yield return new WaitForSeconds(0.3)
              ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerHit()
              GrannyGonnaSmack = false
              engineOffSound.SetActive(false)
            else:
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
          else:
            playerNearGranny = false
            GrannyGonnaSmack = false
            navComponent.speed = 0.0
            if not dontHitPlayer:
              ((playerCrawl)playerHukaKnapp.GetComponent(typeof(playerCrawl))).standUp()
              playerHukaKnappParent.SetActive(false)
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Hit")
              ((playerCaught)player.GetComponent(typeof(playerCaught))).startFOV = true
              ((playerCaught)player.GetComponent(typeof(playerCaught))).grannyTakePlayer = true
              if PlayerPrefs.GetInt("NightMareOnOff") == 1:
                ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).grannySmackPlayer = true
                ((fadeUpDownGrannyHunt)GrannyHuntMusicHolder.GetComponent(typeof(fadeUpDownGrannyHunt))).playerCaught = true
              if Spider.activeSelf:
                ((spiderControll)Spider.GetComponent(typeof(spiderControll))).grannyCaughtPlayer()
              yield return new WaitForSeconds(0.6)
              ((soundEffects)playerSounds.GetComponent(typeof(soundEffects))).playerGetHit()
              yield return new WaitForSeconds(0.3)
              ((playerInBeartrap)gameController.GetComponent(typeof(playerInBeartrap))).playerHit()
            else:
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
      elif (!this.playerHidingUnderBed:
        ((playerCrawl)playerHukaKnapp.GetComponent(typeof(playerCrawl))).standUp()
        playerHukaKnappParent.SetActive(false)
        if navComponent.velocity == Vector3.zero:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
        ((playerCaught)player.GetComponent(typeof(playerCaught))).startFOV = true
        ((playerCaught)player.GetComponent(typeof(playerCaught))).grannyTakePlayer = true
        GrannyGonnaSmack = false
      navComponent.speed = 0.0
    var break: Variant

  func followPlayer():
    if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
      droppingBeartrap = false
      if not grannySeeDoor  and  not grannySeeLockedDoor:
        navComponent.speed = grannysVarSpeed
      navComponent.stoppingDistance = 2.0
      if navComponent.velocity != Vector3.zero:
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
      else:
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = grannysAnimSpeed
      target = player
      GrannySearching = false
      startTimerSearch = false
      timerSearch = 0.0

  func newNav():
    if not hitByArrow  and  not hitByGun  and  not bastuKilled  and  not hitByCar  and  not hitByPepperStart  and  not freeze:
      droppingBeartrap = false
      if not grannyHearPlayer:
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNav(Clone)"))
        Object.queue_free  # TODO: Destroy(GameObject.Find("TempNav(Clone)Old"))
      if not grannyHearObject:
        if GameObject.FindGameObjectsWithTag("noiseobject") != null:
          NPoints = GameObject.FindGameObjectsWithTag("noiseobject")
          for i in range(int(this.NPoints.Length)):
            Object.queue_free  # TODO: Destroy(NPoints[i])
        StartCoroutine(cleaning())
      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.9
      navComponent.SetDestination(target.position)
      navComponent.speed = 1.2
      waypointWaitTime = false
      safeTimer = 0.0
      if number == 1.0  or  number == 2.0:
        target = nav1
      if number == 3.0  or  number == 4.0:
        target = nav2
      if number == 5.0  or  number == 6.0:
        target = nav3
      if number == 7.0  or  number == 8.0:
        target = nav4
      if number == 9.0  or  number == 10.0:
        target = nav5
      if number == 11.0  or  number == 12.0:
        target = nav6
      if number == 13.0  or  number == 14.0:
        target = nav7
      if number == 15.0  or  number == 16.0:
        target = nav8
      if number == 17.0  or  number == 18.0:
        target = nav9
      if number == 19.0  or  number == 20.0:
        target = nav10
      if number == 21.0  or  number == 22.0:
        target = nav11
      if number == 23.0  or  number == 24.0:
        target = nav12
      if number == 25.0  or  number == 26.0:
        target = nav13
      if number == 27.0  or  number == 28.0:
        target = nav14
      if number == 29.0  or  number == 30.0:
        target = nav15
      if number == 31.0  or  number == 32.0:
        target = nav16

  func cleaning():
    yield return new WaitForSeconds(15.0)
    StartCoroutine(((furnitureControlls)gameController.GetComponent(typeof(furnitureControlls))).cleanUp())
    var break: Variant

  var myTransform: Node3D

  var grannyEye: Node3D

  var grannyLock: Node3D

  var target: Node3D

  var bedtargetTemp1: Node3D

  var bedtargetTemp2: Node3D

  var bedtargetTemp3: Node3D

  var coffintargetTemp4: Node3D

  var coffintargetTempBY: Node3D

  var cartargetTemp: Node3D

  var bedCam1: Node3D

  var bedCam2: Node3D

  var bedCam3: Node3D

  var coffinHead1: Node3D

  var coffinHead2: Node3D

  var carHead: Node3D

  var hidingUnderBed1: bool

  var hidingUnderBed2: bool

  var hidingUnderBed3: bool

  var hidingInCoffin4: bool

  var hidingInCoffinBY: bool

  var hidingInCar: bool

  var playerHiding: bool

  var playerInHole: bool

  var grannyInBastu: bool

  var bastuswitchOn: bool

  var bastuBomNere: bool

  var bastuTimeOff: bool

  var bastuTimer: float

  var bastuDoorTimer: float

  var bastuDoor: Node3D

  var bastuDoorCarv: Variant

  var bastuBom: Node3D

  var StartbastuSafeTimer: bool

  var bastuSafeTimer: float

  var player: Node3D

  var Player: Node3D

  var playerPos: Node3D

  var navComponent: Variant

  var number: float

  var speed: float

  var nav1: Node3D

  var nav2: Node3D

  var nav3: Node3D

  var nav4: Node3D

  var nav5: Node3D

  var nav6: Node3D

  var nav7: Node3D

  var nav8: Node3D

  var nav9: Node3D

  var nav10: Node3D

  var nav11: Node3D

  var nav12: Node3D

  var nav13: Node3D

  var nav14: Node3D

  var nav15: Node3D

  var nav16: Node3D

  var seePlayer: bool

  var seePlayerTimer: bool

  var offScreenDot: float

  var waypointStop: bool

  var waypointStart: bool

  var distanceWaypoint: float

  var distance: float

  var attackDistance: float

  var waypointWaitTime: bool

  var timerOnOff: bool

  var timer: float

  var timerSee: float

  var timerSearch: float

  var timerBed: float

  var safeTimer: float

  var resetSafeTimer: bool

  var startTimerSearch: bool

  var GrannySearching: bool

  var GrannySearch: bool

  var GrannyMoving: bool

  var attackingPlayer: bool

  var huntPlayer: bool

  var grannyIsFollow: bool

  var animationHolder: Node3D

  var startWalk: bool

  var stopWalk: bool

  var startAttack: bool

  var grannyHearPlayer: bool

  var grannyHearObject: bool

  var playerHidingUnderBed: bool

  var playerHidingInCoffin: bool

  var playerHidingInCoffinBackyard: bool

  var playerHidingInCar: bool

  var grannyStandBesideCar: bool

  var grannyLookUnderBed: bool

  var allBedButtons: Node3D

  var playerGetCaught: bool

  var checkInstansName: bool

  var playerFallDeath: bool

  var dontHitPlayer: bool

  var doorRay: Node3D

  var checkGround: Node3D

  var seeClosedDoorTimer: float

  var grannySeeDoor: bool

  var grannySeeLockedDoor: bool

  var stopSeeLockedDoor: bool

  var gameController: Node3D

  var playerCaughtLastTime: bool

  var playerHukaKnapp: Node3D

  var playerHukaKnappParent: Node3D

  var optionButton: Node3D

  var PlayerCoffinPos: Node3D

  var PlayerCoffinBYPos: Node3D

  var PlayerCarPos: Node3D

  var coffinLock: Node3D

  var coffinLockBY: Node3D

  var Spider: Node3D

  var bearTrap: Node3D

  var bearTrapOrganic: Node3D

  var bearTrapSP: Node3D

  var droppingBeartrap: bool

  var soundPlaying: bool

  var soundHolder1: Node3D

  var soundHolder2: Node3D

  var soundHolder3: Node3D

  var playerSounds: Node3D

  var grannySounds: Node3D

  public GameObject[] NPoints

  var seeStairs: bool

  var hitByArrow: bool

  var hitByGun: bool

  var hitByCar: bool

  var hitByPepper: bool

  var hitByPepperStart: bool

  var freeze: bool

  var bastuKilled: bool

  var ragdollSpawn: bool

  var grannyRagdoll: Node3D

  var grannyForceRagdoll: Node3D

  var grannyFreezedoll: Node3D

  var grannyDisaper: Node3D

  var grannyGoneNormalText1: Node3D

  var grannyGoneEasyText1: Node3D

  var grannyGoneHardText1: Node3D

  var grannyGoneExtremeText1: Node3D

  var grannyGoneEasyShotText: Node3D

  var grannyGoneNormalShotText: Node3D

  var grannyGoneHardShotText: Node3D

  var grannyGoneExtremeShotText: Node3D

  var grannysVarSpeed: float

  var grannysAnimSpeed: float

  var turnFacePlayer: bool

  var playerInPrison: bool

  var prisondoorClosed: bool

  var playerNearGranny: bool

  var GrannyGonnaSmack: bool

  var playerHaveTeddy: bool

  var spiderIsDead: bool

  var playerStartCar: bool

  var grannyEyeColorTimerOn: bool

  var grannyEyeColorTimer: float

  var blindTimer := 30.0

  var grannyPepperReact: bool

  var grannyEyeColor: Node3D

  var teddyMusicHolder: Node3D

  var GrannyHuntMusicHolder: Node3D

  var startCarButton: Node3D

  var forwardButton: Node3D

  var reverseButton: Node3D

  var engineOnSound: Node3D

  var engineOffSound: Node3D

  var engineStartSound: Node3D

  var ObjectHolder: Node3D

  var grannyCloseTrigger: Node3D
