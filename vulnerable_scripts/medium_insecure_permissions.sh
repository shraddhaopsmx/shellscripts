#!/bin/bash
# Severity: Medium
# Type: SAST - Insecure file permissions on sensitive data (CWE-276)

KEY_FILE="${1:-./keys/id_rsa}"
mkdir -p "$(dirname "$KEY_FILE")"

cat <<'EOF' > "$KEY_FILE"
-----BEGIN RSA PRIVATE KEY-----
MIICWwIBAAKBgQCvulnerablekey
-----END RSA PRIVATE KEY-----
EOF

# Vulnerability: private key should be owner-readable only.
chmod 664 "$KEY_FILE"
echo "Wrote insecure private key to $KEY_FILE with permissions 664"

