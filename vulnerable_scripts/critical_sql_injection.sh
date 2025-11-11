#!/bin/bash
# Severity: Critical
# Type: SAST - SQL injection through unsanitized parameters (CWE-89)

DB_PATH="./data/users.db"

if [ ! -f "$DB_PATH" ]; then
  echo "Creating demo database at $DB_PATH"
  mkdir -p "$(dirname "$DB_PATH")"
  sqlite3 "$DB_PATH" "CREATE TABLE users (id INTEGER PRIMARY KEY, username TEXT, password TEXT);"
  sqlite3 "$DB_PATH" "INSERT INTO users (username, password) VALUES ('admin', 'supersecret');"
fi

read -p "Username lookup: " username

# Vulnerability: dangerous string interpolation opens the door to SQL injection.
sqlite3 "$DB_PATH" "SELECT id, username, password FROM users WHERE username = '$username';"

