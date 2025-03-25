#!/bin/bash

# Prompt user for filename
echo "Enter the name of the compressed file: "
read FILE

# Check if filename is provided
if [ -z "$FILE" ]; then
    echo "Error: No file provided. Exiting."
    exit 1
fi

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

# Extract based on file extension
case "$FILE" in
    *.tar.gz|*.tgz)  tar -xvzf "$FILE"  ;;   # Extract tar.gz/tgz
    *.tar.bz2|*.tbz2) tar -xvjf "$FILE"  ;;   # Extract tar.bz2/tbz2
    *.tar.xz|*.txz)  tar -xvJf "$FILE"  ;;   # Extract tar.xz/txz
    *.tar)           tar -xvf "$FILE"   ;;   # Extract tar
    *.zip)           unzip "$FILE"      ;;   # Extract zip
    *.gz)            gunzip "$FILE"     ;;   # Extract gz
    *.bz2)           bunzip2 "$FILE"    ;;   # Extract bz2
    *.xz)            unxz "$FILE"       ;;   # Extract xz
    *)               echo "Unsupported file format: $FILE"; exit 1 ;; # Error for unsupported files
esac

echo "Extraction completed."
