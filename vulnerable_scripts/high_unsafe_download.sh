#!/bin/bash
# Severity: High
# Type: SAST - Downloading and executing code without integrity checks (CWE-494)

URL="${1:-https://example.com/tools/latest.sh}"
TMP_FILE="/tmp/installer.sh"

echo "Downloading helper script from $URL"
curl -fsSL "$URL" -o "$TMP_FILE"

echo "Running downloaded script..."
# Vulnerability: executing unverified code enables supply-chain attacks.
bash "$TMP_FILE"

