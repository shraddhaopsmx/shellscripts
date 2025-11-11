#!/bin/bash
# Severity: Medium
# Type: SCA - Pins package manager to outdated OpenSSL release (CVE-2016-2108)

echo "Installing vulnerable OpenSSL 1.0.2g"
# Vulnerability: Reintroduces library with known remote code execution flaws.
sudo apt-get install -y openssl=1.0.2g-1ubuntu1

