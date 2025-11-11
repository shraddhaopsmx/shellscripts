#!/bin/bash
# Severity: Critical
# Type: SAST - Command injection via unsanitized input (CWE-77)

read -p "Enter an IP or host to ping: " user_input

# Vulnerability: user input is concatenated directly into the command, allowing injection.
cmd="ping -c 1 $user_input"
echo "Executing: $cmd"
eval "$cmd"

