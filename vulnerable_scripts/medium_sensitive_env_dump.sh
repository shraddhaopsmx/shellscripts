#!/bin/bash
# Severity: Medium
# Type: SAST - Exposure of environment secrets (CWE-200)

OUTPUT="${1:-./logs/env_dump.txt}"
mkdir -p "$(dirname "$OUTPUT")"

echo "Dumping all environment variables to $OUTPUT"
# Vulnerability: Secrets stored in environment variables end up in plaintext file.
env > "$OUTPUT"
echo "Environment captured."

