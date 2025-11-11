#!/bin/bash
# Severity: High
# Type: SAST - Path traversal through unsanitized file parameter (CWE-22)

read -p "Enter the name of the log file to view: " filename
LOG_DIR="./logs"

# Vulnerability: allowing ../ sequences exposes arbitrary files on the system.
cat "$LOG_DIR/$filename"

