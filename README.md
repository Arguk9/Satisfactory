# Satisfactory Save Sync 🏭

Sync your Satisfactory saves between players using Git. Two scripts handle everything — no Git knowledge needed.

---

## How it works

| When | Run |
|------|-----|
| About to play | `play.bat` — pulls latest saves |
| Done playing | `done.bat` — commits & pushes your saves |

---

## One-time Setup (do this together, or one person sets up then shares the repo link)

### Step 1 — Find your Satisfactory save folder

Your saves live here (replace `<SteamID>` with your actual Steam ID number):

```
%LOCALAPPDATA%\FactoryGame\Saved\SaveGames\<SteamID>\
```

To find your Steam ID: open Steam → click your profile name → "Account details" → it's the number under your name.

### Step 2 — Create a remote Git repository

Create a **private** repo on [GitHub](https://github.com/new) or [GitLab](https://gitlab.com/projects/new).  
Name it something like `satisfactory-saves`.

> ⚠️ Make it **private** — your saves are personal!

### Step 3 — Initialize the repo in your save folder

Open a terminal (right-click in your save folder → "Open in Terminal") and run:

```bash
git init
git remote add origin https://github.com/YOUR_USERNAME/satisfactory-saves.git
git checkout -b main
```

### Step 4 — Copy the scripts into your save folder

Copy these files from this repo into your Satisfactory save folder:
- `play.bat`
- `done.bat`
- `.gitattributes`

Your folder should look like:
```
SaveGames/
  <SteamID>/
    *.sav           ← your save files
    play.bat        ← run before playing
    done.bat        ← run after playing
    .gitattributes
```

### Step 5 — First push

```bash
git add -A
git commit -m "Initial save sync setup"
git push -u origin main
```

### Step 6 — Friend setup

Your friend clones the repo into **their** save folder location:

```bash
# Navigate to: %LOCALAPPDATA%\FactoryGame\Saved\SaveGames\
git clone https://github.com/YOUR_USERNAME/satisfactory-saves.git <TheirSteamID>
```

Then grant them write access on GitHub: **Settings → Collaborators → Add people**.

---

## Daily Usage

**Before you play:**
```
Double-click play.bat
```
This pulls the latest saves so you have the most recent progress.

**When you're done:**
```
Double-click done.bat
```
This commits your saves with a timestamp and pushes them.

---

## Optional: Auto-launch the game

In `play.bat`, uncomment this line to launch Satisfactory automatically after pulling:

```bat
start steam://rungameid/526870
```

---

## Tips

- **Never play at the same time** — Git can't merge binary save files. Coordinate with your friend!
- If you forget to pull and there's a conflict, the person who pushed last "wins" — just copy the `.sav` file you want to keep, reset with `git checkout -- .`, then paste it back and run `done.bat`.
- Saves are typically small (1–10 MB), so pushes and pulls are fast.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `play.bat` fails on pull | Check internet connection; make sure you have access to the repo |
| `done.bat` says "nothing to commit" | Your saves haven't changed since last push |
| Merge conflict on `.sav` file | Saves are binary — see "Tips" above for manual resolution |
| Authentication prompt | Set up an SSH key or a GitHub personal access token |
