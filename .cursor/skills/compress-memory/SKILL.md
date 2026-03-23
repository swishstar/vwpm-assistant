---
name: compress-memory
description: Maintenance skill for the Business OS. Reads all documents in the training/ directory, extracts lessons learned and business preferences, merges them into KNOWLEDGE_BASE.md, then moves the raw training files to archive/. Use when the Director says "run maintenance", "compress memory", or on a weekly basis to keep the context window lean.
---

# Compress Memory — Maintenance Skill

## Purpose
Extract compressed knowledge from raw training documents and store it in `KNOWLEDGE_BASE.md`, then archive the source files to keep the active context window lean.

## Workflow

### Step 1 — Inventory
- List all files currently in `training/`.
- If `training/` is empty, report: "Nothing to compress. Training folder is empty." and stop.

### Step 2 — Read & Extract
For each file in `training/`:
1. Read the document fully.
2. Identify extractable knowledge:
   - Business preferences (tone, pricing rules, design standards, etc.)
   - Corrections the Director made (what was wrong, what is right)
   - Repeating patterns or workflows
   - Named entities (products, vendors, platforms, personas)

### Step 3 — Update KNOWLEDGE_BASE.md
1. Read `KNOWLEDGE_BASE.md`.
2. For each extracted lesson:
   - Find the appropriate section (Brand Voice, Lessons Learned, etc.).
   - Merge the new information — do not duplicate existing entries.
   - Add a row to the **Lessons Learned** table: `| Date | Lesson summary | Source filename |`
3. Update the "Last compressed" timestamp at the bottom of the file.
4. **Present the proposed changes to the Director and wait for GREEN LIGHT before writing.**

### Step 4 — Archive Raw Files
After GREEN LIGHT:
1. Move each processed `training/` file to `archive/` using the Shell tool.
2. Confirm to the Director: "Compressed [N] training documents. `KNOWLEDGE_BASE.md` updated. Raw files moved to archive."

## Output Format for Step 3 Preview

Present the diff as a markdown summary before writing:

```
## Proposed KNOWLEDGE_BASE.md Updates

**Section: [Section Name]**
- NEW: [concise lesson]
- NEW: [concise lesson]

**Lessons Learned table additions:**
| 2026-03-23 | [Lesson] | training/example.md |
```

## Notes
- Never delete training files — always move to `archive/`, never `rm`.
- If a lesson contradicts an existing entry, flag it for the Director's review rather than silently overwriting.
- Prefer concise, scannable bullets over prose in `KNOWLEDGE_BASE.md`.
