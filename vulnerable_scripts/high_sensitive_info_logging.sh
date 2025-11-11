#!/bin/bash
# Severity: High
# Type: SAST - Logging sensitive information (CWE-532)

read -p "Enter API key: " api_key

timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
LOG_FILE="./logs/api.log"
mkdir -p "$(dirname "$LOG_FILE")"

# Vulnerability: secret is stored verbatim in logs, exposing credentials.
echo "$timestamp INFO Requested operation with api_key=$api_key" >> "$LOG_FILE"
echo "Logged request to $LOG_FILE"

