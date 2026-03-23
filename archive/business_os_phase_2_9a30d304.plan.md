---
name: Business OS Phase 2
overview: "Add the missing pieces from the second architecture conversation: department-specific rules, two operational skills (add-product, draft-email), checklists, a shadow log, and reference archive sub-folders. Nothing in the first setup is removed."
todos:
  - id: p2-rules
    content: Create products.mdc, email.mdc, and checklist-bot.mdc rules
    status: completed
  - id: p2-skills
    content: Create add-product/SKILL.md and draft-email/SKILL.md
    status: completed
  - id: p2-checklists
    content: Create checklists/ folder with product-launch.md and email-sequence.md
    status: completed
  - id: p2-reffolders
    content: Create Commerce-Agent/past-products/ and Marketing-Agent/past-emails/ reference folders
    status: completed
  - id: p2-sessionlog
    content: Create session-log.md and add shadow logging section to orchestrator.mdc
    status: completed
  - id: p2-changelog
    content: Update CHANGELOG.md and ASSISTANT_MANUAL.md to reflect Phase 2 additions
    status: completed
isProject: false
---

# Business OS — Phase 2 Implementation Plan

## Gap Analysis

What already exists vs. what the second conversation adds:

**Already built (no changes needed):**

- `.cursor/rules/orchestrator.mdc` — covers the `general.mdc` role
- `.cursor/skills/compress-memory/` and `remember/`
- `archive/`, `inbox/`, `training/`, agent folders, core docs

**Net-new items to create:**

- 2 new rules: `products.mdc`, `email.mdc`
- 1 new rule: `checklist-bot.mdc` (checklist gate on "Launch")
- 2 new skills: `add-product/SKILL.md`, `draft-email/SKILL.md`
- 1 new folder: `checklists/` with 2 starter checklists
- 2 new reference sub-folders inside agent directories (see note below)
- 1 new file: `session-log.md` + shadow-logging section added to `orchestrator.mdc`

---

## Design Decision: Archive Conflict

The two conversations define `archive/` differently:

- **Setup 1** — cold storage, ignored by `.cursorignore`, never read
- **Setup 2** — `past-products/` and `past-emails/` meant to be read by skills for reference

**Resolution:** Keep `archive/` as cold storage. Place the readable reference libraries inside the agent folders instead:

- `Commerce-Agent/past-products/` — old product exports for the `add-product` skill to reference
- `Marketing-Agent/past-emails/` — past campaign drafts for the `draft-email` skill to reference

This keeps cold storage separate from live reference data and does not conflict with the existing `.cursorignore`.

---

## Files to Create

### 1. `.cursor/rules/products.mdc`

Rule scoped to Commerce tasks. Key behaviors:

- Always search `Commerce-Agent/past-products/` before creating a new product
- Match naming convention, shipping class, and tax status from historical examples
- Draft output goes to `inbox/` as a review file — never directly to WooCommerce
- Checklist gate: on any "launch product" command, output `checklists/product-launch.md` before proceeding

### 2. `.cursor/rules/email.mdc`

Rule scoped to Marketing/Mailchimp tasks. Key behaviors:

- Always search `Marketing-Agent/past-emails/` for similar campaigns before drafting
- Draft output goes to `inbox/` — never sent directly via Mailchimp MCP
- Checklist gate: on any "send" or "launch" command, output `checklists/email-sequence.md` before proceeding

### 3. `.cursor/rules/checklist-bot.mdc`

Always-apply rule. Key behaviors:

- Intercepts any message containing "launch", "send", "publish", or "go live"
- Identifies the relevant checklist (product vs. email) and outputs it in full
- Will not proceed past the checklist output until Director confirms each item or types GREEN LIGHT

### 4. `.cursor/skills/add-product/SKILL.md`

Skill triggered by "add product", "new product", "create listing". Workflow:

1. Search `Commerce-Agent/past-products/` for the most similar product
2. Adopt naming convention, shipping class, tax status from match
3. Draft a review file in `inbox/YYYY-MM-DD-product-draft.md`
4. Present draft to Director, wait for GREEN LIGHT
5. After GREEN LIGHT, use WooCommerce MCP to create the product

### 5. `.cursor/skills/draft-email/SKILL.md`

Skill triggered by "draft email", "new campaign", "email sequence". Workflow:

1. Search `Marketing-Agent/past-emails/` for similar campaigns
2. Adopt tone, structure, and subject line format from match
3. Draft output saved to `inbox/YYYY-MM-DD-email-draft.md`
4. Present draft to Director, wait for GREEN LIGHT
5. After GREEN LIGHT, use Mailchimp MCP to create the campaign

### 6. `checklists/product-launch.md`

Starter checklist with items such as:

- Price verified
- Images uploaded with alt-text
- Shipping class set
- Tax status confirmed
- SEO title and description added
- Product linked to correct category

### 7. `checklists/email-sequence.md`

Starter checklist with items such as:

- Subject line reviewed and tested
- Preview text set
- Mailchimp tag `IITalk` applied
- Unsubscribe link verified
- Audience segment confirmed
- Send time scheduled

### 8. `session-log.md`

A running paper trail file in the root. Format: one line per action, timestamp + summary.

Also: add a **Shadow Logging** section to the existing `[.cursor/rules/orchestrator.mdc](.cursor/rules/orchestrator.mdc)` that instructs the AI to append a one-line entry to `session-log.md` after every completed action (MCP call, file write, draft saved).

### 9. Reference folders

- `Commerce-Agent/past-products/` — empty, ready to receive product export files
- `Marketing-Agent/past-emails/` — empty, ready to receive past campaign files

---

## Final Structure (additions highlighted)

```
business_assistant/
├── .cursor/
│   ├── rules/
│   │   ├── orchestrator.mdc       (existing — add shadow logging section)
│   │   ├── products.mdc           NEW
│   │   ├── email.mdc              NEW
│   │   └── checklist-bot.mdc      NEW
│   └── skills/
│       ├── compress-memory/       (existing)
│       ├── remember/              (existing)
│       ├── add-product/           NEW
│       │   └── SKILL.md
│       └── draft-email/           NEW
│           └── SKILL.md
├── checklists/                    NEW
│   ├── product-launch.md
│   └── email-sequence.md
├── Commerce-Agent/
│   └── past-products/             NEW (reference library)
├── Marketing-Agent/
│   └── past-emails/               NEW (reference library)
├── session-log.md                 NEW
└── ... (all existing files unchanged)
```

