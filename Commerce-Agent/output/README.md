# Commerce-Agent / output

This folder is an **ephemeral handoff zone** between the Commerce Agent and the Orchestrator.

## Convention

- The Commerce Agent deposits completed work here when it is ready for the next step.
  - Examples: a product package ready for Marketing to review, a batch of product data ready for cross-agent use.
- The **Orchestrator picks up the file**, acts on it, then **deletes it and logs the handoff** in `session-log.md`:
  `| timestamp | HANDOFF CONSUMED | [filename] from Commerce-Agent/output/ |`

## Rules

- This folder should be **empty when no handoff is in progress**.
- Files here are **not historical records** — they are transient messages between agents.
- Do not store finalized products here. Final products go to `inbox/` for Vanessa's review or `Commerce-Agent/past-products/` after approval.

## This folder is gitignored.
Handoff files are ephemeral and should not be committed to the repository.
