#!/usr/bin/env python3
"""
Refresh the Google Drive OAuth access token.
Reads credentials from ~/.config/mcp-gdrive/credentials.json,
refreshes using the client keys, writes the new token back,
and prints it to /tmp/gdrive_token.txt for use in shell scripts.

Usage:
    python3 Operations-Agent/scripts/refresh-gdrive-token.py
"""

import json
import time
import urllib.request
import urllib.parse

OAUTH_KEYS_PATH = "/Users/swishstar/.config/mcp-gdrive/gcp-oauth.keys.json"
CREDENTIALS_PATH = "/Users/swishstar/.config/mcp-gdrive/credentials.json"
TOKEN_TMP_PATH = "/tmp/gdrive_token.txt"


def refresh_token():
    with open(OAUTH_KEYS_PATH) as f:
        keys = json.load(f)
    k = keys.get("installed", keys.get("web", {}))

    with open(CREDENTIALS_PATH) as f:
        creds = json.load(f)

    data = urllib.parse.urlencode({
        "client_id": k["client_id"],
        "client_secret": k["client_secret"],
        "refresh_token": creds["refresh_token"],
        "grant_type": "refresh_token",
    }).encode()

    req = urllib.request.Request(
        "https://oauth2.googleapis.com/token", data=data, method="POST"
    )
    resp = json.loads(urllib.request.urlopen(req).read())

    if "access_token" not in resp:
        raise RuntimeError(f"Token refresh failed: {resp}")

    creds["access_token"] = resp["access_token"]
    creds["expiry_date"] = int((time.time() + resp["expires_in"]) * 1000)

    with open(CREDENTIALS_PATH, "w") as f:
        json.dump(creds, f)

    with open(TOKEN_TMP_PATH, "w") as f:
        f.write(resp["access_token"])

    print(f"Token refreshed. Expires in {resp['expires_in']}s.")
    print(f"Written to {TOKEN_TMP_PATH}")


if __name__ == "__main__":
    refresh_token()
