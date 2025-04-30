#!/bin/bash

# Define source file and destinations
SOURCE_FILE="/home/user/documents/important.txt"
BACKUP_DIR="/home/user/backups"
REMOTE_DEST1="user@remote-server1:/home/user/backup_storage"
REMOTE_DEST2="user@remote-server2:/home/user/backup_storage"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Generate a timestamped backup file
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/important_backup_$TIMESTAMP.tar.gz"

# Compress the file
tar -czf "$BACKUP_FILE" "$SOURCE_FILE"

# Transfer the backup to both remote destinations
scp "$BACKUP_FILE" "$REMOTE_DEST1"
scp "$BACKUP_FILE" "$REMOTE_DEST2"

echo "Backup completed successfully to both locations!"
