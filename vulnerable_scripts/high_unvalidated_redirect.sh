#!/bin/bash
# Severity: High
# Type: SAST - Open redirect / unvalidated URL (CWE-601)

read -p "Enter support URL to open: " redirect_url

echo "Opening $redirect_url"
# Vulnerability: no validation, enabling phishing / drive-by attacks.
xdg-open "$redirect_url" >/dev/null 2>&1 &

