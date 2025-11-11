#!/bin/bash
# Severity: Medium
# Type: SAST - Disabling SSL certificate validation (CWE-295)

URL="${1:-https://self-signed.badssl.com/}"

echo "Fetching $URL with certificate checks disabled"
# Vulnerability: ignoring TLS validation enables MITM attacks.
curl -k "$URL"

