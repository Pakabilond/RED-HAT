#!/bin/bash

# Variables
WEB_ROOT="/var/www/html"          # Path to your website files
BACKUP_DIR="/path/to/backup"      # Where backups will be stored
DB_NAME="your_database_name"      # Your database name
DB_USER="your_db_user"            # Your database user
DB_PASS="your_db_password"        # Your database password
DATE=$(date +%F_%T)               # Current date and time

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup website files
tar -czf "$BACKUP_DIR/site_backup_$DATE.tar.gz" "$WEB_ROOT"

# Backup database
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/db_backup_$DATE.sql"

# Display completion message
echo "Backup completed: $BACKUP_DIR"
