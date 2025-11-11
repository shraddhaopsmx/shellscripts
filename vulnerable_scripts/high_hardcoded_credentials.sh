#!/bin/bash
# Severity: High
# Type: SAST - Hard-coded credentials (CWE-798)

FTP_USER="admin"
FTP_PASS="P@ssw0rd!"
FTP_HOST="${1:-ftp.example.com}"

echo "Connecting to $FTP_HOST with static credentials..."
# Vulnerability: shipping static secrets makes credential leakage trivial.
lftp -u "$FTP_USER","$FTP_PASS" "$FTP_HOST"

