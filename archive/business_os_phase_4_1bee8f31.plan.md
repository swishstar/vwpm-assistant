---
name: Business OS Phase 4
overview: Rewrite ASSISTANT_MANUAL.md in Vanessa-friendly "Job Description" format, add an auto-update rule to keep it current, add a "What's New" morning greeting, and create the scripts/ folder as the foundation for future Puppeteer automation.
todos:
  - id: p4-manual-rewrite
    content: Rewrite ASSISTANT_MANUAL.md in plain-English Job Description format with I can... language, COMING SOON placeholders, and NEW badge format
    status: completed
  - id: p4-maintenance-rule
    content: Create .cursor/rules/manual-maintenance.mdc — auto-update enforcement and NEW badge logic
    status: completed
  - id: p4-whats-new
    content: Update orchestrator.mdc Morning Brief to include What's New greeting for NEW-badged skills
    status: completed
  - id: p4-scripts-folder
    content: Create scripts/README.md establishing the Puppeteer scripts convention
    status: completed
  - id: p4-changelog
    content: Update CHANGELOG.md with v0.4.0 entry
    status: completed
isProject: false
---

# Business OS — Phase 4 Implementation Plan

## Gap Analysis

**Already built:** All Phase 1–3 files intact. `ASSISTANT_MANUAL.md` exists but is written as a technical architecture document — not a plain-English reference Vanessa would actually use to remember what Rosy can do.

**Net-new from this conversation:**

- Rewrite `[ASSISTANT_MANUAL.md](ASSISTANT_MANUAL.md)` in "Job Description / I can..." format
- New rule: `.cursor/rules/manual-maintenance.mdc` — auto-update enforcement + NEW badge logic
- Enhancement to `[orchestrator.mdc](.cursor/rules/orchestrator.mdc)` Morning Brief — "What's New" greeting
- New folder: `scripts/` with a README for future Puppeteer scripts
- Placeholder skill entries in the manual for upcoming advanced tasks
- `CHANGELOG.md` updated to v0.4.0

---

## Changes to Make

### 1. Rewrite `ASSISTANT_MANUAL.md`

Transform the current technical document into a Vanessa-friendly capabilities directory. The current version has sections like "Context Architecture" and "System Overview" that are useful for the AI but not for Vanessa.

New structure:

```
# Rosy — Your Business Assistant
*Skills & Capabilities Reference*
*Last Updated: YYYY-MM-DD*

## How to Use This Guide
[2-line plain-English intro]

## What You Can Ask Rosy to Do

### WooCommerce & Your Website
- add-product — "I can create a new product draft..."
- [future: update-inventory]

### Email & Marketing
- draft-email — "I can write a campaign draft..."
- [future: sync-subscribers]

### Daily Operations
- daily-status — "I can give you a morning brief..."
- remember — "I can save a note for future reference..."
- compress-memory — "I can compress my notes into my memory..."

### Advanced (Automation / Scripts)
- fetch-canva-assets — COMING SOON
- file-sales-tax-draft — COMING SOON

## The Approval System
[Plain-English explanation of GREEN LIGHT and checklist gates]

## For Advanced Reference
[Collapsed/bottom section: technical folder map, MCP table, security notes — unchanged from current]
```

Key changes from the current manual:

- All skill descriptions rewritten as "I can..." statements in Rosy's voice
- "COMING SOON" entries added for `fetch-canva-assets` and `file-sales-tax-draft`
- Context Architecture table moved to the bottom under "For Advanced Reference"
- Workflow Rules rewritten in plain English, not numbered technical rules
- `*(NEW — added YYYY-MM-DD)*` badge format established for future additions

---

### 2. Create `.cursor/rules/manual-maintenance.mdc`

A new always-apply rule that instructs Rosy to keep the manual current.

Key behaviors:

- Whenever a new skill is added to `.cursor/skills/`, update the corresponding section in `ASSISTANT_MANUAL.md` with a plain-English "I can..." description
- Whenever a new MCP server is added to `.cursor/mcp.json`, add it to the MCP Integrations table
- Mark new entries with `*(NEW — added YYYY-MM-DD)*`
- When updating the manual, also update the "Last Updated" date at the top
- After 7 calendar days, remove the `*(NEW)*` badge from any entry (check during each Morning Brief)
- Descriptions must be written in plain English for a non-developer — no technical jargon

---

### 3. Update `orchestrator.mdc` — "What's New" Greeting

Add a "What's New" check to the existing `## Morning Brief` section:

```markdown
4. Check ASSISTANT_MANUAL.md for any entries marked *(NEW)*. If found, include in
   the greeting: "Hi Vanessa! Rosy has a new skill: [skill name]. [One-line description
   of what it does]. Want to try it?"
```

This is a small additive change to the existing Morning Brief block — no other sections are affected.

---

### 4. Create `scripts/` folder

Create `scripts/README.md` establishing the convention:

- This folder holds Puppeteer and automation scripts executed by MCP or Rosy on command
- Each script gets its own subfolder: `scripts/fetch-canva/`, `scripts/sales-tax/`
- Scripts always stop before the final "Submit" or irreversible action — Vanessa does the last click
- A corresponding skill in `.cursor/skills/` documents how to trigger each script

No actual Puppeteer scripts are written yet — only the folder and README are created as the foundation.

---

### 5. Update `CHANGELOG.md`

Add a `[0.4.0] — 2026-03-23` entry listing all Phase 4 changes.

---

## Summary of Files Touched

- `[ASSISTANT_MANUAL.md](ASSISTANT_MANUAL.md)` — REWRITE (Vanessa-friendly format, COMING SOON placeholders)
- `[.cursor/rules/manual-maintenance.mdc](.cursor/rules/manual-maintenance.mdc)` — NEW
- `[.cursor/rules/orchestrator.mdc](.cursor/rules/orchestrator.mdc)` — EDIT (add "What's New" check to Morning Brief)
- `[scripts/README.md](scripts/README.md)` — NEW (scripts/ folder foundation)
- `[CHANGELOG.md](CHANGELOG.md)` — EDIT (v0.4.0 entry)

