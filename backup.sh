#!/bin/bash

# Configuration
VOLUME_NAME="getting-started-todo-app_todo-mysql-data"
BACKUP_DIR=$(pwd)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="mysql_backup_${TIMESTAMP}.tar.gz"

echo "📦 Starting backup of volume: $VOLUME_NAME..."

docker run --rm \
  -v "$VOLUME_NAME":/data \
  -v "$BACKUP_DIR":/backup \
  alpine tar czf /backup/"$BACKUP_FILE" -C /data .

if [ $? -eq 0 ]; then
  echo "✅ Backup successful: $BACKUP_DIR/$BACKUP_FILE"
else
  echo "❌ Backup failed!"
  exit 1
fi
