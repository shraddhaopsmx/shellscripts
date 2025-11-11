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

