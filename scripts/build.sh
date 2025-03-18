#!/bin/bash
# Package .deb
# flutter_distributor package --platform linux --targets deb

clear

# Create a temporary directory on a Linux file system (e.g., /tmp)
SOURCE_DIR=$(pwd)
TEMP_DIR=$(mktemp -d)
DEST_DIR="$TEMP_DIR/flutter-project"
FINAL_DIR="$SOURCE_DIR"
# flutter clean
# Copy the project to the temporary directory
# cp -R . $DEST_DIR
# Use git to list all tracked & unignored files and copy them
git ls-files --others --cached --exclude-standard | rsync -av --files-from=- "$SOURCE_DIR/" "$DEST_DIR/"

echo "✅ Files copied to: $DEST_DIR"

# exit 0
# Change directory to the copied project
cd $DEST_DIR

# Run your flutter_distributor command
flutter_distributor package --platform linux --targets deb --skip-clean

# Optionally, copy the generated package back to your NTFS partition
# cp path/to/generated.deb /mnt/your-ntfs-project-path/

cp -R "$DEST_DIR/dist" "$FINAL_DIR"
echo "Saved at $FINAL_DIR/dist"
# Clean up
rm -rf $DEST_DIR
