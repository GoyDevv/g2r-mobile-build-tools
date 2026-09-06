# Auto-converted from /home/granny-src-full/Granny - Source/Assets/Scripts/furnitureControlls.cs by cs2gd.py (best-effort).
# Review every TODO before relying on this script.


class_name furnitureControlls
extends Node  # TODO: was MonoBehaviour
  func cleanUp():
    if GameObject.Find("LitetBordVR(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LitetBordVR(Clone)"))
      Object.Instantiate<GameObject>(bordVR, bordVRPos.position, bordVRPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LitetBordVR(Clone)").self  # TODO: was transform.name = "LitetBordVR"
    if GameObject.Find("LampaVR(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LampaVR(Clone)"))
      Object.Instantiate<GameObject>(lampaVR, lampaVRPos.position, lampaVRPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LampaVR(Clone)").self  # TODO: was transform.name = "LampaVR"
    if GameObject.Find("TavlaVR(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("TavlaVR(Clone)"))
      Object.Instantiate<GameObject>(TavlaVR, TavlaVRPos.position, TavlaVRPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("TavlaVR(Clone)").self  # TODO: was transform.name = "TavlaVR"
    if GameObject.Find("RumBVTavla(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("RumBVTavla(Clone)"))
      Object.Instantiate<GameObject>(TavlaRumBV, TavlaRumBVPos.position, TavlaRumBVPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("RumBVTavla(Clone)").self  # TODO: was transform.name = "RumBVTavla"
    if GameObject.Find("RumBVLampa(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("RumBVLampa(Clone)"))
      Object.Instantiate<GameObject>(LampaRumBV, LampaRumBVPos.position, LampaRumBVPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("RumBVLampa(Clone)").self  # TODO: was transform.name = "RumBVLampa"
    if GameObject.Find("LjusstakeHall(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LjusstakeHall(Clone)"))
      Object.Instantiate<GameObject>(LjusstakeHall, LjusstakeHallPos.position, LjusstakeHallPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LjusstakeHall(Clone)").self  # TODO: was transform.name = "LjusstakeHall"
    if GameObject.Find("LjusstakeHall2(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LjusstakeHall2(Clone)"))
      Object.Instantiate<GameObject>(LjusstakeHall2, LjusstakeHallPos2.position, LjusstakeHallPos2.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LjusstakeHall2(Clone)").self  # TODO: was transform.name = "LjusstakeHall2"
    if GameObject.Find("LjusstakeCellar(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LjusstakeCellar(Clone)"))
      Object.Instantiate<GameObject>(LjusstakeCellar, LjusstakeCellarPos.position, LjusstakeCellarPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LjusstakeCellar(Clone)").self  # TODO: was transform.name = "LjusstakeCellar"
    if GameObject.Find("LitenTavla1(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LitenTavla1(Clone)"))
      Object.Instantiate<GameObject>(LitenTavla1, LitenTavla1Pos.position, LitenTavla1Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LitenTavla1(Clone)").self  # TODO: was transform.name = "LitenTavla1"
    if GameObject.Find("LitenTavla2(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LitenTavla2(Clone)"))
      Object.Instantiate<GameObject>(LitenTavla2, LitenTavla2Pos.position, LitenTavla2Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LitenTavla2(Clone)").self  # TODO: was transform.name = "LitenTavla2"
    if GameObject.Find("LitenTavla3(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LitenTavla3(Clone)"))
      Object.Instantiate<GameObject>(LitenTavla3, LitenTavla3Pos.position, LitenTavla3Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LitenTavla3(Clone)").self  # TODO: was transform.name = "LitenTavla3"
    if GameObject.Find("TavlaSR1(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("TavlaSR1(Clone)"))
      Object.Instantiate<GameObject>(TavlaSR1, TavlaSR1Pos.position, TavlaSR1Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("TavlaSR1(Clone)").self  # TODO: was transform.name = "TavlaSR1"
    if GameObject.Find("ChairSR1(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("ChairSR1(Clone)"))
      Object.Instantiate<GameObject>(ChairSR1, ChairSR1Pos.position, ChairSR1Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("ChairSR1(Clone)").self  # TODO: was transform.name = "ChairSR1"
    if GameObject.Find("Galge(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Galge(Clone)"))
      Object.Instantiate<GameObject>(Galge, GalgePos.position, GalgePos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Galge(Clone)").self  # TODO: was transform.name = "Galge"
    if GameObject.Find("LampaSR2(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LampaSR2(Clone)"))
      Object.Instantiate<GameObject>(LampaSR2, LampaSR2Pos.position, LampaSR2Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LampaSR2(Clone)").self  # TODO: was transform.name = "LampaSR2"
    if GameObject.Find("LitetBordSR3(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("LitetBordSR3(Clone)"))
      Object.Instantiate<GameObject>(LitetBordSR3, LitetBordSR3Pos.position, LitetBordSR3Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("LitetBordSR3(Clone)").self  # TODO: was transform.name = "LitetBordSR3"
    if GameObject.Find("TavlaSR3(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("TavlaSR3(Clone)"))
      Object.Instantiate<GameObject>(TavlaSR3, TavlaSR3Pos.position, TavlaSR3Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("TavlaSR3(Clone)").self  # TODO: was transform.name = "TavlaSR3"
    if GameObject.Find("TavlaKitchen(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("TavlaKitchen(Clone)"))
      Object.Instantiate<GameObject>(TavlaKitchen, TavlaKitchenPos.position, TavlaKitchenPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("TavlaKitchen(Clone)").self  # TODO: was transform.name = "TavlaKitchen"
    if GameObject.Find("Tallrik1(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Tallrik1(Clone)"))
      Object.Instantiate<GameObject>(Tallrik1, Tallrik1Pos.position, Tallrik1Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Tallrik1(Clone)").self  # TODO: was transform.name = "Tallrik1"
    if GameObject.Find("Tallrik2(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Tallrik2(Clone)"))
      Object.Instantiate<GameObject>(Tallrik2, Tallrik2Pos.position, Tallrik2Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Tallrik2(Clone)").self  # TODO: was transform.name = "Tallrik2"
    if GameObject.Find("Tallrik3(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Tallrik3(Clone)"))
      Object.Instantiate<GameObject>(Tallrik3, Tallrik3Pos.position, Tallrik3Pos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Tallrik3(Clone)").self  # TODO: was transform.name = "Tallrik3"
    if GameObject.Find("GallerDoor(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("GallerDoor(Clone)"))
      Object.Instantiate<GameObject>(GallerDoor, GallerDoorPos.position, GallerDoorPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("GallerDoor(Clone)").self  # TODO: was transform.name = "GallerDoor"
    if GameObject.Find("WoodenBox(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("WoodenBox(Clone)"))
      Object.Instantiate<GameObject>(WoodenBox, WoodenBoxPos.position, WoodenBoxPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("WoodenBox(Clone)").self  # TODO: was transform.name = "WoodenBox"
    if GameObject.Find("Pedistal(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("Pedistal(Clone)"))
      Object.Instantiate<GameObject>(Pedistal, PedistalPos.position, PedistalPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("Pedistal(Clone)").self  # TODO: was transform.name = "Pedistal"
    if GameObject.Find("ManikinDoll(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("ManikinDoll(Clone)"))
      Object.Instantiate<GameObject>(Manikin, ManikinPos.position, ManikinPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("ManikinDoll(Clone)").self  # TODO: was transform.name = "ManikinDoll"
    if GameObject.Find("MetalCanOuthouse(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("MetalCanOuthouse(Clone)"))
      Object.Instantiate<GameObject>(BurkOH, BurkOHPos.position, BurkOHPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("MetalCanOuthouse(Clone)").self  # TODO: was transform.name = "MetalCanOuthouse"
    if GameObject.Find("OldHouseTavla(Clone)"):
      Object.queue_free  # TODO: Destroy(GameObject.Find("OldHouseTavla(Clone)"))
      Object.Instantiate<GameObject>(TavlaOH, TavlaOHPos.position, TavlaOHPos.rotation)
      yield return new WaitForSeconds(0.5)
      GameObject.Find("OldHouseTavla(Clone)").self  # TODO: was transform.name = "OldHouseTavla"
    var break: Variant

  var bordVR: Node3D

  var bordVRPos: Node3D

  var lampaVR: Node3D

  var lampaVRPos: Node3D

  var TavlaVR: Node3D

  var TavlaVRPos: Node3D

  var TavlaRumBV: Node3D

  var TavlaRumBVPos: Node3D

  var LampaRumBV: Node3D

  var LampaRumBVPos: Node3D

  var LjusstakeHall: Node3D

  var LjusstakeHallPos: Node3D

  var LjusstakeHall2: Node3D

  var LjusstakeHallPos2: Node3D

  var LjusstakeCellar: Node3D

  var LjusstakeCellarPos: Node3D

  var LitenTavla1: Node3D

  var LitenTavla1Pos: Node3D

  var LitenTavla2: Node3D

  var LitenTavla2Pos: Node3D

  var LitenTavla3: Node3D

  var LitenTavla3Pos: Node3D

  var TavlaSR1: Node3D

  var TavlaSR1Pos: Node3D

  var ChairSR1: Node3D

  var ChairSR1Pos: Node3D

  var Galge: Node3D

  var GalgePos: Node3D

  var LampaSR2: Node3D

  var LampaSR2Pos: Node3D

  var LitetBordSR3: Node3D

  var LitetBordSR3Pos: Node3D

  var TavlaSR3: Node3D

  var TavlaSR3Pos: Node3D

  var TavlaKitchen: Node3D

  var TavlaKitchenPos: Node3D

  var Tallrik1: Node3D

  var Tallrik1Pos: Node3D

  var Tallrik2: Node3D

  var Tallrik2Pos: Node3D

  var Tallrik3: Node3D

  var Tallrik3Pos: Node3D

  var GallerDoor: Node3D

  var GallerDoorPos: Node3D

  var WoodenBox: Node3D

  var WoodenBoxPos: Node3D

  var Pedistal: Node3D

  var PedistalPos: Node3D

  var Manikin: Node3D

  var ManikinPos: Node3D

  var BurkOH: Node3D

  var BurkOHPos: Node3D

  var TavlaOH: Node3D

  var TavlaOHPos: Node3D
