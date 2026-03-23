---
name: remember
description: Real-time lesson capture for the Business OS. Summarizes what was just done, corrected, or decided into a structured training document saved to training/. Use when the Director says "remember this", "note that", "don't do that again", or after any significant correction, decision, or preference is stated.
---

# Remember — Lesson Capture Skill

## Purpose
Capture a lesson, correction, or preference in real-time and save it as a structured training document in `training/`. These documents are later processed by the `compress-memory` skill into `KNOWLEDGE_BASE.md`.

## Workflow

### Step 1 — Identify What to Capture
Determine the type of lesson from context:
- **Correction** — Director said something was wrong; note what was wrong and what is correct.
- **Preference** — Director stated a style, tone, or process preference.
- **Decision** — A business decision was made (pricing, naming, vendor choice, etc.).
- **Pattern** — A repeating workflow or shortcut was identified.

### Step 2 — Draft the Training Document

Use this template:

```markdown
# Training Note — [Short Title]

**Date:** YYYY-MM-DD
**Type:** Correction | Preference | Decision | Pattern
**Department:** Commerce | Marketing | Operations | General

## What Happened
[1-2 sentences describing the context or situation]

## Lesson
[The specific thing to remember. Be concrete and actionable.]

## Do This
[What the correct behavior is going forward]

## Don't Do This
[What to avoid — only include if there was an explicit correction]
```

### Step 3 — Save the File
- Filename format: `training/YYYY-MM-DD-[slug].md`
  - Example: `training/2026-03-23-email-subject-line-style.md`
- **Present the draft to the Director before saving. Wait for GREEN LIGHT.**

### Step 4 — Confirm
After saving, respond: "Noted. Saved to `training/[filename]`. Run **compress memory** to add it to the Knowledge Base."

## Quick Capture (for simple one-liners)
If the Director says something like "Remember: always use sentence case for email subjects", you may use a condensed template:

```markdown
# Training Note — [Topic]

**Date:** YYYY-MM-DD
**Type:** Preference

## Lesson
[The preference, stated plainly]
```

## Notes
- One lesson per file — do not bundle multiple unrelated lessons.
- Keep language plain and direct; these notes are read by the AI, not humans.
- If unsure of the lesson type, default to "Preference".
