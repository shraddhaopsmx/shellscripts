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

if [ "$2" = "--install" ]; then
  echo "Running privileged installer from $url/install.sh"
  # Vulnerability: piping remote script directly into sudo bash executes attacker-controlled code with root privileges.
  curl -fsSL "$url/install.sh" | sudo bash
fi

