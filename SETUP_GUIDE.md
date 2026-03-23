# Setup Guide — Rosy Business OS
*Developer and deployment reference*

---

## Overview: The Two-Machine Workflow

```
Your Machine (Dev)           GitHub (Private Repo)       Vanessa's Machine (Prod)
─────────────────────        ─────────────────────       ─────────────────────────
Write rules / skills   →→→   main branch (logic)   →→→  git pull (Update Assistant)
Test MCP connections         context-backup branch  ←←←  git push (Weekly Backup)
Push new features      →→→   (Vanessa's data)
```

- **You** manage Rosy's brain (rules, skills, scripts) on `main`
- **Rosy** manages Vanessa's data (logs, checklists, notes) on `context-backup`
- **Credentials** never leave either machine

---

## Section 1: Your Machine — One-Time GitHub Setup

You only do this once. The local git repo already has 4+ commits.

### 1.1 Create a private GitHub repository

1. Go to [github.com/new](https://github.com/new)
2. Name it something like `rosy-business-os` or `vwpm-business-assistant`
3. Set it to **Private**
4. Do **not** check "Initialize with README" (you already have files)
5. Click **Create repository**
6. Copy the repo URL (format: `git@github.com:your-username/repo-name.git`)

### 1.2 Connect your local repo to GitHub

```bash
cd /path/to/business_assistant

# Add the remote (replace with your actual URL)
git remote add origin git@github.com:your-username/rosy-business-os.git

# Push main branch
git push -u origin main
```

### 1.3 Verify

Go to your GitHub repo page and confirm all files are there. You should **not** see `.cursor/mcp.json` or `.env` — those are gitignored.

---

## Section 2: Vanessa's Machine — One-Time Setup

Run this once when setting up her machine (or any new machine).

### 2.1 Prerequisites

Vanessa needs these installed:
- **Git** — already on modern macOS; check with `git --version`
- **Node.js (LTS)** — download from [nodejs.org](https://nodejs.org)
- **Cursor** — download from [cursor.com](https://cursor.com)

### 2.2 Clone the repo

```bash
# In Terminal, navigate to where she wants the folder
cd ~/Documents

# Clone (replace with actual repo URL)
git clone git@github.com:your-username/rosy-business-os.git business_assistant

cd business_assistant
```

> If she doesn't have SSH set up, use the HTTPS URL instead:
> `git clone https://github.com/your-username/rosy-business-os.git`

### 2.3 Run setup

```bash
./setup.sh
```

This will:
- Check that git, node, and npm are installed
- Copy `.cursor/mcp.json.example` → `.cursor/mcp.json`
- Copy `.env.example` → `.env`
- Install any Node.js script dependencies

### 2.4 Fill in credentials

Open `.cursor/mcp.json` and replace all placeholder values with real credentials:
- Mailchimp API key (create one named `Cursor-Rosy` in Mailchimp)
- WooCommerce URL, consumer key, and consumer secret
- Google Drive credentials (if applicable)

See `.env.example` for descriptions of each field.

### 2.5 Open in Cursor

1. Open Cursor
2. File → Open Folder → select the `business_assistant` folder
3. Open `01_START_HERE.md` — Vanessa's welcome dashboard
4. Open the AI chat and type: **Status**

Rosy will introduce herself and give the first morning brief.

---

## Section 3: Ongoing Developer Workflow

### Adding a new skill, rule, or script

```bash
# On your machine
# 1. Create/edit the files
# 2. Test in your Cursor workspace
# 3. Commit
git add .
git commit -m "Add fetch-canva skill"
git push origin main
```

### Vanessa picks up the update

Vanessa types: **"Update assistant"** or **"Pull updates"**

Rosy presents the `git pull --rebase origin main` command, waits for GREEN LIGHT, runs it, and summarizes what changed.

### Fixing a bug in a script

Same as above — edit, commit, push. Vanessa updates on demand or during the next Friday morning brief (when Rosy's Morning Brief suggests running updates).

---

## Section 4: Context Backup (Vanessa's Data)

### How it works

Every Friday, Rosy prompts Vanessa during the Morning Brief:

> "It's Friday — would you like me to back up your session log, checklists, and training notes? Type GREEN LIGHT."

Rosy then runs:
```bash
git checkout -B context-backup
git add checklists/ session-log.md training/ archive/
git commit -m "Context backup — YYYY-MM-DD"
git push origin context-backup
git checkout main
```

### Restoring a deleted file

If Vanessa accidentally deletes a draft or log entry, she tells Rosy:

> "Can you restore the product draft I was working on yesterday?"

Rosy will find it in the `context-backup` branch and restore it with:
```bash
git checkout context-backup -- inbox/2026-03-22-product-draft.md
```

### Why this beats Time Machine for this use case

Rosy can navigate git history conversationally. Vanessa doesn't need to know what Time Machine is or how to use it — she just asks Rosy.

---

## Section 5: New Machine (Future)

If Vanessa gets a new laptop or you need to restore everything:

1. Install Git, Node.js, and Cursor (prerequisites above)
2. Clone the repo (Section 2.2)
3. Run `./setup.sh` (Section 2.3)
4. Fill in credentials (Section 2.4)
5. To restore Vanessa's data, also pull the context-backup branch:
   ```bash
   git fetch origin
   git checkout context-backup
   # Copy the files you need back to main working tree
   git checkout main
   ```

---

## Section 6: Secrets Reference

| Secret | Where | How to Create |
|--------|-------|---------------|
| Mailchimp API key | `.cursor/mcp.json` | Mailchimp → Account → Extras → API Keys → Create, name it `Cursor-Rosy` |
| WooCommerce keys | `.cursor/mcp.json` | WooCommerce → Settings → Advanced → REST API → Add Key |
| WordPress App Password | `.cursor/mcp.json` | WordPress Admin → Users → Profile → Application Passwords → name it `Cursor-Rosy` |
| Google Drive credentials | `.cursor/mcp.json` | Google Cloud Console → Service Account → Download JSON |

**Never commit `.cursor/mcp.json` or `.env` to git.** Both are in `.gitignore`.

To revoke Rosy's access to any service: delete the specific key named `Cursor-Rosy` on that platform. The main account credentials are never affected.
