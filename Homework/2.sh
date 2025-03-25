#!/bin/bash

# Prompt user for CSV file name
echo "Enter the name of the CSV file (including .csv extension): "
read CSV_FILE

# Check if file exists
if [ ! -f "$CSV_FILE" ]; then
    echo "Error: File '$CSV_FILE' not found!"
    exit 1
fi

# Generate output VCF file name
VCF_FILE="${CSV_FILE%.csv}.vcf"

# Clear the VCF file if it exists
> "$VCF_FILE"

# Read CSV and convert to VCF
while IFS=, read -r NAME PHONE EMAIL; do
    # Trim whitespace and check if any field is empty
    NAME=$(echo "$NAME" | xargs)
    PHONE=$(echo "$PHONE" | xargs)
    EMAIL=$(echo "$EMAIL" | xargs)

    if [[ -n "$NAME" && -n "$PHONE" && -n "$EMAIL" ]]; then
        echo "BEGIN:VCARD" >> "$VCF_FILE"
        echo "VERSION:3.0" >> "$VCF_FILE"
        echo "FN:$NAME" >> "$VCF_FILE"
        echo "TEL:$PHONE" >> "$VCF_FILE"
        echo "EMAIL:$EMAIL" >> "$VCF_FILE"
        echo "END:VCARD" >> "$VCF_FILE"
    fi
done < <(tail -n +2 "$CSV_FILE")  # Skip header line

echo "Conversion completed. VCF file saved as '$VCF_FILE'"
