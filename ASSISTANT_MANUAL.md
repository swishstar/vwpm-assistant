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
| `add-product` | "Add product" / "New product" / "Create listing" | Archive-first WooCommerce product creation with inbox draft and GREEN LIGHT gate |
| `draft-email` | "Draft email" / "New campaign" / "Email sequence" | Archive-first Mailchimp campaign drafting with inbox draft and GREEN LIGHT gate |

---

## Context Architecture

| Folder | Purpose | Indexed? |
|--------|---------|----------|
| `Commerce-Agent/` | WooCommerce & WordPress assets | On demand (`@Commerce-Agent`) |
| `Commerce-Agent/past-products/` | Reference library for historical products | On demand (by `add-product` skill) |
| `Marketing-Agent/` | Campaigns, content, social | On demand (`@Marketing-Agent`) |
| `Marketing-Agent/past-emails/` | Reference library for past campaigns | On demand (by `draft-email` skill) |
| `Operations-Agent/` | Scheduling, taxes, SOPs | On demand (`@Operations-Agent`) |
| `checklists/` | Manual launch/send checklists | On demand (by `checklist-bot` rule) |
| `inbox/` | New incoming assets and review drafts | On demand |
| `training/` | Raw lessons awaiting compression | On demand |
| `session-log.md` | Running paper trail of all actions | Always available |
| `KNOWLEDGE_BASE.md` | Compressed styles & preferences | Always available |
| `archive/` | Cold storage — historical data | Never (`.cursorignore`) |

---

## Workflow Rules

1. **Review Gate** — All drafts are presented in the editor. No MCP or Terminal actions execute without an explicit "GREEN LIGHT" from the Director.
2. **Checklist Gate** — Any "launch", "send", "publish", or "go live" command triggers the relevant checklist before any action. The checklist must be cleared first.
3. **Archive-First** — Before creating a product or email, the relevant skill checks past examples in `Commerce-Agent/past-products/` or `Marketing-Agent/past-emails/` for consistency.
4. **Inbox Drafting** — All drafts land in `inbox/` for review. Nothing goes directly to WooCommerce or Mailchimp without Director approval.
5. **Shadow Logging** — Every completed state-changing action is appended to `session-log.md` for a full paper trail.
6. **Context Efficiency** — Sub-agent folders are not loaded unless explicitly triggered (`@folder`) or the task clearly maps to a department.
7. **Morning Brief** — On the first interaction of the day, the Orchestrator runs `git pull --rebase origin main` and summarizes the latest `CHANGELOG.md` entries.

---

## MCP Integrations

| Service | Status | Agent |
|---------|--------|-------|
| WordPress / WooCommerce | Pending credentials | Commerce-Agent |
| Mailchimp | Pending credentials | Marketing-Agent |
| Social Media | Pending setup | Marketing-Agent |
| Canva | Pending setup | Marketing-Agent |

---

*Last updated: 2026-03-23 (v0.2.0)*
