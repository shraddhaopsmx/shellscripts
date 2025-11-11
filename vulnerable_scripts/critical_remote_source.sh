#!/bin/bash
# Severity: Critical
# Type: SAST - Remote code execution by sourcing untrusted remote content (CWE-829)

if [ -z "$1" ]; then
  echo "Usage: $0 <url>"
  exit 1
fi

url="$1"
echo "Fetching helper script from $url"
# Vulnerability: sourcing remote content without validation gives attackers full code execution.
source <(curl -fsSL "$url")

