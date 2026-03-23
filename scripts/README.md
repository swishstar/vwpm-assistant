# Scripts — Automation Library

This folder holds Puppeteer and browser automation scripts that Rosy can run on command. Each script handles a task that does not have a clean API — like government filing portals and design platforms.

---

## How Scripts Work

1. Vanessa tells Rosy to run a script (e.g., "Do the sales tax draft")
2. Rosy reads the corresponding skill in `.cursor/skills/` to understand the workflow
3. Rosy executes the script, which opens a browser, navigates, and fills in the data
4. **The script always stops before the final irreversible action** (submit, publish, send)
5. Rosy reports back: "I've filled in the form and it's ready for your final review. Please verify and click Submit."

**Vanessa always makes the last click. Scripts never auto-submit.**

---

## Folder Convention

Each script lives in its own subfolder:

```
scripts/
├── fetch-canva/          ← Pulls training flyer images from Canva into inbox/
│   └── fetch-canva.js
├── sales-tax/            ← Navigates FL Dept of Revenue and prepares the filing draft
│   └── sales-tax.js
└── [future scripts...]
```

Each subfolder should contain:
- The script file (`.js`)
- A `README.md` explaining what the script does, what it needs, and where it stops

---

## Planned Scripts

| Script | Status | What It Will Do |
|--------|--------|-----------------|
| `fetch-canva/` | COMING SOON | Log into Canva, find the latest training flyers, and download them to `inbox/` |
| `sales-tax/` | COMING SOON | Navigate to Florida Department of Revenue, fill in quarterly sales figures from WooCommerce, stop before Submit |

---

## Adding a New Script

When a new script is ready:
1. Create its subfolder here with the script and a README
2. Create a matching skill in `.cursor/skills/[script-name]/SKILL.md` that explains how to trigger it
3. Add the skill to `ASSISTANT_MANUAL.md` under "Advanced Automation" — Rosy's `manual-maintenance` rule handles this automatically
4. Update `CHANGELOG.md` with the new capability

---

## Security Notes

- Scripts that log into external services (Canva, government sites) use credentials stored in `.cursor/mcp.json` or environment variables — never hardcoded in the script file
- If a script requires login, it reads the credential from a named environment variable and fails clearly if it is missing
- No script should ever store passwords in plain text inside the `scripts/` folder
