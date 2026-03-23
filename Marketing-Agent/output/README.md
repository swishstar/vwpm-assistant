# Marketing-Agent / output

This folder is an **ephemeral handoff zone** between the Marketing Agent and the Orchestrator.

## Convention

- The Marketing Agent deposits completed cross-agent work here when it is ready for the next step.
  - Examples: an approved flyer for Commerce to use in a WooCommerce product, finalized event copy for a product description.
- The **Orchestrator picks up the file**, acts on it, then **deletes it and logs the handoff** in `session-log.md`:
  `| timestamp | HANDOFF CONSUMED | [filename] from Marketing-Agent/output/ |`

## Rules

- This folder should be **empty when no handoff is in progress**.
- Files here are **not historical records** — they are transient messages between agents.
- Do not store approved email drafts here. Those go to `Marketing-Agent/past-emails/` after approval.

## This folder is gitignored.
Handoff files are ephemeral and should not be committed to the repository.
