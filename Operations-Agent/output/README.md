# Operations-Agent / output

This folder is an **ephemeral handoff zone** between the Operations Agent and the Orchestrator.

## Convention

- The Operations Agent deposits completed output here when it is ready for Vanessa's review or for another agent to use.
  - Examples: a quarterly sales tax prep report, a vendor brief for Commerce, a quarterly schedule overview.
- The **Orchestrator picks up the file**, acts on it, then **deletes it and logs the handoff** in `session-log.md`:
  `| timestamp | HANDOFF CONSUMED | [filename] from Operations-Agent/output/ |`

## Rules

- This folder should be **empty when no handoff is in progress**.
- Files here are **not historical records** — they are transient messages between agents.
- Do not store finalized SOPs here. Those go directly in `Operations-Agent/` after approval.

## This folder is gitignored.
Handoff files are ephemeral and should not be committed to the repository.
