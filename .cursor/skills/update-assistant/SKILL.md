---
name: update-assistant
description: Pulls the latest rules, skills, and scripts from the main branch of the Git repository. Use when Vanessa says "Update assistant", "Update Rosy", "Pull updates", "Sync Rosy", "Update", "Sync", or "Check for updates".
---

# Update Assistant — Sync from Main Branch

## Purpose
Pull the latest logic (rules, skills, scripts, documentation) published by the developer from the `main` branch. This is how new capabilities are delivered to Vanessa's machine.

## Workflow

### Step 1 — Verify branch
Run: `git branch --show-current`

If the result is not `main`, switch first: `git checkout main`

### Step 2 — Present the Command
Show Vanessa what will run:
```
git pull --rebase origin main
```
State: "This will pull the latest updates from the developer. Your personal data (inbox, session log, training notes) will not be affected. Type GREEN LIGHT to proceed."

### Step 3 — Wait for GREEN LIGHT

### Step 4 — Run the Pull
Execute: `git pull --rebase origin main`

**If the pull succeeds:** continue to Step 5.

**If the pull fails (conflict or error):** do NOT show the raw Git error output. Instead say:

> "I'm having a small trouble syncing my notes with the latest version. This usually happens when one of my local files was updated at the same time as a new version from the developer.
>
> Would you like me to:
> **A)** Overwrite my local copy with the latest version from the developer *(recommended — your inbox, session log, and checklists are safe)*
> **B)** Skip the update and keep things as they are for now
>
> Just say **A** or **B**."

- If **A**: run `git fetch origin && git reset --hard origin/main`, then continue to Step 4b for npm install check. Log: `Update skipped — conflict resolved by overwrite`
- If **B**: abort and append to `session-log.md`: `| YYYY-MM-DD HH:MM | UPDATE SKIPPED | Conflict kept — user chose to skip |`

### Step 4b — Check for Dependency Changes
Run: `git diff HEAD@{1} HEAD -- package.json`

If `package.json` changed (output is non-empty):
- State: "New script dependencies were added. Installing now..."
- Run: `npm install`
- Report: "Dependencies updated."

If `package.json` did not change, skip silently.

### Step 5 — Report What Changed
Run: `git log --oneline HEAD@{1}..HEAD`

Summarize the changes in plain English:
- List any new skill files added to `.cursor/skills/`
- List any rule files added or updated in `.cursor/rules/`
- List any new scripts added to `scripts/`
- List any documentation updates

Example output:
```
Rosy has been updated! Here's what's new:

- New skill: fetch-canva-assets — I can now pull your Canva flyers directly into the inbox.
- Updated: products.mdc — The product checklist has a new SEO field.

Want to try the new Canva skill now?
```

If there are no changes, report: "Rosy is already up to date. No changes were pulled."

### Step 6 — Check for New Skills in the Manual
If `ASSISTANT_MANUAL.md` was updated, read it and highlight any entries marked `*(NEW)*`.

### Step 7 — Log the Update
Append to `session-log.md`:
```
| YYYY-MM-DD HH:MM | ASSISTANT UPDATED | Pulled latest from main — [brief summary of changes] |
```

## Notes
- Never run this on the `context-backup` branch — always verify and return to `main` first
- If the repo has no remote configured yet, report: "No remote repository is set up yet. See SETUP_GUIDE.md for instructions." and stop
- The `git reset --hard origin/main` option only overwrites files tracked by git — Vanessa's `inbox/`, `session-log.md`, `checklists/`, and `training/` are gitignored and will not be touched
