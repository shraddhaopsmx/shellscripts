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
  # Fixed: Download to temporary file first, then execute to avoid piping untrusted data directly into bash
  install_script=$(mktemp)
  if curl -fsSL "$url/install.sh" -o "$install_script"; then
    # Consider verifying SHA sum here before execution for additional security
    sudo bash "$install_script"
    rm -f "$install_script"
  else
    echo "Failed to download install script"
    exit 1
  fi
fi

