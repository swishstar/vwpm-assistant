---
name: draft-email
description: Drafts a Mailchimp email campaign or sequence by referencing past successful campaigns for tone and structure consistency. Use when the Director says "draft email", "new campaign", "email sequence", "write a newsletter", "Mailchimp", or any request to create email marketing content.
---

# Draft Email — Marketing Skill

## Workflow

### Step 1 — Reference Check
- List all files in `Marketing-Agent/past-emails/`.
- If files exist: read the 1-3 most similar campaigns (by type or audience).
- Extract and note: subject line format, tone, structure, CTA style, sender name, reply-to.
- If no past emails exist: ask the Director to share a sample email or describe the brand voice before drafting.

### Step 2 — Gather Required Information
If not already provided, ask for:
- Campaign type (newsletter, promo, sequence step, announcement)
- Audience segment or Mailchimp list
- Core message / goal of the email
- Any specific offer, deadline, or CTA
- Desired send date/time (if scheduling)

### Step 3 — Draft the Email File
Create `inbox/YYYY-MM-DD-[campaign-slug]-email-draft.md` with this structure:

```markdown
# Email Draft — [Campaign Name]

**Date:** YYYY-MM-DD
**Status:** AWAITING REVIEW
**Campaign Type:** [Newsletter / Promo / Sequence / Announcement]
**Audience:** [Segment name]
**Tags:** IITalk (default — remove if Director specifies otherwise)

## Subject Line
[Subject line — 60 chars max recommended]

## Preview Text
[Preview text — pairs with subject, 85-100 chars]

## From Name
[Sender name — match past-emails reference]

## Body

### Opening
[Personalized greeting or hook]

### Main Body
[Core message — 2-4 paragraphs]

### Call to Action
**[CTA Button Text]** → [URL or placeholder]

### Closing
[Sign-off]

## Reference
Matched against: `Marketing-Agent/past-emails/[reference-file]`
```

### Step 4 — Subject Line Check
- Flag if subject line exceeds 60 characters.
- Confirm preview text is set and pairs well with the subject.

### Step 5 — Present and Wait
- Show the draft to the Director.
- State: "Review the email draft above. Type GREEN LIGHT to create in Mailchimp, or provide edits."
- Do not proceed until GREEN LIGHT is received.

### Step 6 — Create in Mailchimp (after GREEN LIGHT)
1. The "send" or "schedule" command in next step will trigger `checklist-bot.mdc` automatically.
2. After checklist is cleared: use Mailchimp MCP to create the campaign with approved content.
3. Confirm the campaign ID and preview URL back to the Director.
4. Append to `session-log.md`: `[timestamp] EMAIL CAMPAIGN CREATED — [Campaign Name] — Mailchimp ID: [ID]`
5. Save the draft to `Marketing-Agent/past-emails/[campaign-slug].md` for future reference.

## Notes
- Never schedule or send without the checklist gate being cleared.
- Always pair subject line with preview text — a missing preview text is a red flag.
- Default tag is `IITalk` unless overridden by the Director.
