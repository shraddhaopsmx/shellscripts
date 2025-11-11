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

