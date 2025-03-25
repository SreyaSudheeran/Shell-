#!/bin/bash

# Get the current directory
DIR="."

# List all files in the current directory, sort by size, and display results
echo "Sorting files by size in the current directory..."
find "$DIR" -maxdepth 1 -type f -exec du -h {} + | sort -h
