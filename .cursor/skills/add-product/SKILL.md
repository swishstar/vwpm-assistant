---
name: add-product
description: Creates a new WooCommerce product by referencing historical product data for consistency. Use when the Director says "add product", "new product", "create listing", "new item", or any request to add something to the WooCommerce store.
---

# Add Product — Commerce Skill

## Workflow

### Step 1 — Reference Check
- List all files in `Commerce-Agent/past-products/`.
- If files exist: read the 1-3 most similar products (by category or type).
- Extract and note: naming convention, shipping class, tax status, category, price format, description style.
- If no past products exist: ask the Director to provide one example product for reference before proceeding.

### Step 2 — Gather Required Information
If not already provided, ask for:
- Product name
- Price (and sale price if applicable)
- Short description (1-2 sentences)
- Full description
- Category
- Product images (filenames in `inbox/` or URLs)
- Any variation (sizes, colors, etc.)

### Step 3 — Draft the Product File
Create `inbox/YYYY-MM-DD-[product-slug]-draft.md` with this structure:

```markdown
# Product Draft — [Product Name]

**Date:** YYYY-MM-DD
**Status:** AWAITING REVIEW

## Basic Info
- **Name:** [Product Name]
- **Price:** $[X.XX]
- **Sale Price:** $[X.XX] (if applicable)
- **Category:** [Category]
- **Shipping Class:** [Match from past-products]
- **Tax Status:** [Match from past-products]

## Descriptions
**Short:** [1-2 sentence summary]

**Full:**
[Full product description]

## Images
- [filename or URL]

## Variations (if any)
- [List variations]

## SEO
- **Title:** [SEO title]
- **Meta Description:** [160 chars max]

## Reference
Matched against: `Commerce-Agent/past-products/[reference-file]`
```

### Step 4 — Present and Wait
- Show the draft to the Director.
- State: "Review the product draft above. Type GREEN LIGHT to upload to WooCommerce, or provide edits."
- Do not proceed until GREEN LIGHT is received.

### Step 5 — Upload (after GREEN LIGHT)
1. Run the checklist gate (trigger word "publish" in next step will activate `checklist-bot.mdc`).
2. Use WooCommerce MCP to create the product with the approved data.
3. Confirm the product URL and ID back to the Director.
4. Append to `session-log.md`: `[timestamp] PRODUCT CREATED — [Product Name] — WooCommerce ID: [ID]`
5. Save the draft file to `Commerce-Agent/past-products/[product-slug].md` for future reference.

## Notes
- Never guess at shipping class or tax status — always match from history or ask.
- If images are in `inbox/`, note them in the draft but do not assume they are ready for upload without confirmation.
