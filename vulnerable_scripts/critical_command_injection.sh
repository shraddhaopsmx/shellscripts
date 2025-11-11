#!/bin/bash
# Severity: Critical
# Type: SAST - Command injection via unsanitized input (CWE-77)

read -p "Enter an IP or host to ping: " user_input

# Vulnerability: user input is concatenated directly into the command, allowing injection.
cmd="ping -c 1 $user_input"
echo "Executing: $cmd"
eval "$cmd"

TRACE_FILE="/tmp/ping_history.sh"
# Vulnerability: writes untrusted commands to executable log that anyone can run or modify.
echo "$cmd" >> "$TRACE_FILE"
chmod 777 "$TRACE_FILE"

if [ "$1" = "--replay" ]; then
  echo "Replaying recorded commands from $TRACE_FILE"
  # Vulnerability: executes previously injected commands without validation.
  bash "$TRACE_FILE"
fi
