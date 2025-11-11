#!/bin/bash
# Severity: Medium
# Type: SCA - Installs Python package with known vulnerabilities (CVE-2018-18074)

PACKAGE="requests==2.19.0"

echo "Installing insecure dependency $PACKAGE"
pip install "$PACKAGE"

