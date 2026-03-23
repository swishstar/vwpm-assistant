# Rosy — Your Business Assistant Dashboard

Welcome back, Vanessa. This is your central hub. Everything Rosy does goes through this workspace.

---

## Quick-Start Commands

Type any of these in the chat to get started:

| What to Type | What Happens |
|---|---|
| `Status` | Rosy reads her inbox and session log and gives you a morning brief |
| `Add product` | Rosy drafts a new WooCommerce product for your review |
| `Draft email` | Rosy drafts a new Mailchimp campaign for your review |
| `Remember: [lesson]` | Rosy saves a note to `training/` for future learning |
| `Run maintenance` | Rosy compresses all training notes into the Knowledge Base |

---

## How Approvals Work

Rosy will **never** push anything to WordPress or Mailchimp without your explicit go-ahead.

The two-gate system:
1. **Draft Gate** — Every product or email is saved to `inbox/` for your review first.
2. **Checklist Gate** — When you're ready to launch or send, Rosy shows you the full checklist before doing anything.

To approve and proceed, type: **GREEN LIGHT**

---

## Your Key Files

| File / Folder | What It Is |
|---|---|
| [`session-log.md`](session-log.md) | Every action Rosy has taken — your paper trail |
| [`inbox/`](inbox/) | Drafts waiting for your review |
| [`checklists/product-launch.md`](checklists/product-launch.md) | Pre-launch checklist for new products |
| [`checklists/email-sequence.md`](checklists/email-sequence.md) | Pre-send checklist for email campaigns |
| [`KNOWLEDGE_BASE.md`](KNOWLEDGE_BASE.md) | Rosy's memory — compressed styles and preferences |
| [`CHANGELOG.md`](CHANGELOG.md) | History of all updates to this system |
| [`ASSISTANT_MANUAL.md`](ASSISTANT_MANUAL.md) | Full capabilities reference |

---

## Drop New Material Here

- **New images, flyers, or copy** → drag into [`inbox/`](inbox/)
- **New product info** → drop a file in [`inbox/`](inbox/) and tell Rosy: "I dropped a new product in the inbox"
- **Past products for reference** → save to [`Commerce-Agent/past-products/`](Commerce-Agent/past-products/)
- **Past email campaigns** → save to [`Marketing-Agent/past-emails/`](Marketing-Agent/past-emails/)

---

## MCP Connections (Live Integrations)

| Service | Status |
|---------|--------|
| WordPress / WooCommerce | Pending — add credentials to `.cursor/mcp.json` |
| Mailchimp | Pending — add credentials to `.cursor/mcp.json` |

> **Security reminder:** Use a WordPress **Application Password** (not your main login) and a scoped Mailchimp API key. See `ASSISTANT_MANUAL.md` for setup instructions.

---

*Rosy is ready. What would you like to work on today?*
