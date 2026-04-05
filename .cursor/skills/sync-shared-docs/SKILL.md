---
name: sync-shared-docs
description: Commits and pushes all non-gitignored local changes to the main branch on GitHub so collaborators can pull them. Use when Vanessa says "sync shared docs", "push my updates", "push my updates to GitHub", "publish my changes", or "sync to GitHub".
---

# Sync Shared Docs — Push Non-Ignored Work to `main`

## Purpose

Publish Vanessa's local changes to **GitHub on `main`** for every path that **is not** excluded by `.gitignore` (for example `KNOWLEDGE_BASE.md`, `II-TALKS.md`, `checklists/`, and other tracked or new documentation). Ignored paths such as `inbox/`, `session-log.md`, `training/`, `archive/`, and credentials are **never** staged.

This is the inverse of **Update assistant** (pull from `main`). After **compress-memory**, run this skill if `KNOWLEDGE_BASE.md` should be on GitHub for the developer to pull.

## Workflow

### Step 1 — Verify remote

Run: `git remote get-url origin` (or `git remote -v`)

If no `origin` is configured, stop and say: "No remote repository is set up yet. See SETUP_GUIDE.md."

### Step 2 — Verify branch

Run: `git branch --show-current`

If the result is not `main`, say you will switch to `main` first, then wait for **GREEN LIGHT**, then run: `git checkout main`

### Step 3 — Pull latest (first GREEN LIGHT)

Present:

> I will run `git pull --rebase origin main` so we do not push on top of out-of-date work. Your gitignored folders (inbox, session log, training, archive) are not affected. Type **GREEN LIGHT** to proceed.

Wait for **GREEN LIGHT**, then run: `git pull --rebase origin main`

**If the pull succeeds:** continue to Step 4.

**If the pull fails (conflict or error):** do **not** show raw Git errors. Say:

> I ran into a small sync issue — local files may have diverged from GitHub.
>
> Would you like me to:
> **A)** Overwrite my local **tracked** copy with the latest from GitHub *(recommended if you have not edited repo files you need to keep)*
> **B)** Skip and leave things as they are for now
>
> Say **A** or **B**.

- If **A**: run `git fetch origin && git reset --hard origin/main`, then continue to Step 4. Note: **gitignored files are untouched** by `reset --hard`.
- If **B**: stop. Append to `session-log.md`: `| YYYY-MM-DD HH:MM | GIT SYNC | Pull skipped — user chose to skip |`

### Step 4 — Preview changes

Run:

- `git status --short`
- `git diff --stat` (if there are unstaged/staged changes)

Summarize what would be included. Remind Vanessa: **`git add -A` respects `.gitignore`** — only non-ignored paths are staged.

If there is **nothing to commit** (clean working tree for tracked/untracked non-ignored files), report: "Nothing to push — your shared copy is already in sync." and stop.

### Step 5 — Second GREEN LIGHT (commit and push)

Show a bulleted list of paths/files that will be committed. State:

> This will **commit and push** to **main** on GitHub. Secrets and ignored folders stay local. Type **GREEN LIGHT** to commit and push.

If Vanessa provided a custom one-line commit subject in the same conversation, use it (sanitized). Otherwise use: `Vanessa sync — YYYY-MM-DD`

Wait for **GREEN LIGHT**.

### Step 6 — Execute

Run in order:

```bash
git add -A
git commit -m "<message>"
git push origin main
```

If `git commit` reports "nothing to commit", skip push and report that.

### Step 7 — Log

Append to `session-log.md`:

```
| YYYY-MM-DD HH:MM | GIT SYNC | Pushed shared docs to main — [brief summary] |
```

## Notes

- Never run this on the `context-backup` branch — always end on `main`.
- Prefer **Update assistant** before a long work session if the developer just pushed changes.
- Weekly **context backup** is separate: it saves **gitignored** paths to the `context-backup` branch. Use this skill for **shared** repo content on `main`.
