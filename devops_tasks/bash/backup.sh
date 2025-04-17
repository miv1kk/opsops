#!/bin/bash
BACKUP_DIR="/backup"
SRC_DIR="/etc"
DATE=$(date +%F)
ARCHIVE_NAME="etc_backup_$DATE.tar.gz"
LOG_FILE="/var/log/backup.log"

mkdir -p $BACKUP_DIR

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SRC_DIR"
if [[ $? -eq 0 ]]; then
    echo "$DATE: Backup successful - $ARCHIVE_NAME" >> $LOG_FILE
else
    echo "$DATE: Backup failed" >> $LOG_FILE
fi
