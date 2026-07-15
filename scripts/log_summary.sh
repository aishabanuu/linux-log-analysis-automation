#!/bin/bash

# Generates a comprehensive Linux security report
# by analyzing authentication logs, user activity,
# system information, and suspicious login attempts.

LOGFILE="/var/log/auth.log"
REPORT_DIR="$HOME/Linux-Log-Analysis-Automation/reports"

mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/Daily_Log_Report_$(date +%F).txt"

if [ ! -f "$LOGFILE" ]; then
    echo "Authentication log not found."
    exit 1
fi

SUCCESS=$(grep -c "Accepted password" "$LOGFILE")
FAILED=$(grep -c "Failed password" "$LOGFILE")
SUDO=$(grep -c "sudo" "$LOGFILE")

{
echo "============================================================"
echo "            Linux Security Daily Report"
echo "============================================================"
echo

echo "Generated On : $(date)"
echo "Hostname     : $(hostname)"
echo "Current User : $(whoami)"
echo "Kernel        : $(uname -r)"
echo "Operating System : $(hostnamectl | grep 'Operating System' | cut -d ':' -f2 | xargs)"

echo
echo "============================================================"
echo "Authentication Summary"
echo "============================================================"

echo "Successful SSH Logins : $SUCCESS"
echo "Failed SSH Logins     : $FAILED"
echo "Sudo Commands         : $SUDO"

echo
echo "============================================================"
echo "Current Logged-in Users"
echo "============================================================"

who

echo
echo "============================================================"
echo "Recent Login History"
echo "============================================================"

last -10

echo
echo "============================================================"
echo "Top Failed Login IP Addresses"
echo "============================================================"

grep "Failed password" "$LOGFILE" \
| awk '{print $(NF-3)}' \
| sort \
| uniq -c \
| sort -nr

echo
echo "============================================================"
echo "Successful Login Usernames"
echo "============================================================"

grep "Accepted password" "$LOGFILE" \
| awk '{print $9}' \
| sort \
| uniq

echo
echo "============================================================"
echo "Failed Login Usernames"
echo "============================================================"

grep "Failed password" "$LOGFILE" \
| awk '{
if($9=="invalid")
print $11;
else
print $9;
}' \
| sort \
| uniq

echo
echo "============================================================"
echo "Disk Usage"
echo "============================================================"

df -h

echo
echo "============================================================"
echo "Memory Usage"
echo "============================================================"

free -h

echo
echo "============================================================"
echo "System Uptime"
echo "============================================================"

uptime

echo
echo "============================================================"
echo "End of Report"
echo "============================================================"

} > "$REPORT_FILE"

echo
echo "Security report generated successfully."
echo
echo "$REPORT_FILE"
