# Rosy — Your Business Assistant
*Skills & Capabilities Reference*
*Last Updated: 2026-03-23 (v0.4.0)*

---

## How to Use This Guide

This is your cheat sheet. When you are about to do something manually — stop and check here first. If Rosy has a skill for it, just tell her to do it and she will handle the work and show you the result before anything goes live.

**The golden rule:** If it sounds like grunt work, there is probably a skill for it.

---

## What You Can Ask Rosy to Do

### WooCommerce & Your Website

**`add-product`** — Just say "Add a new product" or "Create a listing"
> I can create a new product draft for your WooCommerce store. I look at your past products first to make sure the shipping class, tax settings, and naming all match your existing style. The draft lands in your inbox for you to review before anything is published.

**`update-inventory`** *(COMING SOON)*
> I will be able to mark a product as sold out, restock it, or toggle its visibility — just tell me which event or item.

---

### Email & Marketing

**`draft-email`** — Just say "Draft an email" or "Write a new campaign"
> I can write a full Mailchimp email campaign for you. I check your past campaigns first to match your tone and structure. You review the draft in your inbox before I create anything in Mailchimp.

**`sync-subscribers`** *(COMING SOON)*
> I will be able to take a list of new leads from a spreadsheet or notes file and format them for import into Mailchimp — no manual data entry needed.

---

### Daily Operations

**`daily-status`** — Just say "Status", "Good morning", or "What's pending"
> I give you a morning brief: what is waiting in your inbox, what I have done recently, and what is waiting for your GREEN LIGHT. A quick way to pick up where you left off.

**`remember`** — Just say "Remember this: ..." or "Don't do that again"
> I save a note about a correction, preference, or decision you just made. That note gets added to my memory during the next maintenance run so I don't repeat the mistake.

**`compress-memory`** — Just say "Run maintenance"
> I read all the notes in the training folder, extract the lessons, and add them to my permanent Knowledge Base. Then I clean up the raw notes and archive them to keep things tidy.

---

### Advanced Automation (via Scripts)

**`fetch-canva-assets`** *(COMING SOON)*
> I will be able to log into Canva and pull your latest training flyers directly into your inbox folder, ready to attach to a product listing or email campaign.

**`file-sales-tax-draft`** *(COMING SOON)*
> I will be able to navigate to the Florida Department of Revenue website, fill in your quarterly sales figures from WooCommerce, and prepare the filing draft — stopping before the final submit button so you make the last click.

---

## The Approval System

Rosy never publishes, sends, or submits anything without your go-ahead. Here is how it works:

**Step 1 — The Draft**
Every product, email, or form is saved to your `inbox/` folder first. Rosy shows it to you in the chat and waits.

**Step 2 — The Checklist**
If you say "launch" or "send" or "go live", Rosy shows you the relevant checklist (product or email) before doing anything. You confirm each item.

**Step 3 — GREEN LIGHT**
Once you have reviewed the draft and the checklist, type **GREEN LIGHT** in the chat. That is the only thing that triggers Rosy to push to WordPress, Mailchimp, or any other live system.

---

## For Advanced Reference

### MCP Integrations

| Service | Status | Agent |
|---------|--------|-------|
| WordPress / WooCommerce | Pending credentials | Commerce-Agent |
| Mailchimp | Pending credentials | Marketing-Agent |
| Google Drive | Pending credentials | Operations-Agent |
| Social Media | Pending setup | Marketing-Agent |
| Canva | Pending setup | Marketing-Agent |

### Folder Map

| Folder | What It Is |
|--------|------------|
| `inbox/` | Drafts waiting for your review |
| `Commerce-Agent/past-products/` | Reference library of past products |
| `Marketing-Agent/past-emails/` | Reference library of past campaigns |
| `checklists/` | Product and email launch checklists |
| `training/` | Notes awaiting compression into memory |
| `session-log.md` | Every action Rosy has taken — your paper trail |
| `KNOWLEDGE_BASE.md` | Rosy's compressed memory and preferences |
| `scripts/` | Automation scripts for advanced tasks (Puppeteer) |
| `archive/` | Cold storage — historical data, never indexed |

### Security

**WordPress:** Do not use your main admin password. Create an Application Password under **WordPress Admin → Users → Profile → Application Passwords**, name it `Cursor-Rosy`, and use that in `mcp.json`.

**Mailchimp:** Do not use your account password. Create a scoped API key under **Mailchimp → Account → Extras → API Keys**, name it `Cursor-Rosy`, and use that in `mcp.json`.

Both can be revoked at any time without touching your main login.

### Rules Active in This Workspace

| Rule | What It Does |
|------|--------------|
| `orchestrator.mdc` | Core identity (Rosy), review gates, morning brief, shadow logging |
| `products.mdc` | WooCommerce-specific behavior — archive-first, inbox drafting |
| `email.mdc` | Mailchimp-specific behavior — archive-first, inbox drafting |
| `checklist-bot.mdc` | Intercepts launch/send/publish commands and forces checklist review |
| `manual-maintenance.mdc` | Keeps this manual up to date as new skills are added |
