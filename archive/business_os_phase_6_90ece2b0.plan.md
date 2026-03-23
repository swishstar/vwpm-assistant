---
name: Business OS Phase 6
overview: "Four targeted additions: create HELLO_VANESSA.md for first-run onboarding, add npm install logic to the update skill and Morning Brief, and rewrite conflict handling in both to use friendly non-technical language."
todos:
  - id: p6-hello
    content: Create HELLO_VANESSA.md first-run onboarding file
    status: completed
  - id: p6-update-skill
    content: "Update update-assistant/SKILL.md: add npm install step and rewrite conflict handling with friendly language and git reset --hard option"
    status: completed
  - id: p6-morning-brief
    content: "Update orchestrator.mdc Morning Brief: add npm install check and conflict handling guidance"
    status: completed
  - id: p6-changelog
    content: Update CHANGELOG.md with v0.6.0 entry
    status: completed
isProject: false
---

# Business OS — Phase 6 Implementation Plan

## Gap Analysis

**Already done — no changes needed:**

- Morning Brief in `[orchestrator.mdc](.cursor/rules/orchestrator.mdc)` runs `git pull --rebase`, reads CHANGELOG, highlights new skills
- `[update-assistant/SKILL.md](.cursor/skills/update-assistant/SKILL.md)` exists with full pull, change summary, and logging

**Net-new from Phase 6:**


| Item                                             | Status                                              |
| ------------------------------------------------ | --------------------------------------------------- |
| `HELLO_VANESSA.md` first-run file                | Missing                                             |
| `npm install` step in `update-assistant`         | Missing                                             |
| `npm install` step in Morning Brief              | Missing                                             |
| Friendly conflict handling in `update-assistant` | Partial — raw error shown, no friendly escape hatch |
| Conflict handling guidance in Morning Brief      | Missing                                             |
| `CHANGELOG.md` v0.6.0                            | Missing                                             |


---

## Changes to Make

### 1. Create `HELLO_VANESSA.md`

A distinct first-contact file, different from `01_START_HERE.md` (which is the ongoing reference dashboard). This one is designed to be open in the editor when Vanessa first clones the repo and launches Cursor.

Content:

- Warm, simple heading: `# Hi, I'm Rosy — Ready When You Are`
- One paragraph explaining what just happened (her assistant was just set up)
- Single clear call to action: "Type **Hi** in the chat to introduce yourself and sync my latest skills"
- Note: after the first sync, she can open `01_START_HERE.md` as her daily dashboard
- Note about `setup.sh` if she hasn't run it yet

This file is intentionally short — it should fit on one screen without scrolling.

---

### 2. Update `update-assistant/SKILL.md` — add `npm install` + rewrite conflict handling

**Add after Step 3 (after successful pull):**

New Step 3b — Check for dependency changes:

```
Run: git diff HEAD@{1} HEAD -- package.json
If package.json changed, present: "New script dependencies were added. Running npm install..."
Run: npm install
Report: "Dependencies updated."
```

**Rewrite conflict handling in Step 3 (currently shows raw git error):**

Replace the current conflict message with:

```
"I'm having a small trouble syncing my notes with the latest version.
This usually means one of my local files was edited at the same time
as a new update from [developer].

Would you like me to:
A) Overwrite my local copy with the latest version (recommended)
B) Skip the update and keep things as they are for now

Just say 'A' or 'B'."

If A: run git fetch origin && git reset --hard origin/main, then npm install
If B: abort and log "Update skipped — conflict kept"
```

---

### 3. Update `orchestrator.mdc` Morning Brief — `npm install` check + conflict handling

**Add to the existing `## Morning Brief` section:**

After step 1 (the git pull), add:

```
1b. If the pull succeeds and package.json changed (check with git diff), run npm install
    and note it in the greeting: "I also installed some new script dependencies."
1c. If the pull fails (conflict), do NOT show the raw Git error. Instead say:
    "I ran into a small sync issue — it looks like some notes were changed on both
    ends. Would you like me to overwrite my local copy with the latest from the developer,
    or skip the update for now?"
    Offer options A (git reset --hard origin/main) or B (abort). Wait for Vanessa's choice.
```

---

### 4. Update `CHANGELOG.md` — v0.6.0

Add entry listing all Phase 6 additions.

---

## Summary of Files Touched

- `[HELLO_VANESSA.md](HELLO_VANESSA.md)` — NEW (first-run onboarding file)
- `[.cursor/skills/update-assistant/SKILL.md](.cursor/skills/update-assistant/SKILL.md)` — EDIT (add npm install step, rewrite conflict handling)
- `[.cursor/rules/orchestrator.mdc](.cursor/rules/orchestrator.mdc)` — EDIT (add npm install check and conflict handling to Morning Brief)
- `[CHANGELOG.md](CHANGELOG.md)` — EDIT (v0.6.0 entry)

