#!/usr/bin/env bash
# upload-recording.sh
# Full pipeline: Download m4a from Drive → Convert to mp3 → Upload to WP Media
#
# Usage:
#   ./Operations-Agent/scripts/upload-recording.sh FILE_ID "Title of Recording"
#
# Example:
#   ./Operations-Agent/scripts/upload-recording.sh 1OPT4vF4V8iFTNAkMXKH9-hIvsZeA4TXJ "Money Matters Guided Meditation"

set -e

FILE_ID="${1:?Usage: $0 FILE_ID 'Recording Title'}"
TITLE="${2:?Usage: $0 FILE_ID 'Recording Title'}"
SLUG="${TITLE// /-}"
TMP_DIR="/tmp/vwpm-audio"
M4A_PATH="$TMP_DIR/recording.m4a"
MP3_PATH="$TMP_DIR/${SLUG}.mp3"

WP_API="https://www.vanessawishstar.com/wp-json/wp/v2/media"
WP_MCP_KEY="5dfca3dd73d7c42666a22f566bc1ed2fb1432cfb28e7700f10ed89c7a3e4ed9e"

RECORDINGS_FOLDER="1XzUMy6o4JYo9XPgBf-b0vtKxm-oT1AJA"
TEMP_UPLOADS_FOLDER="19YQ87Nzypf4lNQknpGxnB5nRjbRvmgvL"

echo "=== Step 1: Refreshing Drive token ==="
python3 "$(dirname "$0")/refresh-gdrive-token.py"
TOKEN=$(cat /tmp/gdrive_token.txt)

echo "=== Step 2: Downloading m4a ==="
mkdir -p "$TMP_DIR"
curl -s -L "https://www.googleapis.com/drive/v3/files/${FILE_ID}?alt=media" \
  -H "Authorization: Bearer $TOKEN" \
  -o "$M4A_PATH"
echo "Downloaded: $(du -h "$M4A_PATH" | cut -f1)"

echo "=== Step 3: Converting to mp3 ==="
ffmpeg -i "$M4A_PATH" -codec:a libmp3lame -qscale:a 2 "$MP3_PATH" -y
echo "Converted: $(du -h "$MP3_PATH" | cut -f1)"

echo "=== Step 4: Uploading to WordPress ==="
RESPONSE=$(curl -s -X POST "$WP_API" \
  -H "X-WP-MCP-Key: $WP_MCP_KEY" \
  -H "Content-Disposition: attachment; filename=\"${SLUG}.mp3\"" \
  -H "Content-Type: audio/mpeg" \
  --data-binary "@$MP3_PATH")

WP_ID=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('id','ERROR'))")
WP_URL=$(echo "$RESPONSE" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('source_url', d.get('message','ERROR')))")
echo "WP Media ID: $WP_ID"
echo "URL: $WP_URL"

echo "=== Step 5: Moving file in Drive ==="
# NOTE: Requires drive write scope. Re-auth if this step fails with 403.
MOVE_RESP=$(curl -s -X PATCH \
  "https://www.googleapis.com/drive/v3/files/${FILE_ID}?addParents=${RECORDINGS_FOLDER}&removeParents=${TEMP_UPLOADS_FOLDER}&fields=id,name,parents" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json")

if echo "$MOVE_RESP" | grep -q '"error"'; then
  echo "WARNING: Drive move failed (likely needs write scope re-auth). File remains in Temp Uploads."
  echo "$MOVE_RESP" | python3 -c "import sys,json; print(json.load(sys.stdin)['error']['message'])"
else
  echo "Moved to VWIM/II Talks/Recordings."
fi

echo "=== Step 6: Cleaning up ==="
rm -rf "$TMP_DIR" /tmp/gdrive_token.txt
echo "Done. WP Media ID: $WP_ID — $WP_URL"
