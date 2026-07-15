#!/bin/bash

# Script Name : failed_login_detection.sh
# Detects failed SSH login attempts from the Linux
# authentication log and provides a security summary.

# Authentication log location
LOGFILE="/var/log/auth.log"

# Verify that the log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: Authentication log not found."
    exit 1
fi

echo "=========================================="
echo "     Failed SSH Login Detection Report"
echo "=========================================="
echo

echo "Date:"
date
echo

echo "Hostname:"
hostname
echo

echo "Authentication Log:"
echo "$LOGFILE"
echo

echo "------------------------------------------"
echo "Failed Login Attempts"
echo "------------------------------------------"

FAILED_LOGINS=$(grep "Failed password" "$LOGFILE")

if [ -z "$FAILED_LOGINS" ]; then
    echo "No failed login attempts detected."
else
    echo "$FAILED_LOGINS"
fi

echo
echo "------------------------------------------"
echo "Statistics"
echo "------------------------------------------"

TOTAL_FAILED=$(grep -c "Failed password" "$LOGFILE")

echo "Total Failed Login Attempts : $TOTAL_FAILED"

echo
echo "------------------------------------------"
echo "Unique Source IP Addresses"
echo "------------------------------------------"

grep "Failed password" "$LOGFILE" \
| awk '{print $(NF-3)}' \
| sort \
| uniq

echo
echo "------------------------------------------"
echo "Top Source IP Addresses"
echo "------------------------------------------"

grep "Failed password" "$LOGFILE" \
| awk '{print $(NF-3)}' \
| sort \
| uniq -c \
| sort -nr

echo
echo "=========================================="
echo "End of Report"
echo "=========================================="
