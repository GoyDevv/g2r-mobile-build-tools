# Granny (Unity 2018.4.27) → Godot 4.7.2 Migration Log

Workspace: `/home/migration/granny-godot` (original Unity project untouched at
`/sdcard/Download/Granny - Source`). Last updated: 2026-09-04.

## 1. Environment & tooling decisions

- Host: aarch64 Linux (Termux proot). No display, no Unity Editor possible on
  this CPU. Godot **4.7.2 stable arm64** runs headless/`--check-only` fine.
  Godot's *editor/import* path crashes in this environment (jemalloc double-free
  inside editor help-cache generation; consistent across 4.6/4.7, unaffected by
  `LD_PRELOAD` removal, thread counts, or recovery mode). The engine runtime is
  unaffected — all validation is headless run/parse based.
- `LD_PRELOAD=.../libjemalloc.so` is set globally by the environment and must be
  unset (`env -u LD_PRELOAD`) for every Godot invocation.
- Converter candidates: **Unidot**, **Zylann's unity_to_godot**, and
  **Anthogonyst/UnityToGodot** all require a running Unity Editor (or are
  UI-driven Godot addons that drop UI/need heavy RAM). None runnable here.
- **Decision:** a purpose-built converter in `tools/` (Python) parses Unity
  2018.4 YAML directly and emits Godot 4 text resources. Stages:
  1. `stage1_assets.py` — guid DB (`tools/db.json`) + copy textures/audio (raw
     file names sanitized at copy time to match scene `ext_resource` refs).
  2. `stage2_glb.py` — 109 `.obj` → single-mesh `.glb` (hand-built, verified by
     Godot runtime load).
  3. `stage3_materials.py` — 471 Unity `.mat` → `.tres` (Standard/Diffuse +
     3 custom shaders approximated with StandardMaterial3D; transparency kept).
  4. `stage4_anims.py` — 167 legacy `.anim` clips → `.tres` Animation resources
     (fast regex parser — PyYAML was pathologically slow under proot CPU
     emulation). Rotation keys `(t, blend, x, y, z, w)`, per-axis position/scale
     curves merged into Vector3 keys.
  5. `stage5_scenes.py` — 4 scenes + 78 prefabs → `.tscn` (3301 nodes in the
     main Scene). Emits GameObjects/hierarchy, transforms, meshes as instanced
     `.glb` children (ArrayMesh text was a loader crasher here), materials via
     metadata, lights (Unity 0=Spot/1=Directional/2=Point/3=Area mapping fixed),
     colliders (Box/Sphere/Capsule + negative-size fix), RigidBody/StaticBody,
     AudioStreamPlayer3D, NavigationAgent3D/NavigationObstacle3D, `unity_tag`
     metadata + groups, AnimationPlayer hookups, and attaches GDScript ports
     from `tools/ported_scripts.json` onto matching MonoBehaviour nodes.

### Converter quirks fixed along the way (all documented in code)
- Unity YAML is CRLF + per-doc `--- !u!<class> &<anchor>` headers; the loader
  iterates docs with a MULTILINE regex and unwraps the class-name key.
- Node names with spaces crash this build's text loader → names sanitized to
  `[A-Za-z0-9_.-]` with `_` runs collapsed (ports mirror this exactly).
- Root nodes must omit `parent`, children use paths relative to the root.
- Multi-root Unity scenes get a `SceneRoot` wrapper node.
- `Color(r,g,b)` needs 4 args in this build; `light_color`/props are type-aware
  (omni_range vs spot_range/spot_angle).
- Zero-scale transform columns spam singular-basis warnings → scale nudged.

## 2. Converted asset inventory

| Asset | Unity | Godot | Where |
|---|---|---|---|
| Scenes | 4 | 4 .tscn | converted/scenes/ (Menu, SplashScreen, Scene, EndScene) |
| Prefabs | 79 | 78 .tscn | converted/prefabs/ |
| Animation clips | 167 | 167 .tres | converted/animations/ |
| Materials | ~250 unique | 471 .tres | converted/materials/ |
| Meshes | 95 unique obj | 109 .glb | assets/meshes/ |
| Textures | ~560 | assets/textures/ | (raw copy; editor import needed) |
| Audio | ~226 | assets/audio/ | (raw copy; editor import needed) |

All 4 scenes instantiate headless; all 167 animation resources load; 109 glb
meshes verified in-engine.

## 2b. UI conversion (stage 6) — Unity Canvas → Godot Controls

`tools/stage6_ui.py` post-processes each converted scene (run AFTER stage5): it
rebuilds the RectTransform (class 224) trees that stage5 skips and emits Control
nodes for all 19 canvases / 149 rects in the main Scene:

- **Node mapping**: Button (clickable GO), Label (UnityEngine.UI.Text mono,
  fileID 708705254 — carries the string), TextureRect (Image mono with sprite),
  ColorRect (non-white colour, no sprite), Control (containers). Sprite guids
  resolve through `db.json` textures; missing-script uGUI widget guid
  `f70555f1…` (Image+Button union addon script absent from this project) is
  handled for both visuals and clickability.
- **Layout**: Unity anchors map 1:1 to Godot anchor_*; offsets computed from
  anchoredPosition/sizeDelta/pivot with y flipped (Unity UI y-up → Godot
  y-down). Offsets are anchor-line relative; REF = 1920×1080 only matters for
  bottom/right-anchored children. Root canvases (ScreenSpaceOverlay) become
  full-viewport Controls (`parent="."`). `project.godot` sets
  `window/stretch/mode=canvas_items` (aspect keep) so the UI scales to any
  window size.
- **Interactivity**: the original wired buttons at runtime
  (`Start() { btn1.onClick.AddListener(...) }`) — stage6 resolves each UI
  controller's serialized `btn1` target and m_OnClick persistent calls and
  records (target, method). Buttons with a ported controller script attach it
  (scripts self-connect `pressed`); cross-wired buttons get
  `scripts/ui/ui_click_bridge.gd`, which dispatches to the recorded target.
  New ports: `SeeObjects` → `scripts/ui/see_objects.gd` (prompt button →
  `PickUp.set_pick_up()`), `dropObjects` → `scripts/ui/drop_objects.gd`
  (drop button → `InventoryController.check_inventory()`). Menu controllers
  (ClickPlayButton/BackToMenu/clickBeartrapMenu/ClickContinueButton/
  ClickContinueButton2) upgraded to `extends Button` self-connectors and are
  attached by stage6 **to the actual Button node** their `btn1` pointed at
  (the original mono sat on a plain `GameController` Node3D; attaching there
  made Godot drop the script — "inherits Button, can't assign to Node3D").
  `ClickContinueButton` is the button that actually loads the game
  (`GameState.goto_scene("Scene.tscn")`); without it the menu could not
  start the game.
- **Playable flow (verified headless)**: Menu.tscn loads, pressing
  `ContinueButton` triggers `change_scene_to_file("res://converted/scenes/Scene.tscn")`
  and the game scene becomes current.

Results: 7,105 UI nodes emitted (Scene +3,535, Menu +3,482, EndScene +32,
SplashScreen +56). Verified headless: counts Button=50/TextureRect=213 in
Scene, 78 buttons in Menu; **simulated press on PickUpButton sets
`PickUp.pick_up = true`** (original SeeObjects → PickUp chain reproduced).

## 3. Scripting (Phase 4) — semantic ports to GDScript

Architecture kept: ports attach to the same nodes as the Unity components
(`ported_scripts.json` → stage5). Cross-component calls are name-based lookups
(helpers `_find`/`_san`/`_call`) so wiring survives the flattening. UI nodes
(Unity Canvas) are not converted yet, so every UI toggle is a null-safe no-op —
**all ports guard optional nodes and unp converted sub-controllers**.

| Unity class (371 .cs total) | Port | Status / notes |
|---|---|---|
| `GameState` (autoload) | scripts/autoload/game_state.gd | PlayerPrefs + BetweenScenesValues |
| `MaterialFixer` (autoload) | scripts/autoload/material_fixer.gd | scene material hookup |
| `FPSControllerNEW` | scripts/player/fps_controller_new.gd | CharacterBody movement, joystick input, camera, footsteps hooks |
| `Joystick` | scripts/player/joystick.gd | Control-free input helper (UI not converted) |
| `Footsteps` / `soundEffects` / `playerCaught` / `playerDead` | scripts/player/*.gd | sound/state helpers |
| `EnemyAIGranny` (2155 ln) | scripts/ai/enemy_ai_granny.gd | full state machine: NavMeshAgent→manual NavigationAgent3D stepping, sight/hearing, waypoints, doors/rays, bed/coffin/car hiding, bear traps, pepper/blind, sauna (bastu), ragdoll spawns, difficulty profile. AI starts disabled like Unity (`m_Enabled:0`); call `enable_ai()`. |
| `AnimationController` | scripts/player/animation_controller.gd | run/idle/jump blend from body velocity |
| `InventoryController` (819 ln) | scripts/inventory/inventory_controller.gd | 41-item carry state, drop logic (prefab spawn at DropPoint), hint texts |
| `PickUp` (2530 ln) | scripts/interaction/pick_up.gd | forward-ray tag dispatcher, ~60 tags incl. cables/planks/doors/locks/screws/camera/sauna/gears/car parts/sprouts |
| `splashScreenStart` | scripts/menu/splash_screen_start.gd | timed intro → Menu |
| `dropDownOptions` | scripts/menu/drop_down_options.gd | difficulty ↔ DiffData mapping |
| `BackToMenu` / `ClickPlayButton` / `clickBeartrapMenu` | scripts/menu/*.gd | menu button flows |
| `SeeObjects` / `dropObjects` | scripts/ui/*.gd | UI prompt/drop buttons (Button self-connect) |
| `CheckExitDoor`, `startNewDay`, `checkTheCar`, `openDoors`, `skruvplatta*`, `spiderControll`, `CrowControl`, `playerVevar`, `giljotinTrigger`, `prisonDoorOpenClose`, `sprayPepper`, `BastuTrigger`, `BearTrap`, `GrannyHear`, `soundEffectsMenu`, ~350 more | — | **not yet ported** (backlog below) |

### Wiring notes (serialized fields → real scene GO names)
Unity public-object fields referenced GOs by *different* names; the ports bind by
actual GO name (e.g. `SeeRay`→`Main Camera`, `avbitare`→`AvbitareHand`,
`exitkey`→`HouseKeyHand`, `oldShotgunAnim`→`ShotgunHand`,
`playhouseDoor`→`LekhusDoor`, `DdoorLock`→`L1`, `galler`→`PrisonGaller`,
`giljotin`→`KlingTrigger`, `LampaDoor1/2`→`Larmlampa2/1`,
`sprayParticle`→`PepperSpray`, `arrowArmborst`/`newArrow`→`StunnSyringe`).
Full field→name map extracted from Scene.unity (see conversation notes).
Drop prefabs map guid→`converted/prefabs/<name>.tscn` (41 items, e.g.
`newAvbitare`→Avbitare, `newplanka`→PlankaWalk, `newoldShotgun`→ShotgunDrop_Prefab).

### Runtime results (headless, autoloads registered)
- Scene.tscn instantiates: AI refs all resolve (`player_pos`→`Main_Camera`,
  `animation_holder`→`GrannyTest6_1`, eyes/doors/buttons…), Granny AI stays
  alive through physics frames with no script errors after `enable_ai()`.
- Menu/SplashScreen/EndScene load clean; no script errors across all scenes.

## 4. Known limitations / failed items

1. **UI conversion is structural, not pixel-perfect**: Canvas/RectTransform
   trees are now real Control nodes with working click wiring (see §2b), but
   visual fidelity depends on the sprite textures (editor import) and the
   1920×1080 authoring assumption; pivot/rotation/scale of UI rects and
   CanvasScaler scaling behaviour are approximated. Menu labels are emitted as
   Godot Label nodes (UnityEngine.UI.Text, fileID 708705254); in-game prompts
   in Scene.unity are sprite-based and still arrive as TextureRects.
2. **Mesh instances (fixed)**: stage5 originally emitted
   `instance = ExtResource(...)` as a property line, which Godot silently
   ignores (node stays an empty Node3D → colliders visible, no map). Fixed to
   header form `[node ... instance=ExtResource("...")]`; verified the glb
   PackedScenes then instantiate with geometry.
3. **NavMesh**: Unity baked NavMesh has no Godot equivalent file — Granny and
   the noise targets need a NavigationRegion3D bake (manual step in editor).
4. **Menu scene**: 124 of its MonoBehaviour components reference a *missing
   script* GUID (asset-store menu package not included in this project), so the
   original menu is itself mostly decorative; real flows live in ClickPlayButton
   & friends (ported above).
5. **Godot editor/import cannot run here** — `.glb/.wav/.png` are not imported
   headlessly; scenes still instantiate (missing-import warnings only). A
   desktop Godot 4.7 open-and-import pass is required before first Play.
6. Sub-controllers referenced by PickUp (CheckExitDoor counters, checkTheCar
   flags, …) are called guarded — no-op until ported.
7. Ad/GDPR/analytics (AdManager, FetchAds, PlayVideoAds…) intentionally skipped
   (network services; see roadmap).
2. **NavMesh**: Unity baked NavMesh has no Godot equivalent file — Granny and
   the noise targets need a NavigationRegion3D bake (manual step in editor).
3. **Menu scene**: 124 of its MonoBehaviour components reference a *missing
   script* GUID (asset-store menu package not included in this project), so the
   original menu is itself mostly decorative; real flows live in ClickPlayButton
   & friends (ported above).
4. **Godot editor/import cannot run here** — `.glb/.wav/.png` are not imported
   headlessly; scenes still instantiate (missing-import warnings only). A
   desktop Godot 4.7 open-and-import pass is required before first Play.
5. Sub-controllers referenced by PickUp (CheckExitDoor counters, checkTheCar
   flags, …) are called guarded — no-op until ported.
6. Ad/GDPR/analytics (AdManager, FetchAds, PlayVideoAds…) intentionally skipped
   (network services; see roadmap).

## 5. Remaining work (ordered)

1. Desktop editor import pass of UI sprite textures / .glb / .wav; tune the
   1080p layout assumptions per scene if needed; restyle default-theme Buttons
   (they render with Godot's default look where the original used sprites).
2. `startNewDay` (1072 ln, day loop + AI enable + teddy/trap setup),
   `CheckExitDoor` (506 ln, win path), `checkTheCar`, `openDoors`,
   `prisonDoorOpenClose`, `BastuTrigger` — the GameController cluster (note:
   multiple Unity components share the GameController GO; Godot allows one
   script/node → plan child-node sub-controllers or a merged controller).
3. Ragdoll/prefab scripts for the AI spawns (GrannyRagdoll…), BearTrap,
   Crossbow/arrow shooting, sprayPepper, Spider, Crow.
4. Import pass on desktop Godot; bake NavigationRegion3D; verify visuals/sound.
5. Nightmare/difficulty extras (fog, nightmare music toggle) + save/load parity
   tests.

## 6. Re-running the conversion

```bash
cd "/sdcard/Download/Granny - Source/migration_work"   # staging (source project)
cp -r tools scripts /home/migration/granny-godot/      # tools/scripts live in workspace
cd tools
python3 stage1_assets.py   # textures+audio copy (idempotent)
python3 stage2_glb.py      # obj -> glb
python3 stage3_materials.py
python3 stage4_anims.py
python3 stage5_scenes.py   # .tscn/.tres + ported script attach
```

Validation (no editor): `env -u LD_PRELOAD ~/migration/godot-bin/godot --headless
res://converted/scenes/Scene.tscn` (expect only missing-import noise).
Parse-only: `godot --headless -s res://<file>.gd --check-only`.
