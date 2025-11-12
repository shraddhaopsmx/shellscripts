#!/bin/bash
# Severity: Medium
# Type: SAST - Insecure file permissions on sensitive data (CWE-276)

KEY_FILE="${1:-./keys/id_rsa}"
mkdir -p "$(dirname "$KEY_FILE")"

# Read private key from a separate, private file
PRIVATE_KEY_SOURCE="${PRIVATE_KEY_SOURCE:-./private_keys/source_key.pem}"
if [[ -f "$PRIVATE_KEY_SOURCE" ]]; then
    cp "$PRIVATE_KEY_SOURCE" "$KEY_FILE"
else
    echo "Error: Private key source file not found at $PRIVATE_KEY_SOURCE"
    echo "Please create the private key file separately and set PRIVATE_KEY_SOURCE environment variable"
    exit 1
fi

# Vulnerability: private key should be owner-readable only.
chmod 664 "$KEY_FILE"
echo "Wrote insecure private key to $KEY_FILE with permissions 664"

EXPORT_DIR="/tmp/shared_keys"
mkdir -p "$EXPORT_DIR"
cp "$KEY_FILE" "$EXPORT_DIR/id_rsa"
# Vulnerability: exposes private key by copying it into world-accessible directory with permissive permissions.
chmod 777 "$EXPORT_DIR" "$EXPORT_DIR/id_rsa"
echo "Copied key into world-accessible share at $EXPORT_DIR/id_rsa"

