# G2R Mobile Build Tools

CI that ports a **Unity PC fangame** to **Android APK** — entirely on GitHub's servers.
Your phone only uploads a zip and downloads an APK. No PC, no Unity install, nothing heavy.

> Fan game made with permission under DVloper's fangame policy. Granny is created by
> **DVloper** — this project is unofficial and non-commercial. Full credits in [CREDITS.md](CREDITS.md).

---

## How it works (4 steps)

### 1. Get the game zip to CI — pick ONE option

**Option A — paste a download link (no git needed, best on a phone):**
Actions tab → **"1 - Port game (AssetRipper)"** → Run workflow → paste a
**direct-download link** to the zip in the `zip_url` box → Run.
The link must point straight at the file (it downloads to `game.zip`), e.g. a GitHub
release asset, Dropbox `?dl=1`, file.io, catbox.moe, etc. Google Drive/Mega web pages
do NOT work — they need direct-link formats.

**Option B — push the zip into `games/`:**
Keep it zipped. Files > 25 MB go through git/LFS (already configured), not the web UI:
```bash
git lfs install
cp Granny_Forsaken.zip games/
git add games/Granny_Forsaken.zip
git commit -m "Add game zip"
git push
```
The **"1 - Port game (AssetRipper)"** workflow starts automatically.

### 2. Wait for the port (~10–30 min)
AssetRipper rips the PC build into a real Unity project under `ported/<GameName>/`
(assets, scenes, and — if the game uses Mono — all of its C# scripts) and commits it here.

### 3. One-time: activate a Unity license
1. Run workflow **"0 - Setup Unity license"** → download the `Unity_*.alf` artifact.
2. Go to https://license.unity3d.com/manual, upload the `.alf`, choose **Personal**, download the `.ulf`.
3. Repo → Settings → Secrets and variables → Actions → add three secrets:
   - `UNITY_LICENSE` = full text of the `.ulf` file
   - `UNITY_EMAIL` = your Unity account email
   - `UNITY_PASSWORD` = your Unity account password

### 4. Build the APK
Run workflow **"2 - Build Android APK"** (leave "performance mode" ON for weak phones).
Download the `android-apk` artifact, sideload it, done.

---

## The one thing that can block everything: Mono vs IL2CPP

Open the game zip and look inside `<Game>_Data/`:

| You see | Meaning | Result |
|---|---|---|
| `Managed/Assembly-CSharp.dll` | **Mono** backend | Full port possible — scripts are recovered |
| `GameAssembly.dll` | **IL2CPP** backend | Assets/scenes port, but game logic is compiled to machine code and can't be rebuilt — the APK won't be playable |

Workflow 1 detects this automatically and warns you. Most small indie/fangame builds are Mono.

## If the APK lags (like the dev's old Android attempt)

- Keep **performance mode** on (quality level 0, no MSAA, soft shadows off).
- The ported C# scripts land in `ported/<GameName>/Assets/Scripts/` — they can be edited
  here and rebuilt with workflow 2. Touch controls need a real edit (e.g. adding a virtual
  joystick) — that's normal, the PC build doesn't magically know about touchscreens.
- Unity version is read from the ported project automatically; GameCI installs the right editor.

## If you only have an IL2CPP build

Nothing to decompile — your options are running the PC exe on the phone with
**Winlator / GameHub** instead, or rebuilding the game logic from the ripped scenes.

## Repo map

```
games/     <- paste game zips here (LFS)
ported/    <- ripped Unity projects (committed by workflow 1)
.github/
  workflows/
    0-license.yml      one-time Unity activation file
    1-port.yml         AssetRipper: PC build -> Unity project
    2-build-apk.yml    GameCI: Unity project -> signed APK artifact
```
