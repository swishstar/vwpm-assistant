---
name: Business OS Phase 3
overview: "Give the assistant an identity (name: Rosy), create a welcome dashboard file, add a \"Status\" daily-brief skill, and document the WordPress Application Password security recommendation."
todos:
  - id: p3-identity
    content: "Add Identity section to orchestrator.mdc (name: Rosy, address as Vanessa, Florida training context)"
    status: completed
  - id: p3-dashboard
    content: Create 01_START_HERE.md welcome dashboard file
    status: completed
  - id: p3-status-skill
    content: Create .cursor/skills/daily-status/SKILL.md for the Status command
    status: completed
  - id: p3-security
    content: Add Application Password security note to ASSISTANT_MANUAL.md
    status: completed
  - id: p3-changelog
    content: Update CHANGELOG.md with v0.3.0 entry
    status: completed
isProject: false
---

# Business OS — Phase 3 Implementation Plan

## What Is New vs. Already Built

**Already exists — no changes needed:**

- All Phase 1 and Phase 2 files are in place and confirmed

**Net-new from this conversation:**

- Assistant identity ("Rosy") added to `[.cursor/rules/orchestrator.mdc](.cursor/rules/orchestrator.mdc)`
- New file: `01_START_HERE.md` — welcome dashboard, first thing Vanessa sees
- New skill: `.cursor/skills/daily-status/SKILL.md` — "Status" command trigger
- Security note added to `[ASSISTANT_MANUAL.md](ASSISTANT_MANUAL.md)`
- `CHANGELOG.md` updated to v0.3.0

**Not implemented (requires manual user action):**

- Custom Cursor.app dock icon — must be done by dragging an `.icns` file onto the app's Get Info window in macOS Finder; cannot be scripted

---

## Changes to Make

### 1. Update `.cursor/rules/orchestrator.mdc`

Add an **Identity** section at the top of the rule body (after the frontmatter, before "Role"):

```markdown
## Identity
- Your name is **Rosy**.
- You are a specialized business operations assistant for Vanessa.
- Address Vanessa as **"Vanessa"** in all responses (not "Director" or "user").
- You are focused on the Florida training event series run by Redefine.
- When introducing yourself or starting a new session, use: "Hi Vanessa, I'm Rosy —
  your Redefine business assistant. How can I help you today?"
```

The existing `## Tone` section's "Address the user as Director" line is updated to match.

---

### 2. Create `01_START_HERE.md`

A welcome file in the workspace root that serves as Vanessa's dashboard when she opens the folder. Key sections:

- Large heading: `# Rosy — Redefine Business Dashboard`
- Quick-start commands cheat sheet (what to type to trigger each skill)
- Links to the key files she'll use daily: `session-log.md`, `checklists/`, `inbox/`
- A reminder of the GREEN LIGHT approval system
- MCP status section (placeholder until credentials are live)

---

### 3. Create `.cursor/skills/daily-status/SKILL.md`

Triggered when Vanessa types "Status", "Daily brief", "Good morning", or "What's pending".

Workflow:

1. Read `session-log.md` — summarize actions taken since the last status check (or last 7 days)
2. List all files currently in `inbox/` that are awaiting review
3. Check `checklists/product-launch.md` and `checklists/email-sequence.md` — note any items that appear to be in-flight
4. Output a formatted morning brief:

```
Good morning, Vanessa! Here's your Redefine status update:

**Pending your review (inbox/):**
- [file list or "Nothing in inbox"]

**Recent actions (session-log.md):**
- [last 3-5 log entries]

**Waiting for GREEN LIGHT:**
- [any drafts awaiting approval, or "None"]

What would you like to work on today?
```

---

### 4. Add Security Note to `ASSISTANT_MANUAL.md`

Add a "Security" section under the MCP Integrations table with the Application Password recommendation:

- Do not use the main WordPress admin password in `.cursor/mcp.json`
- Create a dedicated Application Password under **WordPress Admin → Users → Profile → Application Passwords**
- Name it `Cursor-Rosy` for easy identification and revocation
- Same principle for Mailchimp: use a scoped API key, not the master account password

---

### 5. Update `CHANGELOG.md`

Add a `[0.3.0] — 2026-03-23` entry listing all Phase 3 additions.

---

## Summary of Files Touched

- `[01_START_HERE.md](01_START_HERE.md)` — NEW
- `[.cursor/skills/daily-status/SKILL.md](.cursor/skills/daily-status/SKILL.md)` — NEW
- `[.cursor/rules/orchestrator.mdc](.cursor/rules/orchestrator.mdc)` — EDIT (add Identity section, update Tone)
- `[ASSISTANT_MANUAL.md](ASSISTANT_MANUAL.md)` — EDIT (add Security section)
- `[CHANGELOG.md](CHANGELOG.md)` — EDIT (add v0.3.0 entry)

