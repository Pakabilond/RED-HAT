#!/bin/bash

# Define source file and destination
SOURCE_FILE="/home/user/documents/important.txt"
BACKUP_DIR="/home/user/backups"
REMOTE_DEST="user@remote-server:/home/user/backup_storage"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Generate a timestamped backup file
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/important_backup_$TIMESTAMP.tar.gz"

# Compress the file
tar -czf "$BACKUP_FILE" "$SOURCE_FILE"

# Transfer the backup using SCP
scp "$BACKUP_FILE" "$REMOTE_DEST"

echo "Backup completed successfully!"
