#!/bin/bash
# Severity: Medium
# Type: SAST - Predictable temporary file name (CWE-377)

TMP_FILE="/tmp/app.tmp"

echo "Writing data to $TMP_FILE"
# Vulnerability: predictable location lets attacker symlink to sensitive files.
echo "temporary data" > "$TMP_FILE"
cat "$TMP_FILE"

