# Operations Agent — Style Guide
*Compressed operations memory. Updated by the `compress-memory` skill as new lessons are learned.*
*Last updated: 2026-03-23 (initial template)*

---

## Scheduling Preferences
- Event briefs should be drafted at least 2 weeks before the event date.
- Standard event brief format:
  ```
  Event: [Name]
  Date: [YYYY-MM-DD]
  City: [City, FL]
  Venue: [Name + Address]
  Setup Time: [HH:MM]
  Start Time: [HH:MM]
  End Time: [HH:MM]
  Capacity: [Number]
  Owner: [Responsible party]
  Notes: [Any special logistics]
  ```
- Flag any date that conflicts with a Florida state holiday or known prior event.

## Florida Sales Tax Filing
- Filing period: Quarterly (Jan, Apr, Jul, Oct)
- Florida Department of Revenue: [floridaRevenue.com — confirm URL before use]
- Sales figures come from WooCommerce reports for the relevant quarter.
- Filing prep output goes to `Operations-Agent/output/` for Vanessa's final review.
- **Always stop before Submit.** Vanessa makes the final click.
- Preferred filing approach: Puppeteer script in `scripts/sales-tax/` (when available).

## SOP Document Format
```
# SOP: [Process Name]

**Purpose:** [One sentence — why this process exists]
**Scope:** [What this covers and what it does not]
**Owner:** [Who is responsible]
**Review Date:** [YYYY-MM-DD]

## Steps
1. [First step]
2. [Second step]
...

## Notes
[Any exceptions, edge cases, or warnings]
```

## Vendor Communication Templates
- Venue inquiries: Professional tone. Include event date, expected attendance, setup requirements.
- Follow-ups: Send within 48 hours if no response to initial inquiry.
- Always CC or document in `Operations-Agent/` for record-keeping.

---

## Lessons Learned
*Added by `compress-memory` as corrections and preferences are captured.*

| Date | Lesson | Source |
|------|--------|--------|
| — | — (initial template) | — |
