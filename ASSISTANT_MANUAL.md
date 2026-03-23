# Business OS — Assistant Manual

## System Overview

This is a modular, agentic Business Operating System built on the OpenClaw architecture. The AI acts as a **COO/Orchestrator**, routing tasks to the appropriate department agent and managing context efficiently.

---

## Current Capabilities

### Commerce-Agent
- WooCommerce product management (create, update, delete listings)
- WordPress page/post creation and editing
- Order tracking and customer record lookup
- Plugin and theme configuration guidance

### Marketing-Agent
- Mailchimp campaign creation and list management
- Social media content drafting (captions, hashtags, scheduling briefs)
- Canva asset briefs and design direction
- Blog and email copywriting aligned to brand voice

### Operations-Agent
- Scheduling and calendar management
- Tax preparation assistance and document checklists
- SOP drafting and process documentation
- Vendor communication templates

---

## System Skills

| Skill | Trigger | Purpose |
|-------|---------|---------|
| `compress-memory` | "Run maintenance" / weekly | Extracts lessons from `training/` → `KNOWLEDGE_BASE.md`, archives raw data |
| `remember` | "Remember this" / after corrections | Captures new lessons as training documents for future compression |

---

## Context Architecture

| Folder | Purpose | Indexed? |
|--------|---------|----------|
| `Commerce-Agent/` | WooCommerce & WordPress assets | On demand (`@Commerce-Agent`) |
| `Marketing-Agent/` | Campaigns, content, social | On demand (`@Marketing-Agent`) |
| `Operations-Agent/` | Scheduling, taxes, SOPs | On demand (`@Operations-Agent`) |
| `inbox/` | New incoming assets/flyers | On demand |
| `training/` | Raw lessons awaiting compression | On demand |
| `KNOWLEDGE_BASE.md` | Compressed styles & preferences | Always available |
| `archive/` | Historical data | Never (`.cursorignore`) |

---

## Workflow Rules

1. **Review Gate** — All drafts are presented in the editor. No MCP or Terminal actions execute without an explicit "GREEN LIGHT" from the Director.
2. **Context Efficiency** — Sub-agent folders are not loaded unless explicitly triggered (`@folder`) or the task clearly maps to a department.
3. **Morning Brief** — On the first interaction of the day, the Orchestrator runs `git pull --rebase origin main` and summarizes the latest `CHANGELOG.md` entries.

---

## MCP Integrations

| Service | Status | Agent |
|---------|--------|-------|
| WordPress / WooCommerce | Pending credentials | Commerce-Agent |
| Mailchimp | Pending credentials | Marketing-Agent |
| Social Media | Pending setup | Marketing-Agent |
| Canva | Pending setup | Marketing-Agent |

---

*Last updated: 2026-03-23*
