# Past Products — Reference Library

This folder contains exported records of existing WooCommerce products.

The `add-product` skill reads this folder to match naming conventions, shipping classes, tax statuses, and description styles before drafting any new product.

## How to Add a Product Record

Export a product from WooCommerce and save it here as either:
- `[product-slug].md` — a human-readable markdown summary
- `[product-slug].json` — a raw WooCommerce API export

### Markdown Format (recommended)

```markdown
# [Product Name]

- **Price:** $X.XX
- **Category:** [Category]
- **Shipping Class:** [Class]
- **Tax Status:** [Taxable / None]
- **Tags:** [tags]

## Short Description
[Text]

## Full Description
[Text]
```

The more products you add here, the more consistent new product drafts will be.
