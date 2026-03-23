#!/usr/bin/env bash
# audio-convert.sh — Converts an m4a audio file to mp3 for WordPress upload.
# Usage: bash scripts/audio-convert.sh <input.m4a>
# Output: <input>.mp3 written alongside the input file.
# Requires: ffmpeg (install with: brew install ffmpeg)

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: bash scripts/audio-convert.sh <input.m4a>" >&2
  exit 1
fi

INPUT="$1"

if [ ! -f "$INPUT" ]; then
  echo "Error: File not found: $INPUT" >&2
  exit 1
fi

# Verify the input has an m4a extension (case-insensitive)
EXTENSION="${INPUT##*.}"
if [[ "${EXTENSION,,}" != "m4a" ]]; then
  echo "Error: Expected an .m4a file, got: $INPUT" >&2
  exit 1
fi

# Verify ffmpeg is available
if ! command -v ffmpeg &>/dev/null; then
  echo "Error: ffmpeg is not installed." >&2
  echo "Install it with: brew install ffmpeg" >&2
  exit 1
fi

# Build output path (same directory as input, .mp3 extension)
OUTPUT="${INPUT%.*}.mp3"

echo "Converting: $INPUT → $OUTPUT"

ffmpeg -i "$INPUT" \
  -vn \
  -codec:a libmp3lame \
  -qscale:a 2 \
  -ar 44100 \
  "$OUTPUT" \
  -y -loglevel warning

if [ $? -eq 0 ]; then
  echo "Done: $OUTPUT"
else
  echo "Error: Conversion failed." >&2
  exit 1
fi
