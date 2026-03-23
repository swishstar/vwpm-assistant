---
name: update-assistant
description: Pulls the latest rules, skills, and scripts from the main branch of the Git repository. Use when Vanessa says "Update assistant", "Update Rosy", "Pull updates", "Sync Rosy", or "Get the latest".
---

# Update Assistant — Sync from Main Branch

## Purpose
Pull the latest logic (rules, skills, scripts, documentation) published by the developer from the `main` branch. This is how new capabilities Rosy gets get delivered to Vanessa's machine.

## Workflow

### Step 1 — Present the Command
Show Vanessa what will run:
```
git pull --rebase origin main
```
State: "This will pull the latest updates from the developer. Your personal data (inbox, session log, training notes) will not be affected. Type GREEN LIGHT to proceed."

### Step 2 — Wait for GREEN LIGHT
Do not proceed until Vanessa approves.

### Step 3 — Run the Pull
Execute: `git pull --rebase origin main`

If the pull fails due to a conflict, report the error clearly:
- "There was a conflict on [filename]. This usually means a local file was modified that the developer also changed. Please tell me which version to keep and I'll resolve it."

### Step 4 — Report What Changed
After a successful pull, run: `git log --oneline HEAD@{1}..HEAD`

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

### Step 5 — Check for New Skills in the Manual
If `ASSISTANT_MANUAL.md` was updated, read it and highlight any entries marked `*(NEW)*`.

### Step 6 — Log the Update
Append to `session-log.md`:
```
| YYYY-MM-DD HH:MM | ASSISTANT UPDATED | Pulled latest from main — [brief summary of changes] |
```

## Notes
- If there are no changes ("Already up to date"), report: "Rosy is already up to date. No changes were pulled."
- Never run this on the `context-backup` branch — always verify you are on `main` first with `git branch --show-current`
- If the repo has no remote configured yet, report: "No remote repository is set up yet. See SETUP_GUIDE.md for instructions."
