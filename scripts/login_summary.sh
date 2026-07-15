#!/bin/bash

# Displays a quick summary of Linux authentication events.

LOGFILE="/var/log/auth.log"

if [ ! -f "$LOGFILE" ]; then
    echo "Authentication log not found."
    exit 1
fi

clear

SUCCESS=$(grep -c "Accepted password" "$LOGFILE")
FAILED=$(grep -c "Failed password" "$LOGFILE")
SUDO=$(grep -c "sudo" "$LOGFILE")

echo "==========================================="
echo " Linux Authentication Summary"
echo "==========================================="
echo

echo "Date:"
date

echo

echo "Hostname:"
hostname

echo

echo "Successful SSH Logins : $SUCCESS"

echo "Failed SSH Logins     : $FAILED"

echo "Sudo Commands         : $SUDO"

echo

echo "Current Logged-in Users"

who

echo

echo "Recent Login History"

last -5

echo

echo "Summary Completed Successfully."
