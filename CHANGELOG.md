# Changelog

All notable changes to the Business OS are documented here.

## [0.7.2] — 2026-04-04

### Added
- **`sync-shared-docs`** skill ([`.cursor/skills/sync-shared-docs/SKILL.md`](.cursor/skills/sync-shared-docs/SKILL.md)) — Vanessa can **push my updates** / **sync shared docs** to commit all non-gitignored changes and `git push origin main` after GREEN LIGHT (pull/rebase first; same friendly conflict handling as Update assistant).

### Changed
- `orchestrator.mdc` — Agent routing for `sync-shared-docs`; shadow logging action type **`GIT SYNC`** for Update assistant and sync-shared-docs git operations.
- `ASSISTANT_MANUAL.md` — Daily Operations entry for `sync-shared-docs` (v0.7.2).
- `01_START_HERE.md` — Quick-Start table row for **Push my updates** / **Sync shared docs**.
- `weekly-backup.mdc` — Note that shared pushes to `main` use `sync-shared-docs`; weekly backup remains gitignored paths on `context-backup`.
- `SETUP_GUIDE.md` — Two-machine diagram and sections 3–4 updated: Vanessa pushes shared docs; developer pulls `main`; `main` vs `context-backup` roles clarified.

---

## [0.7.1] — 2026-03-28

### Added
- **Orchestrator — Google Drive MCP:** When Drive tools return `invalid_request` or `MCP error -32603`, Rosy must immediately suggest stale OAuth, offer the standard reauth procedure (backup/remove `GDRIVE_CREDENTIALS_PATH`, `npx … auth`, reload Cursor), and wait for **GREEN LIGHT** before running commands.

### Changed
- `ASSISTANT_MANUAL.md` — MCP integrations marked active for this workspace; new **Google Drive MCP** subsection (paths, new-machine behavior, pointer to Orchestrator).
- `01_START_HERE.md` — MCP table updated (WordPress, Mailchimp, Google Drive) and security note about not committing secrets.

---

## [0.7.0] — 2026-03-23

### Added
- `.cursorignore` (root) — prevents Cursor's AI indexer from scanning agent reference libraries (`past-products/`, `past-emails/`), agent `output/` handoff folders, `archive/`, `node_modules/`, and system files; reduces background token cost
- `Commerce-Agent/.cursor/rules/commerce.mdc` — path-scoped specialist rule for WooCommerce and WordPress; `alwaysApply: false` — fires only when @Commerce-Agent is referenced or files in that folder are open
- `Marketing-Agent/.cursor/rules/marketing.mdc` — path-scoped specialist rule for Mailchimp, social media, and campaign content; `alwaysApply: false`
- `Operations-Agent/.cursor/rules/operations.mdc` — path-scoped specialist rule for scheduling, Florida sales tax, and SOPs; `alwaysApply: false`
- `Commerce-Agent/STYLE_GUIDE.md` — compressed product memory: naming conventions, shipping classes, tax defaults, description format, image standards
- `Marketing-Agent/STYLE_GUIDE.md` — compressed campaign memory: brand voice, email structure, subject line format, Mailchimp defaults, social media guidelines
- `Operations-Agent/STYLE_GUIDE.md` — compressed ops memory: scheduling format, Florida sales tax notes, SOP document standard
- `Commerce-Agent/output/` — ephemeral handoff zone for cross-agent work; gitignored
- `Marketing-Agent/output/` — ephemeral handoff zone for cross-agent work; gitignored
- `Operations-Agent/output/` — ephemeral handoff zone for cross-agent work; gitignored

### Changed
- `orchestrator.mdc` — added `grep`/`rg`-first search instruction to `## Context Efficiency` (avoids loading multiple files when a single terminal search suffices); added new `## Agent Handoff` section defining how the Orchestrator consumes, logs, and deletes files from agent `output/` folders; updated "Director" references to "Vanessa"
- `manual-maintenance.mdc` — changed `alwaysApply: true` → `false`; rule is now on-demand rather than firing on every message
- `weekly-backup.mdc` — changed `alwaysApply: true` → `false`; rule is triggered by the Orchestrator's Morning Brief Friday check, not every message
- `.gitignore` — added per-agent `output/` directories

### Architecture Note
Phase 7 establishes a **two-tier rule architecture** to solve context bloat:
- **Tier 1 (always-on):** `orchestrator.mdc` + `checklist-bot.mdc` — tiny, critical, fire on every message
- **Tier 2 (path-scoped):** Agent specialist rules — fire only when relevant; zero token cost otherwise

Agent-to-agent communication now uses per-agent `output/` folders (replacing the earlier TRANSIT concept). The Orchestrator is responsible for consuming handoff files and cleaning up after each handoff.

---

## [0.6.0] — 2026-03-23

### Added
- `HELLO_VANESSA.md` — first-run onboarding file; designed to be open when Vanessa first launches Cursor on a new machine; prompts her to type "Hi" to trigger the Morning Brief and first sync

### Changed
- `update-assistant/SKILL.md` — added Step 4b to check if `package.json` changed after a pull and run `npm install` automatically; rewrote conflict handling to hide raw Git errors and offer friendly A/B choice (overwrite with `git reset --hard origin/main` vs. skip); added branch verification at start of workflow
- `orchestrator.mdc` Morning Brief — added `npm install` check after successful pull; added conflict handling guidance with user-friendly language and A/B resolution options

---

## [0.5.0] — 2026-03-23

### Added
- `.cursor/mcp.json.example` — tracked safe template for MCP credentials; replaces need to commit the real `mcp.json`
- `.env.example` — full credential reference with descriptions and setup instructions for all services
- `training/` added to `.gitignore` — lesson notes now stay on the context branch, not main
- `.cursor/skills/update-assistant/SKILL.md` — Vanessa can type "Update assistant" to pull the latest rules, skills, and scripts from main; Rosy summarizes what changed
- `.cursor/rules/weekly-backup.mdc` — every Friday, Rosy prompts Vanessa to back up session log, checklists, training notes, and archive to the `context-backup` branch; also handles file restore requests
- `setup.sh` — one-command bootstrap script for any new machine: checks prerequisites, copies example configs, installs Node dependencies, and prints setup instructions
- `SETUP_GUIDE.md` — complete documentation for the full Dev → GitHub → Vanessa's machine workflow, including credentials reference, context backup/restore, and new machine setup

### Architecture
- **Two-branch model formalized:** `main` holds Rosy's logic (managed by developer), `context-backup` holds Vanessa's operational data (managed by Rosy's weekly backup rule)
- **Secrets confirmed never in git:** `.cursor/mcp.json` was confirmed untracked; `.gitignore` covers `.env`, `mcp.json`, and all context data folders

---

## [0.4.0] — 2026-03-23

### Added
- `.cursor/rules/manual-maintenance.mdc` — always-on rule that keeps `ASSISTANT_MANUAL.md` current when skills or MCP servers are added; enforces `*(NEW — added YYYY-MM-DD)*` badge logic with 7-day expiry
- `scripts/README.md` — establishes the `scripts/` folder as the Puppeteer/automation library; documents folder convention, security rules, and planned scripts
- `COMING SOON` placeholder entries in `ASSISTANT_MANUAL.md` for `fetch-canva-assets` and `file-sales-tax-draft`

### Changed
- `ASSISTANT_MANUAL.md` — full rewrite from technical architecture document to Vanessa-friendly "Job Description" format; all skill descriptions use plain-English "I can..." language; technical sections moved to "For Advanced Reference" at the bottom; Rules table added
- `orchestrator.mdc` Morning Brief — now checks `ASSISTANT_MANUAL.md` for `*(NEW)*` badges and surfaces new skills in the greeting; also triggers badge expiry cleanup

---

## [0.3.0] — 2026-03-23

### Added
- Assistant identity: Rosy — name and VWPM/Florida training series context added to `orchestrator.mdc`
- `01_START_HERE.md` — welcome dashboard with quick-start command cheat sheet, key file links, and approval system reminder
- `.cursor/skills/daily-status/SKILL.md` — "Status" command skill that delivers a formatted morning brief from `session-log.md`, `inbox/`, and checklists
- Security section added to `ASSISTANT_MANUAL.md` — WordPress Application Password and Mailchimp scoped API key guidance

### Changed
- `orchestrator.mdc` — "Director" replaced with "Vanessa" throughout; tone updated to professional and warm
- `ASSISTANT_MANUAL.md` — `daily-status` skill added to the skills table; version updated to v0.3.0

---

## [0.2.0] — 2026-03-23

### Added
- `.cursor/rules/products.mdc` — WooCommerce-specific rules: archive-first lookup, inbox drafting, checklist gate on launch
- `.cursor/rules/email.mdc` — Mailchimp-specific rules: archive-first lookup, inbox drafting, checklist gate on send, `IITalk` tag default
- `.cursor/rules/checklist-bot.mdc` — Always-on checklist gate that intercepts launch/send/publish/go-live commands
- `.cursor/skills/add-product/SKILL.md` — 5-step product creation workflow with past-product reference and GREEN LIGHT gate
- `.cursor/skills/draft-email/SKILL.md` — 6-step email campaign workflow with past-email reference and GREEN LIGHT gate
- `checklists/product-launch.md` — Manual product launch checklist (content, pricing, images, SEO, technical)
- `checklists/email-sequence.md` — Manual email send checklist (content, audience, technical, timing, compliance)
- `Commerce-Agent/past-products/` — Reference library for historical product data (includes README)
- `Marketing-Agent/past-emails/` — Reference library for historical email campaigns (includes README)
- `session-log.md` — Running paper trail of all completed actions
- Shadow Logging section added to `orchestrator.mdc` — Orchestrator now appends to `session-log.md` after every state-changing action

---

## [0.1.0] — 2026-03-23

### Added
- Initial Business OS directory structure (OpenClaw architecture)
- `Commerce-Agent/`, `Marketing-Agent/`, `Operations-Agent/` department folders
- `inbox/`, `training/`, `archive/` utility folders
- `archive/.cursorignore` to prevent historical data from bloating context
- `ASSISTANT_MANUAL.md` — capability reference for the Orchestrator
- `KNOWLEDGE_BASE.md` — compressed business styles and preferences (initialized)
- `CHANGELOG.md` — this file
- `.cursor/rules/orchestrator.mdc` — COO/Orchestrator behavior rules (always-apply)
- `.cursor/skills/compress-memory/SKILL.md` — maintenance procedure for compressing training data
- `.cursor/skills/remember/SKILL.md` — procedure for capturing new lessons in real-time

### Pending
- Mailchimp MCP credentials
- WordPress / WooCommerce MCP credentials
