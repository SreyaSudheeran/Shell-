#!/bin/bash

# Check if the user provided a file and a pattern
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <filename> <pattern>"
    exit 1
fi

FILENAME="$1"
PATTERN="$2"

# Read the file line by line
while IFS= read -r line; do
    # Split the line into fields using space as delimiter
    # Change IFS if the file uses a different delimiter (e.g., IFS=',' for CSV)
    IFS=' ' read -ra FIELDS <<< "$line"

    # Iterate through fields and check for pattern match
    for field in "${FIELDS[@]}"; do
        if [[ "$field" == *"$PATTERN"* ]]; then
            echo "🔍 Match found: $line"
            break
        fi
    done
done < "$FILENAME"
