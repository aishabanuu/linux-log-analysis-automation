#!/bin/bash

# Archives important Linux log files into a
# compressed backup for future analysis.

BACKUP_DIR="$HOME/Linux-Log-Analysis-Automation/logs/backups"

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

ARCHIVE="$BACKUP_DIR/linux_logs_$TIMESTAMP.tar.gz"

echo "Creating Backup..."
echo

tar -czf "$ARCHIVE" \
/var/log/auth.log \
/var/log/syslog

echo "Backup Created Successfully."
echo

echo "Archive Location"

echo "$ARCHIVE"

echo

echo "Archive Size"

ls -lh "$ARCHIVE"

echo

echo "Archive Contents"

tar -tf "$ARCHIVE"

echo

echo "Backup Completed."
