# Changelog

All notable changes to the Business OS are documented here.

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
