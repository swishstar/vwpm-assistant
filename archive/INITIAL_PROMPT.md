The "Business OS" Setup Prompt
"I am building a modular, agentic Business Operating System based on the OpenClaw architecture. Your goal is to initialize the file structure and the 'Orchestrator' logic for this system.

1. Create the Directory Structure:
Create the following folders in this root directory:

.cursor/rules/ (for orchestrator logic)

.cursor/skills/ (for multi-step automation)

Commerce-Agent/ (for WooCommerce & Wordpress)

Marketing-Agent/ (for Mailchimp, Social Media, Canva & content)

Operations-Agent/ (for Scheduling & Taxes)

inbox/ (for new assets/flyers)

training/ (for new training material for the orchestrator)

archive/ (for historical data - add a .cursorignore file to this folder to prevent context bloat)

2. Initialize Core Files:

Create an ASSISTANT_MANUAL.md that lists current capabilities.

Create a CHANGELOG.md to track updates for the user.

Create a KNOWLEDGE_BASE.md to store 'compressed' business styles and preferences.

3. Set the Orchestrator Rules:
Create a .cursorrules file in the root with the following 'Librarian' logic:

Act as a COO/Orchestrator.

Context Efficiency: Do not index or read sub-agents unless explicitly triggered by the user (using @folder) or if the task clearly falls into a department.

Review Gate: Always present a draft in the editor and wait for a 'GREEN LIGHT' before using any MCP or Terminal tools.

Morning Brief: On the first interaction of the day, run git pull --rebase origin main and summarize the latest CHANGELOG.md entries for the user.

4. Create a 'Maintenance' Skill:
In .cursor/skills/compress-memory.md, write a procedure where you read the training/ dir, extract new 'lessons learned' into the KNOWLEDGE_BASE.md, and then move the raw data into the ignored archive to keep the context window lean.

5. Create a "Remember" Skill:
In .cursor/skills/remember.md, write a procedure where you summarize what was just done or corrected into a mini Training document so that the Maintenance skill can add it to the database.

6. Final Action:
Once the structure is built, greet me as the 'Director' and tell me you are ready to receive your first MCP credentials for Mailchimp and WordPress."
