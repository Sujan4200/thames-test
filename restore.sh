#!/bin/bash

# Configuration
VOLUME_NAME="getting-started-todo-app_todo-mysql-data"
BACKUP_DIR=$(pwd)

# Check if a filename was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: ./restore.sh <backup-filename.tar.gz>"
  exit 1
fi

BACKUP_FILE=$1

echo "🔄 Restoring $BACKUP_FILE to $VOLUME_NAME..."

docker run --rm \
  -v "$VOLUME_NAME":/data \
  -v "$BACKUP_DIR":/backup \
  alpine sh -c "rm -rf /data/* && tar xzf /backup/$BACKUP_FILE -C /data"

if [ $? -eq 0 ]; then
  echo "✅ Restore complete!"
else
  echo "❌ Restore failed! Check if the file exists."
  exit 1
fi
