#!/bin/bash

# Configuration
OBSIDIAN_DIR="$HOME/projects/obsidian-personal/iss-digital-garden"
QUARTZ_DIR="$HOME/projects/iss-digital-garden"
QUARTZ_CONTENT_DIR="$QUARTZ_DIR/content"

# Sync files
rsync -av --delete \
    --exclude ".*" \
    --exclude "_*" \
    "$OBSIDIAN_DIR/" "$QUARTZ_CONTENT_DIR/"

# Check if there are changes
if git -C "$QUARTZ_DIR" status --porcelain | grep .; then
    # Changes detected, commit and push
    git -C "$QUARTZ_DIR" add .
    git -C "$QUARTZ_DIR" commit -m "Update content from Obsidian $(date +"%Y-%m-%d %H:%M:%S")"
    git -C "$QUARTZ_DIR" push
    echo "Changes pushed to Quartz repository."
else
    echo "No changes detected in Quartz repository."
fi

# cd "$QUARTZ_DIR" && npx quartz build

echo "Sync complete."
