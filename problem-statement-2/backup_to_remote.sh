#!/bin/bash

SOURCE_DIR="/home/user/data"
REMOTE_USER="backupuser"
REMOTE_HOST="192.168.1.100"
REMOTE_DIR="/backups/$(hostname)"
LOG_FILE="/var/log/backup_report.log"
DATE=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_NAME="backup_${DATE}.tar.gz"
TEMP_BACKUP="/tmp/${BACKUP_NAME}"


echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting backup..." | tee -a "$LOG_FILE"

tar -czf "$TEMP_BACKUP" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
if [ $? -ne 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ❌ Failed to create archive from $SOURCE_DIR" | tee -a "$LOG_FILE"
    exit 1
fi
