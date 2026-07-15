#!/bin/bash

# Parses Linux authentication logs to display
# successful logins, failed logins, sudo activity,
# usernames, source IP addresses, and authentication
# statistics.

LOGFILE="/var/log/auth.log"

# -----------------------------------------------------------
# Verify authentication log exists
# -----------------------------------------------------------

if [ ! -f "$LOGFILE" ]; then
    echo "Error: Authentication log not found."
    exit 1
fi

# -----------------------------------------------------------
# Header
# -----------------------------------------------------------

clear

echo "=================================================="
echo "        Linux Authentication Log Parser"
echo "=================================================="
echo

echo "Generated:"
date

echo

echo "Hostname:"
hostname

echo

# -----------------------------------------------------------
# Successful Logins
# -----------------------------------------------------------

echo "=================================================="
echo "Successful SSH Logins"
echo "=================================================="

SUCCESSFUL=$(grep "Accepted password" "$LOGFILE")

if [ -z "$SUCCESSFUL" ]; then
    echo "No successful SSH logins found."
else
    echo "$SUCCESSFUL"
fi

echo

echo "Total Successful Logins:"

grep -c "Accepted password" "$LOGFILE"

echo

# -----------------------------------------------------------
# Failed Logins
# -----------------------------------------------------------

echo "=================================================="
echo "Failed SSH Logins"
echo "=================================================="

FAILED=$(grep "Failed password" "$LOGFILE")

if [ -z "$FAILED" ]; then
    echo "No failed SSH logins found."
else
    echo "$FAILED"
fi

echo

echo "Total Failed Logins:"

grep -c "Failed password" "$LOGFILE"

echo

# -----------------------------------------------------------
# Sudo Activity
# -----------------------------------------------------------

echo "=================================================="
echo "Sudo Activity"
echo "=================================================="

SUDO_EVENTS=$(grep "sudo" "$LOGFILE")

if [ -z "$SUDO_EVENTS" ]; then
    echo "No sudo events detected."
else
    echo "$SUDO_EVENTS"
fi

echo

echo "Total Sudo Events:"

grep -c "sudo" "$LOGFILE"

echo

# -----------------------------------------------------------
# Successful Login Usernames
# -----------------------------------------------------------

echo "=================================================="
echo "Successful Login Usernames"
echo "=================================================="

grep "Accepted password" "$LOGFILE" \
| awk '{print $9}' \
| sort \
| uniq

echo

# -----------------------------------------------------------
# Failed Login Usernames
# -----------------------------------------------------------

echo "=================================================="
echo "Failed Login Usernames"
echo "=================================================="

grep "Failed password" "$LOGFILE" \
| awk '{
    if ($9=="invalid")
        print $11;
    else
        print $9;
}' \
| sort \
| uniq

echo

# -----------------------------------------------------------
# Source IP Addresses
# -----------------------------------------------------------

echo "=================================================="
echo "Source IP Addresses"
echo "=================================================="

grep "password" "$LOGFILE" \
| awk '{print $(NF-3)}' \
| sort \
| uniq

echo

# -----------------------------------------------------------
# Login Attempts by IP
# -----------------------------------------------------------

echo "=================================================="
echo "Authentication Attempts by IP"
echo "=================================================="

grep "password" "$LOGFILE" \
| awk '{print $(NF-3)}' \
| sort \
| uniq -c \
| sort -nr

echo

# -----------------------------------------------------------
# Session Activity
# -----------------------------------------------------------

echo "=================================================="
echo "Session Activity"
echo "=================================================="

grep "session opened" "$LOGFILE"

echo

grep "session closed" "$LOGFILE"

echo

# -----------------------------------------------------------
# Authentication Summary
# -----------------------------------------------------------

echo "=================================================="
echo "Authentication Summary"
echo "=================================================="

SUCCESS_COUNT=$(grep -c "Accepted password" "$LOGFILE")
FAILED_COUNT=$(grep -c "Failed password" "$LOGFILE")
SUDO_COUNT=$(grep -c "sudo" "$LOGFILE")

echo "Successful Logins : $SUCCESS_COUNT"
echo "Failed Logins     : $FAILED_COUNT"
echo "Sudo Events       : $SUDO_COUNT"

echo

echo "=================================================="
echo "Log Parsing Completed Successfully"
echo "=================================================="
