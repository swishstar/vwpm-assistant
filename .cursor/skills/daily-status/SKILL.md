---
name: daily-status
description: Gives Vanessa a morning brief by reading session-log.md, the inbox, and the checklists to summarize what is pending and what has been done. Use when Vanessa types "Status", "Daily brief", "Good morning", "What's pending", or "What's new".
---

# Daily Status — Morning Brief Skill

## Purpose
Give Vanessa a clear, friendly summary of everything that is waiting for her attention and everything Rosy has done since the last check-in.

## Workflow

### Step 1 — Read the Session Log
- Read `session-log.md`.
- Identify all entries from the current day, or — if no entries exist today — the most recent 5 entries regardless of date.
- Note any actions that say "DRAFT SAVED" (product or email drafts awaiting review).

### Step 2 — Scan the Inbox
- List all files currently in `inbox/`.
- For each file, identify its type from the filename (product draft, email draft, image, etc.).
- If `inbox/` is empty, note that nothing is waiting.

### Step 3 — Check Checklists
- Read `checklists/product-launch.md` and `checklists/email-sequence.md`.
- If any items appear to be in progress (based on session log context), note which checklist and what stage.

### Step 4 — Compose and Deliver the Brief

Use this format exactly:

```
Good morning, Vanessa! Here's your Redefine status update from Rosy:

**Pending your review (inbox/):**
- [filename] — [type, e.g. "product draft" or "email draft"]
  (or: Nothing in the inbox right now.)

**Recent actions:**
- [last 3-5 session-log.md entries, formatted as plain bullets]
  (or: No recent actions logged.)

**Waiting for your GREEN LIGHT:**
- [any DRAFT SAVED entries that have not yet been followed by an MCP CALL]
  (or: None — all clear.)

What would you like to work on today?
```

### Step 5 — Log the Status Check
Append to `session-log.md`:
```
| YYYY-MM-DD HH:MM | STATUS CHECK | Daily brief delivered to Vanessa |
```

## Notes
- Keep the brief scannable — bullets only, no paragraphs.
- If there are many inbox files, group them by type rather than listing every single filename.
- If Vanessa adds context ("I dropped some photos in the inbox"), incorporate that into the brief before delivering it.
- This skill is read-only except for the session log entry — it does not modify any files.
