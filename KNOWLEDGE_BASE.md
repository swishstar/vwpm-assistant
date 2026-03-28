# Knowledge Base

This file stores compressed business styles, preferences, and lessons learned. It is the single source of truth for the Orchestrator's understanding of how this business operates. It is updated exclusively by the `compress-memory` skill.

---

## Brand Voice & Communication Style

*To be populated after first training session.*

---

## Customer Personas

*To be populated after first training session.*

---

## Product & Pricing Conventions

*To be populated after first training session.*

---

## Marketing Preferences

*To be populated after first training session.*

---

## Operational Preferences

*To be populated after first training session.*

---

## Operational Procedures

### Audio Recording: m4a → mp3 → WP Media

**Trigger:** A recording appears in Google Drive / Temp Uploads that needs to be published.

**Prerequisites:** `ffmpeg` installed (`brew install ffmpeg`). Google Drive OAuth credentials at `~/.config/mcp-gdrive/`.

**Steps:**

1. **Refresh Drive token** (expires hourly — always do this first):
   ```bash
   python3 Operations-Agent/scripts/refresh-gdrive-token.py
   ```

2. **Find the file** — search Drive for files inside the Temp Uploads folder (ID: `19YQ87Nzypf4lNQknpGxnB5nRjbRvmgvL`):
   ```bash
   curl "https://www.googleapis.com/drive/v3/files?q='19YQ87Nzypf4lNQknpGxnB5nRjbRvmgvL'+in+parents&fields=files(id,name,mimeType,size)" \
     -H "Authorization: Bearer $(cat /tmp/gdrive_token.txt)"
   ```

3. **Download the m4a**:
   ```bash
   curl -L "https://www.googleapis.com/drive/v3/files/FILE_ID?alt=media" \
     -H "Authorization: Bearer $(cat /tmp/gdrive_token.txt)" \
     -o "/tmp/vwpm-audio/recording.m4a"
   ```

4. **Convert to mp3** with ffmpeg:
   ```bash
   ffmpeg -i /tmp/vwpm-audio/recording.m4a -codec:a libmp3lame -qscale:a 2 /tmp/vwpm-audio/recording.mp3
   ```

5. **Upload to WordPress media** — use curl directly (NOT the MCP `wp_upload_media` tool — base64 encoding 10+ MB through MCP is too slow):
   ```bash
   curl -X POST "https://www.vanessawishstar.com/wp-json/wp/v2/media" \
     -H "X-WP-MCP-Key: 5dfca3dd73d7c42666a22f566bc1ed2fb1432cfb28e7700f10ed89c7a3e4ed9e" \
     -H "Content-Disposition: attachment; filename=\"Title.mp3\"" \
     -H "Content-Type: audio/mpeg" \
     --data-binary "@/tmp/vwpm-audio/recording.mp3"
   ```
   Response includes the new WP media `id` and `source_url`.

6. **Move file in Drive** → VWIM/II Talks/Recordings (ID: `1XzUMy6o4JYo9XPgBf-b0vtKxm-oT1AJA`):
   ```bash
   curl -X PATCH "https://www.googleapis.com/drive/v3/files/FILE_ID?addParents=1XzUMy6o4JYo9XPgBf-b0vtKxm-oT1AJA&removeParents=19YQ87Nzypf4lNQknpGxnB5nRjbRvmgvL" \
     -H "Authorization: Bearer $(cat /tmp/gdrive_token.txt)" \
     -H "Content-Type: application/json"
   ```
   ⚠️ **Requires Drive write scope.** Current OAuth is `drive.readonly`. Re-auth needed:
   - Add scope `https://www.googleapis.com/auth/drive` in Google Cloud Console (OAuth consent screen)
   - Re-run: `GDRIVE_OAUTH_PATH=~/.config/mcp-gdrive/gcp-oauth.keys.json GDRIVE_CREDENTIALS_PATH=~/.config/mcp-gdrive/credentials.json npx -y @modelcontextprotocol/server-gdrive auth`

7. **Clean up** temp files:
   ```bash
   rm -rf /tmp/vwpm-audio /tmp/gdrive_token.txt
   ```

**Key Drive folder IDs:**
| Folder | ID |
|--------|----|
| Temp Uploads | `19YQ87Nzypf4lNQknpGxnB5nRjbRvmgvL` |
| VWIM/II Talks | `1LMc7cQx_jBtjwCYrzfmdFbB67_msR-Fk` |
| VWIM/II Talks/Recordings | `1XzUMy6o4JYo9XPgBf-b0vtKxm-oT1AJA` |

**Known issue:** The Google Drive MCP in-process connection caches expired tokens. Always refresh the credentials file manually before using Drive MCP calls, then reload the Cursor window if the MCP still errors.

---

## Lessons Learned

*Compressed from `training/` by the `compress-memory` skill. Raw source files are moved to `archive/` after compression.*

| Date | Lesson | Source |
|------|--------|--------|
| — | — | — |

---

*Last compressed: Never (initial state)*
