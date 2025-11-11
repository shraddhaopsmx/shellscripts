#!/bin/bash
# Severity: High
# Type: SAST - Creates world-writable executable file (CWE-732)

TARGET="${1:-/usr/local/bin/custom-tool}"

echo "Writing helper script to $TARGET"
cat <<'EOF' > "$TARGET"
#!/bin/bash
echo "Custom tool"
EOF

chmod 777 "$TARGET"
echo "Created world-writable executable at $TARGET"

