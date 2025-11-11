#!/bin/bash
# Severity: High
# Type: SAST - Time-of-check to time-of-use (TOCTOU) race condition (CWE-367)

TARGET="/tmp/config.txt"

if [ -f "$TARGET" ]; then
  echo "Backing up $TARGET"
  # Vulnerability: window for attacker to replace file between check and copy.
  cp "$TARGET" "$TARGET.bak"
else
  echo "Creating default config"
  echo "admin=true" > "$TARGET"
fi

