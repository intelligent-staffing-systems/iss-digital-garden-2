#!/bin/bash

# Configuration
OBSIDIAN_DIR="$HOME/projects/obsidian-personal/iss-digital-garden"
QUARTZ_DIR="$HOME/projects/iss-digital-garden"
QUARTZ_CONTENT_DIR="$QUARTZ_DIR/content"

# Ensure the Quartz content directory exists
mkdir -p "$QUARTZ_CONTENT_DIR"

# Function to get the latest modification time of files in a directory
get_latest_mod_time() {
    find "$1" -type f -printf '%T@\n' | sort -n | tail -1
}

# Check which directory was modified more recently
OBSIDIAN_MOD_TIME=$(get_latest_mod_time "$OBSIDIAN_DIR")
QUARTZ_MOD_TIME=$(get_latest_mod_time "$QUARTZ_CONTENT_DIR")

# Determine the sync direction
if [[ "$OBSIDIAN_MOD_TIME" > "$QUARTZ_MOD_TIME" ]]; then
    echo "Syncing from Obsidian to Quartz"
    rsync -av --delete \
        --exclude ".*" \
        --exclude "_*" \
        "$OBSIDIAN_DIR/" "$QUARTZ_CONTENT_DIR/"
elif [[ "$QUARTZ_MOD_TIME" > "$OBSIDIAN_MOD_TIME" ]]; then
    echo "Syncing from Quartz to Obsidian"
    rsync -av --delete \
        --exclude ".*" \
        --exclude "_*" \
        "$QUARTZ_CONTENT_DIR/" "$OBSIDIAN_DIR/"
else
    echo "No changes detected"
    exit 0
fi

# Check if there are changes in the Quartz directory
if git -C "$QUARTZ_DIR" status --porcelain | grep .; then
    # Changes detected, commit and push
    git -C "$QUARTZ_DIR" add .
    git -C "$QUARTZ_DIR" commit -m "Update content $(date +"%Y-%m-%d %H:%M:%S")"
    git -C "$QUARTZ_DIR" push
    echo "Changes pushed to Quartz repository."
else
    echo "No changes detected in Quartz repository."
fi

# Build step is commented out as in your script
# cd "$QUARTZ_DIR" && npx quartz build

echo "Sync complete."
