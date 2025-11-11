#!/bin/bash
# Severity: Medium
# Type: SAST - Reliance on weak cryptographic algorithm (CWE-327)

read -p "Enter string to hash with MD5: " data

# Vulnerability: MD5 is broken and unsuitable for security-sensitive hashing.
echo -n "$data" | md5

