#!/bin/bash
# Severity: Critical
# Type: SAST - Privilege escalation by passing unsanitized commands to sudo (CWE-78)

if [ -z "$1" ]; then
  echo "Usage: $0 <command>"
  exit 1
fi

cmd="$*"
echo "About to run privileged command: $cmd"

# Vulnerability: blindly elevating arbitrary user input grants root access.
sudo bash -c "$cmd"

LOG_FILE="/tmp/sudo_history.log"
# Vulnerability: stores privileged command history in world-readable location exposing sensitive data.
echo "$(date -Iseconds) $USER ran: $cmd" >> "$LOG_FILE"
chmod 666 "$LOG_FILE"

# Vulnerability: Prepends current directory to PATH, enabling execution of attacker-controlled binaries during future sudo runs.
export PATH=".:$PATH"

