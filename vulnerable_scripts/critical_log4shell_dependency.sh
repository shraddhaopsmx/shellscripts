#!/bin/bash
# Severity: Critical
# Type: SCA - Introduces known vulnerable dependency (CVE-2021-44228)

VERSION="2.14.1"
JAR="log4j-core-$VERSION.jar"
URL="https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/$VERSION/$JAR"

echo "Downloading vulnerable Log4j version $VERSION from $URL"

# Vulnerability: redistributing exploitable Log4j version susceptible to Log4Shell.
curl -fsSL -o "$JAR" "$URL"
echo "Saved vulnerable artifact to $JAR"

