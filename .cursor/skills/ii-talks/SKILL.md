---
name: ii-talks
description: >
  Manages the full lifecycle of II Talk events — from creation to post-show wrap-up.
  Three modes: STATUS (view the master table), CREATE (set up a new event), POST-SHOW (run
  post-show steps after an event). Use when Vanessa says "II Talks", "new talk", "talk status",
  "post-show", "ii talks create", "ii talks post-show", "after the show", or "set up a talk".
---

# II Talks — Events Skill

## How to Determine the Mode

Read Vanessa's message and select one of the three modes below:

| If Vanessa says… | Run this mode |
|------------------|--------------|
| "II Talks status", "show me the table", "what talks are pending" | **STATUS** |
| "II Talks create", "new talk", "set up a talk", "add a talk event" | **CREATE** |
| "II Talks post-show", "after the show", "wrap up [talk name]", "post-show for [talk]" | **POST-SHOW** |

If the mode is ambiguous, ask: "Which mode would you like — Status (view the table), Create (set up a new event), or Post-Show (wrap up after an event)?"

---

## MODE: STATUS

### Step 1 — Read the Document
Read `II-TALKS.md` from the project root.

### Step 2 — Print the Master Tables
Display both master status tables (Pre-Show Steps and Post-Show Steps) from the document.

### Step 3 — Highlight Action Items
After the tables, list any rows where cells show 🔲 (not started) and the date is within the next 14 days, or where cells show ? and the show date has already passed. Label these:

> **Needs attention:** [Talk] at [Venue] on [Date] — [list of pending steps]

---

## MODE: CREATE

*Use when setting up a new talk event (new talk title OR a new venue/date for an existing title).*

### Step 1 — Gather Event Details
If not already provided, ask Vanessa for:
- Talk title (new or existing from the series)
- Venue (UUFVB / SOD / Online)
- Event date (MM/DD/YYYY)
- Ticket price
- Expected attendance (to confirm venue fits capacity)

### Step 2 — Canva Assets Reminder
Remind Vanessa that before the ticket product can be published, she will need to prepare three Canva assets:
1. **Ticket image** — used as the featured image on the WooCommerce ticket product
2. **Event image** — used on the events page
3. **Recording image** — used as the featured image on the WooCommerce recording product (only needed once per talk title)

Say: "Have you already created the Canva assets? If not, I'll hold here until you have them ready. Just say 'assets ready' when you'd like to continue."

Wait for Vanessa's confirmation before proceeding.

### Step 3 — Run the Creation Checklist
Output the full checklist from `checklists/ii-talks-create.md`.
Say: "Please confirm all items are complete, or type GREEN LIGHT to proceed."
Do not continue until checklist is cleared.

### Step 4 — Draft the Ticket Product
Create `inbox/YYYY-MM-DD-ticket-[slug]-draft.md` using this structure:

```markdown
# Ticket Product Draft — [Talk Title] at [Venue] ([M/D])

**Date:** YYYY-MM-DD
**Status:** AWAITING REVIEW

## Basic Info
- **Name:** TICKET – [Talk Title] at [Venue Abbreviation] ([M/D])
- **Price:** $[X.XX]
- **Sale Price:** — (none)
- **Category:** Events / Tickets
- **Tax Status:** None (tickets are not taxable services in FL)
- **Stock Status:** In Stock
- **Visibility:** Public (published)

## Descriptions
**Short:** Join us for II TALKS: "[Talk Title]" — [one-sentence hook about the talk topic].

**Full:**
[2–3 paragraph description of the talk. Include: what attendees will explore, what they will walk away with, and any relevant details about the venue or format.]

## Images
- Ticket image: [filename from inbox/ or placeholder]

## SEO
- **Title:** Ticket – [Talk Title] at [Venue] | Vanessa Wishstar
- **Meta Description:** Reserve your seat for II TALKS: "[Talk Title]" at [Venue] on [Date].

## Featured Product
- Set as featured: YES (appears on /events page)

## Notes
- Matched naming convention from past II Talks ticket products.
```

Present the draft to Vanessa and wait for edits or GREEN LIGHT.

### Step 5 — Upload Ticket Product (after GREEN LIGHT)
1. The trigger word "publish" activates `checklist-bot.mdc` — present the `product-launch.md` checklist.
2. Use WooCommerce MCP to create the ticket product with the approved data.
3. Use WooCommerce MCP to set the product as a featured product (so it appears on `/events`).
4. Confirm the product URL and WooCommerce product ID back to Vanessa.
5. Save the draft to `Commerce-Agent/past-products/[date]-ticket-[slug].md` for future reference.
6. Append to `session-log.md`:
   `| YYYY-MM-DD HH:MM | MCP CALL | WooCommerce ticket product created — [product name] — ID: [ID] |`
   `| YYYY-MM-DD HH:MM | MCP CALL | WooCommerce featured set — [product name] |`

### Step 6 — Draft the Pre-Show Email
Create `inbox/YYYY-MM-DD-preshow-[slug].md` using this structure:

```markdown
# Pre-Show Email Draft — [Talk Title] at [Venue] ([M/D])

**Date:** YYYY-MM-DD
**Status:** AWAITING REVIEW

## Campaign Info
- **Subject:** Don't miss it: II TALKS — "[Talk Title]" [Date] at [Venue]
- **Preview Text:** Join Vanessa for an evening of [brief topic descriptor] — limited seats available.
- **Segment:** [Vanessa to confirm: All subscribers / Florida subscribers / Past attendees / etc.]
- **Send Date:** [Suggest: 5–7 days before the event]

## Body
[Warm greeting],

[2–3 paragraphs: what the talk is about, why it matters, what attendees will leave with]

**📅 Date:** [Full date]
**📍 Location:** [Venue name and address / Zoom link]
**🎟️ Tickets:** [Link to WooCommerce ticket product]

[CTA button text: "Reserve My Seat"]

[Warm closing],
Vanessa

## Footer
VWPM — Vero Beach, FL | [unsubscribe link]
```

Present the email draft to Vanessa and wait for GREEN LIGHT before creating in Mailchimp.

### Step 7 — Update II-TALKS.md
Open `II-TALKS.md` and update the relevant row(s) in the Master Status Table:
- **Pre-Show table:** Ticket Product → ✅ · Featured Set → ✅
- Add or update the Per-Talk History section with the WooCommerce product ID and event date.

Append to `session-log.md`:
`| YYYY-MM-DD HH:MM | FILE WRITE | II-TALKS.md updated — [Talk] at [Venue] ([Date]) ticket created |`

---

## MODE: POST-SHOW

*Run this after a talk event has been held.*

### Step 1 — Identify the Event
If not already clear from context, ask:
- Which talk?
- Which venue?
- What was the event date?
- Approximately how many people attended? (for tag reference)

### Step 2 — Run the Post-Show Checklist
Output the full checklist from `checklists/ii-talks-post-show.md`.
Say: "Please confirm all items are complete, or type GREEN LIGHT to proceed."
Do not continue until checklist is cleared.

### Step 3 — Tag Participants in Mailchimp
Confirm the tag name with Vanessa:
> `YYYY-MM-DD [VENUE] IITalks [TalkSlug] Participants`

On GREEN LIGHT: use Mailchimp MCP to apply the tag to all attendees provided.
Log: `| YYYY-MM-DD HH:MM | MCP CALL | Mailchimp: tagged [N] participants — [tag name] |`

### Step 4 — Unpublish the Ticket Product
On GREEN LIGHT: use WooCommerce MCP to set the ticket product status to `draft` (unpublished).
This removes it from the shop. Confirm the product is no longer visible.
Log: `| YYYY-MM-DD HH:MM | MCP CALL | WooCommerce: ticket unpublished — [product name] |`

### Step 5 — Remove from Featured Products
On GREEN LIGHT: use WooCommerce MCP to remove the featured flag from the ticket product.
This removes it from the `/events` page.
Log: `| YYYY-MM-DD HH:MM | MCP CALL | WooCommerce: featured removed — [product name] |`

### Step 6 — Draft and Send the Coupon Email
Confirm with Vanessa:
- The coupon code (100% off the recording product — must be created in WooCommerce first if not yet done)
- The email segment (participants who hold the tag applied in Step 3)

Draft the coupon email in `inbox/YYYY-MM-DD-coupon-[slug].md`:

```markdown
# Coupon Email Draft — [Talk Title] at [Venue] ([Date])

**Date:** YYYY-MM-DD
**Status:** AWAITING REVIEW

## Campaign Info
- **Subject:** Your free recording is ready — II TALKS: "[Talk Title]"
- **Preview Text:** Thank you for joining us. Here's your complimentary download.
- **Segment:** [Participants tag from Step 3]
- **Send Date:** ASAP (within 48 hours of the event)

## Body
Hi [First Name],

Thank you so much for joining us for II TALKS: "[Talk Title]" at [Venue]. It was wonderful to have you there.

As a thank-you for attending in person, here is your complimentary coupon code to download the recording:

**Coupon Code: [COUPONCODE]**

[CTA button: "Get My Free Recording"] → [link to recording product]

This coupon gives you 100% off the recording product. It is yours — no strings attached.

With love,
Vanessa

## Footer
VWPM — Vero Beach, FL | [unsubscribe link]
```

Present the draft and wait for GREEN LIGHT before sending via Mailchimp MCP.
Log: `| YYYY-MM-DD HH:MM | MCP CALL | Mailchimp: coupon email sent — [talk] [venue] participants |`

### Step 7 — Audio Upload Pause
Say to Vanessa:

> "The next step is audio. Please upload the recording (m4a) to Google Drive. Let me know once it's there and share the file name or folder location. I'll take it from there."

Wait for Vanessa's confirmation before continuing.

### Step 8 — Download, Convert, and Upload Audio
Once Vanessa confirms the audio is in Google Drive:
1. Use Google Drive MCP to download the m4a file to `inbox/[filename].m4a`.
2. Run the conversion script:
   ```
   bash scripts/audio-convert.sh inbox/[filename].m4a
   ```
   This produces `inbox/[filename].mp3`.
3. Use WordPress MCP to upload `inbox/[filename].mp3` to the WordPress Media Library.
4. Confirm the media URL back to Vanessa.
5. Delete the local m4a and mp3 from `inbox/` after confirmed upload.
Log: `| YYYY-MM-DD HH:MM | MCP CALL | WordPress: audio uploaded to media library — [filename].mp3 |`

### Step 9 — Create or Update the Recording Product
Check `Commerce-Agent/past-products/` for an existing recording product for this talk title:
- `rg 'Recording – II TALKS' Commerce-Agent/past-products/`

**If no recording product exists yet:**
- Draft a new recording product in `inbox/YYYY-MM-DD-recording-[slug]-draft.md` using the standard `add-product` format.
- On GREEN LIGHT: use WooCommerce MCP to create it with the audio file attached.

**If a recording product already exists:**
- Confirm the WooCommerce product ID with Vanessa.
- On GREEN LIGHT: use WooCommerce MCP to add the new audio file as an additional download to the existing product.

Log: `| YYYY-MM-DD HH:MM | MCP CALL | WooCommerce: recording product [created/updated] — [product name] |`

### Step 10 — Update II-TALKS.md
Open `II-TALKS.md` and mark all completed post-show steps as ✅ in the relevant row.
Update the Per-Talk History section with any product IDs, email campaign IDs, or notes.

Log: `| YYYY-MM-DD HH:MM | FILE WRITE | II-TALKS.md updated — post-show complete for [Talk] at [Venue] ([Date]) |`

---

## Notes

- Never apply a Mailchimp tag without confirming the exact tag string with Vanessa — typos in tags cannot be undone cleanly.
- The recording product coupon must exist in WooCommerce before the coupon email is sent. If Vanessa has not yet created the coupon, pause at Step 6 and offer to draft the coupon via WooCommerce MCP first.
- Audio conversion requires `ffmpeg` installed on the local machine. If the script fails, note the error and ask Vanessa to convert manually.
- Recording products are cumulative — each time a new venue's recording is added, the product description and download files should be updated to reflect all available recordings for that talk.
