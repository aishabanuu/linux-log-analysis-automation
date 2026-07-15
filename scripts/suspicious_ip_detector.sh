#!/bin/bash

# Detects IP addresses with repeated failed SSH login
# attempts and identifies potential brute-force attacks.

LOGFILE="/var/log/auth.log"
THRESHOLD=5

if [ ! -f "$LOGFILE" ]; then
    echo "Authentication log not found."
    exit 1
fi

clear

echo "======================================================"
echo "      Suspicious IP Address Detection Report"
echo "======================================================"
echo

echo "Generated: $(date)"
echo "Hostname : $(hostname)"
echo

echo "Threshold: $THRESHOLD failed login attempts"
echo

echo "------------------------------------------------------"
echo "Potential Brute Force IP Addresses"
echo "------------------------------------------------------"

FOUND=0

grep "Failed password" "$LOGFILE" \
| awk '{print $(NF-3)}' \
| sort \
| uniq -c \
| sort -nr \
| while read COUNT IP
do

    if [ "$COUNT" -ge "$THRESHOLD" ]; then

        FOUND=1

        FIRST=$(grep "$IP" "$LOGFILE" | head -1 | awk '{print $1,$2,$3}')

        LAST=$(grep "$IP" "$LOGFILE" | tail -1 | awk '{print $1,$2,$3}')

        echo "IP Address          : $IP"
        echo "Failed Attempts     : $COUNT"
        echo "First Seen          : $FIRST"
        echo "Last Seen           : $LAST"
        echo "Risk Level          : HIGH"
        echo "------------------------------------------"

    fi

done

echo
echo "Top Failed Login Sources"
echo

grep "Failed password" "$LOGFILE" \
| awk '{print $(NF-3)}' \
| sort \
| uniq -c \
| sort -nr

echo
echo "Detection Complete."
