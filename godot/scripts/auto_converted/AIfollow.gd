# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/AIfollow.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name AIfollow
extends Node  # TODO: was MonoBehaviour
  func _init():
    timerOnOff = true
    damp = 5
    seeRange = 10.0
    attackRange = 4.0
    stopFollowRange = 4.0
    RobotRotatespeed = 0.1
    seeOpenDoorTimer = 5.0
    seeClosedDoorTimer = 3.0
    seeClosedGarderobDoorTimer = 3.0
    timerCount2 = 2.0

  func _ready():
    var component := base.GetComponent<AudioSource>()
    component.clip = maniacFootstepsWalk
    component.Play()
    stopFollow = true
    number = Random.Range(1, 39)
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
    if number == 33.0  or  number == 34.0:
      target = GameObject.Find("Nav17").self  # TODO: was transform
    if number == 35.0  or  number == 36.0:
      target = GameObject.Find("Nav18").self  # TODO: was transform
    if number == 37.0  or  number == 38.0:
      target = GameObject.Find("Nav19").self  # TODO: was transform
    monsterHeadAnim.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("ManiacHeadAnim")
    animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 1.4
    if navComponent.velocity != Vector3.zero:
      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
    timer = 15.0
    navComponent = (NavMeshAgent)self  # TODO: was transform.GetComponent(typeof(NavMeshAgent))
    player = GameObject.Find("Player").self  # TODO: was transform
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
    nav17 = GameObject.Find("Nav17").self  # TODO: was transform
    nav18 = GameObject.Find("Nav18").self  # TODO: was transform
    nav19 = GameObject.Find("Nav19").self  # TODO: was transform
    StucktimerOnOff = true
    ((maniacBreath)breathSoundHolder.GetComponent(typeof(maniacBreath))).maniacBreathSlow()

  func _process(_delta):
    var raycastHit := default(RaycastHit)
    if monsterIsFreezed  and  not disableMonster:
      disableMonster = true
      navComponent.speed = 0.0
      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["attack"].speed = 0.0
      animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 0.0
      ((maniacBreath)breathSoundHolder.GetComponent(typeof(maniacBreath))).maniafreezed()
      print("NOS!!!")
    if monsterHurt  and  not monsterIsFreezed:
      if timerCount2 == 2.0:
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("hurt")
        monsterHand.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = false
      navComponent.speed = 0.0
    if monsterHurt:
      timerCount2 -= Time.deltaTime
      if timerCount2 < 0.0:
        monsterHurt = false
        monsterHand.get_node(\"TODO_Collider\")  # TODO: GetComponent.enabled = true
        timerCount2 = 2.0
    if not monsterHurt  and  not monsterIsFreezed:
      if not stopFollow:
      navComponent.updateRotation = true
      distance = Vector3.Distance(player.position, position)
      distanceWaypoint = Vector3.Distance(target.position, position)
      if navComponent.velocity != Vector3.zero:
        maniacMoving = true
        if stopFollow:
          if navComponent.velocity != Vector3.zero:
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 1.4
          if not footstepPlaying:
            footstepPlaying = true
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = maniacFootstepsWalk
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
        elif (!this.stopFollow:
          if navComponent.velocity != Vector3.zero:
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 1.4
          if not footstepPlaying:
            footstepPlaying = true
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = maniacFootstepsFollow
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
      elif (this.navComponent.velocity == Vector3.zero:
        maniacMoving = false
        if stopFollow:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
          if footstepPlaying:
            footstepPlaying = false
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
        elif (!this.stopFollow:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
          if footstepPlaying:
            footstepPlaying = false
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
      if seePlayer:
        maniacHandSmash.SetActive(true)
      elif (!this.seePlayer:
        maniacHandSmash.SetActive(false)
      if seePlayer  and  not attackingPlayer:
        playerVisibleTimer -= Time.deltaTime
      if playerVisibleTimer <= 0.0:
        seePlayer = false
        if not seePlayer:
          print("Timer på 0")
          seePlayer = false
          playerVisibleTimer = 10.0
      if playerHiding:
        if not reduseraTimerHiding  and  playerVisibleTimer > 4.0:
          reduseraTimerHiding = true
          playerVisibleTimer = 4.0
      elif (!this.playerHiding:
        reduseraTimerHiding = false
      if playerHiding:
        if seePlayer:
          if not PlayerVisible:
            attackingPlayer = false
            followPlayer()
            if not ManiacSeeLocker:
              stopHittingPlayer = true
            elif (this.ManiacSeeLocker:
              ManiacOpenLocker = true
              print("Står vid skåpet")
          elif (this.PlayerVisible:
            if distance < attackRange:
              stopHittingPlayer = false
              attackingPlayer = true
              StartCoroutine(attackPlayer())
            elif (this.seeLockerDoor:
              stopHittingPlayer = true
          elif (this.PlayerVisible:
            if not ManiacSeeLocker:
          elif (this.PlayerVisible  or  this.ManiacSeeLocker:
        elif (!this.seePlayer  and  !this.PlayerVisible:
          if seeLockerDoor:
            stopHittingPlayer = true
          attackingPlayer = false
      elif (!this.playerHiding:
        if distance < attackRange  and  seePlayer:
          if not seeLockerDoor:
            attackingPlayer = true
            target = player
            StartCoroutine(attackPlayer())
            stopHittingPlayer = false
        elif (this.distance > this.attackRange  and  this.distance < this.seeRange  and  this.seePlayer:
          attackingPlayer = false
          followPlayer()
          if not FollowPlayer:
            FollowPlayer = true
            get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
      if not timerStop  and  timerOnOff:
        timer += Time.deltaTime
      if distanceWaypoint < 7.0  and  not attackingPlayer  and  stopFollow:
        timerOnOff = true
        randomNav()
      if timer >= 10.0:
        timerOnOff = false
        timer = 0.0
      if target:
        navComponent.SetDestination(target.position)
        if not seePlayer:
          if distanceWaypoint < 3.0:
            if timerOnOff  and  waypointStop:
              print("15")
              if not maniacMoving:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
              elif (this.maniacMoving:
                if navComponent.velocity != Vector3.zero:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 1.4
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = maniacFootstepsWalk
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
              waypointStop = false
          elif (this.distanceWaypoint > 3f  and  !this.timerOnOff  and  !this.seePlayer  and  !this.waypointStop:
            if maniacMoving:
              if navComponent.velocity != Vector3.zero:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 1.4
              get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = maniacFootstepsWalk
              get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
            elif (!this.maniacMoving:
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
              get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
            waypointStop = true
      if seePlayer:
        target = player
        if distance < seeRange:
          stopFollow = false
          if not attackingPlayer:
            followPlayer()
      elif (!this.seePlayer  and  !this.stopFollow:
        StartCoroutine(stopfollowPlayer())
        stopFollow = true
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
        navComponent.speed = 0.0
        FollowPlayer = false
      if not monsterIsFreezed:
        var vector := this.yellowRay1.transform.TransformDirection(Vector3.forward)
        Debug.DrawRay(yellowRay1.position, vector * 40.0, Color.yellow)
        if Physics.Raycast(yellowRay1.transform.position, vector, out raycastHit, yellowRayLenght)  and  seePlayer:
          if raycastHit.collider.gameObject.tag == "Player":
            PlayerVisible = true
            DoorClosedVisible = false
            DoorOpenVisible = false
            playerVisibleTimer = 10.0
          if raycastHit.collider.gameObject.tag != "Player":
            PlayerVisible = false
          if not (raycastHit.collider.gameObject.tag == "doorClosed"):
            if not (raycastHit.collider.gameObject.tag == "doorOpen"):
              if raycastHit.collider.gameObject.tag == "lockerDoor":
      if not monsterIsFreezed:
        var vector2 := this.yellowRay2.transform.TransformDirection(Vector3.forward)
        Debug.DrawRay(yellowRay2.position, vector2 * 6.0, Color.green)
        if Physics.Raycast(yellowRay2.transform.position, vector2, out raycastHit, 6.0):
          if seePlayer:
            if raycastHit.collider.gameObject.tag == "doorClosed":
              seeClosedDoorTimer -= 1.0 * Time.deltaTime
              if navComponent.velocity == Vector3.zero:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
              if seeClosedDoorTimer < 0.0:
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorOpen")
                if stopFollow:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
                  seeClosedDoorTimer = 3.0
              if not stopFollow:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
            elif (raycastHit.collider.gameObject.tag == "garderobDoorV":
              seeClosedGarderobDoorTimer -= 1.0 * Time.deltaTime
              if navComponent.velocity == Vector3.zero:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
              if seeClosedGarderobDoorTimer < 0.0:
                seeClosedGarderobDoorTimer = 3.0
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("VgarderobDoorOpen")
                if stopFollow:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
                  seeClosedGarderobDoorTimer = 3.0
              if not stopFollow:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
            elif (raycastHit.collider.gameObject.tag == "garderobDoorH":
              MonoBehaviour.print("See garderobDoor")
              seeClosedGarderobDoorTimer -= 1.0 * Time.deltaTime
              if navComponent.velocity == Vector3.zero:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
              if seeClosedGarderobDoorTimer < 0.0:
                seeClosedGarderobDoorTimer = 3.0
                MonoBehaviour.print("See Closed Door")
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("HgarderobDoorOpen")
                MonoBehaviour.print("Öppnar flera ggr!!!")
                if stopFollow:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
                  seeClosedGarderobDoorTimer = 3.0
              if not stopFollow:
                animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
            else:
              seeClosedDoorTimer = 3.0
          elif (!this.seePlayer:
            if raycastHit.collider.gameObject.tag == "doorClosed":
              seeClosedDoorTimer -= 1.0 * Time.deltaTime
              animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
              if seeClosedDoorTimer < 0.0:
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorOpen")
                if stopFollow:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
                  seeClosedDoorTimer = 3.0
            elif (raycastHit.collider.gameObject.tag == "doorLeftClosed":
              seeClosedDoorTimer -= 1.0 * Time.deltaTime
              if seeClosedDoorTimer < 0.0:
                raycastHit.collider.self.get_node(\"TODO_Animation\")  # TODO: GetComponent.Play("InnerdoorLeftOpen")
                if stopFollow:
                  animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
                  get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
                  seeClosedDoorTimer = 3.0
      if seePlayer  and  not PlayerVisible  and  distance < attackRange:
        var normalized := (this.target.position - base.transform.position).normalized
        var b := Quaternion.LookRotation(normalized)
        quaternion  # TODO: Unity->Godot rotation = Quaternion.Slerp(quaternion  # TODO: Unity->Godot rotation, b, Time.deltaTime * RobotRotatespeed)
        navComponent.stoppingDistance = 4.5
      if StucktimerOnOff:
        Stucktimer += Time.deltaTime
      if Stucktimer > 40.0  and  not FollowPlayer:
        Stucktimer += Time.deltaTime
        Stucktimer = 0.0
        StartCoroutine(randomNavAfterAttack())

  func letMomSwing():

  func stopAndAttack():
    yield return new WaitForSeconds(3.0)
    if not stopAndAttackPlayer:
      var relativePos := this.target.position - base.transform.position
      var rotation := Quaternion.LookRotation(relativePos)
      quaternion  # TODO: Unity->Godot rotation = Quaternion.RotateTowards(quaternion  # TODO: Unity->Godot rotation, rotation, Time.deltaTime * RobotRotatespeed)
      stopAndAttackPlayer = true
      yield return new WaitForSeconds(6.0)
      stopAndAttackPlayer = false
    var break: Variant

  func playerStillHiding():

  func followPlayer():
    if not monsterIsFreezed:
      if not maniacSeePlayer:
        maniacSeePlayer = true
        ((maniacBreath)breathSoundHolder.GetComponent(typeof(maniacBreath))).maniacBreathFast()
        ((maniacScream)screamSoundHolder.GetComponent(typeof(maniacScream))).maniacSeePlayer()
      get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = maniacFootstepsFollow
      navComponent.stoppingDistance = 4.5
      navComponent.speed = 7.6
      if maniacMoving:
        if navComponent.velocity != Vector3.zero:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 2.0
      elif (!this.maniacMoving:
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
      if startHittingPlayer:
        startHittingPlayer = false
      if not playerHiding:

  func stopfollowPlayer():
    if not monsterIsFreezed:
      if maniacSeePlayer:
        maniacSeePlayer = false
        ((maniacBreath)breathSoundHolder.GetComponent(typeof(maniacBreath))).maniacBreathSlow()
      waypointWaitTime = true
      timerStop = false
      yield return new WaitForSeconds(5.0)
      StartCoroutine(randomNavAfterAttack())
      FollowPlayer = false
    var break: Variant

  func attackPlayer():
    if not monsterIsFreezed:
      FollowPlayer = false
      if PlayerVisible  or  not PlayerVisible:
        if not stopHittingPlayer:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["attack"].speed = 1.2
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("attack")
          yield return new WaitForSeconds(0.5)
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
          startHittingPlayer = true
        else:
          startHittingPlayer = false
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
        navComponent.speed = 0.0
      elif (!this.PlayerVisible:
        stopHittingPlayer = true
        startHittingPlayer = false
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
    var break: Variant

  func randomNavAfterAttack():
    if not monsterIsFreezed:
      stopFollow = true
      FollowPlayer = false
      number = Random.Range(1, 40)
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
      if number == 33.0  or  number == 34.0:
        target = GameObject.Find("Nav17").self  # TODO: was transform
      if number == 35.0  or  number == 36.0:
        target = GameObject.Find("Nav18").self  # TODO: was transform
      if number == 37.0  or  number == 39.0:
        target = GameObject.Find("Nav19").self  # TODO: was transform
      yield return new WaitForSeconds(10.0)
      navComponent.speed = 3.8
      if maniacMoving:
        if navComponent.velocity != Vector3.zero:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 1.4
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = maniacFootstepsWalk
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
      elif (!this.maniacMoving:
        animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
        get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
      attackingPlayer = false
      print("Now Move On!!")
      Stucktimer = 0.0
    var break: Variant

  func randomNav():
    if not monsterIsFreezed  and  timerOnOff:
      waypointWaitTime = true
      if timer >= 10.0:
        navComponent.speed = 0.0
        if not maniacMoving:
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("idle")
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Stop()
        elif (this.maniacMoving:
          if navComponent.velocity != Vector3.zero:
            animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent.CrossFade("Walk")
          animationHolder.get_node(\"TODO_Animation\")  # TODO: GetComponent["Walk"].speed = 1.4
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.clip = maniacFootstepsWalk
          get_node(\"TODO_AudioSource\")  # TODO: GetComponent.Play()
        number = Random.Range(1, 8)
        newNav()

  func newNav():
    navComponent.speed = 3.8
    waypointWaitTime = false
    if number == 1.0:
      target = nav1
    if number == 2.0:
      target = nav2
    if number == 3.0:
      target = nav3
    if number == 4.0:
      target = nav4
    if number == 5.0:
      target = nav5
    if number == 6.0:
      target = nav6
    if number == 7.0:
      target = nav7
    if number == 8.0:
      target = nav8
    if number == 9.0:
      target = nav9
    if number == 10.0:
      target = nav10
    if number == 11.0:
      target = nav11
    if number == 12.0:
      target = nav12
    if number == 13.0:
      target = nav13
    if number == 14.0:
      target = nav14
    if number == 15.0:
      target = nav15
    if number == 16.0:
      target = nav16
    if number == 17.0:
      target = nav17
    if number == 18.0:
      target = nav18
    if number == 19.0:
      target = nav19

  func afterFollow():
    yield return new WaitForSeconds(8.0)
    print("Now Move On!!")
    var break: Variant

  var myTransform: Node3D

  var slendrina: Node3D

  var slendrinaBody: Node3D

  var target: Node3D

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

  var nav17: Node3D

  var nav18: Node3D

  var nav19: Node3D

  var player: Node3D

  var navComponent: Variant

  var timerOnOff: bool

  var timerStop: bool

  var seePlayer: bool

  var attackingPlayer: bool

  var FollowPlayer: bool

  var stopFollow: bool

  var robotdead: bool

  var playerHiding: bool

  var monsterSearch: bool

  var waypointWaitTime: bool

  var breakDoor: bool

  var startHittingPlayer: bool

  var stopHittingPlayer: bool

  var PlayerVisible: bool

  var DoorOpenVisible: bool

  var DoorClosedVisible: bool

  var garderobVisible: bool

  var stopAndAttackPlayer: bool

  var slendrinaActive: bool

  var waypointStop: bool

  var huntingPlayer: bool

  var timer: float

  var Stucktimer: float

  var StucktimerOnOff: bool

  var Huntingtimer: float

  var HuntingtimerOn: bool

  var number: float

  var numberRoar: float

  var animationHolder: Node3D

  var damping: float

  var damp: int

  var rotationSpeed: float

  var seeRange: float

  var attackRange: float

  var stopFollowRange: float

  var distance: float

  var distanceWaypoint: float

  var soundEffectPlay: bool

  var RobotRotatespeed: float

  var robotEyes: Node3D

  var yellowRay1: Node3D

  var yellowRay2: Node3D

  var RedRay: Node3D

  var monsterAnimHandDoor: Node3D

  var roboteyeBack: Node3D

  var monsterHeadAnim: Node3D

  var followSoundHolder: Node3D

  var roarSoundHolder: Node3D

  var FootstepSoundHolder: Node3D

  var BreathingSoundHolder: Node3D

  var musicHolder: Node3D

  var HuntmusicHolder: Node3D

  var PlayerDead: bool

  var ManiacSeeLocker: bool

  var ManiacOpenLocker: bool

  var seeLockerDoor: bool

  var seeSmashDoor: bool

  var LockerButtons: Node3D

  var playerVisibleTimer: float

  var yellowRayLenght: float

  var maniacHandSmash: Node3D

  var reduseraTimerHiding: bool

  var soundeffectsHolder: Node3D

  var maniacFootstepsWalk: Variant

  var maniacFootstepsFollow: Variant

  var maniacSeePlayer: bool

  var breathSoundHolder: Node3D

  var screamSoundHolder: Node3D

  var maniacMoving: bool

  var footstepPlaying: bool

  var seeOpenDoorTimer: float

  var seeClosedDoorTimer: float

  var seeClosedGarderobDoorTimer: float

  var monsterHurt: bool

  var monsterHand: Node3D

  var timerCount2: float

  var monsterIsFreezed: bool

  var disableMonster: bool

  var gameController: Node3D
