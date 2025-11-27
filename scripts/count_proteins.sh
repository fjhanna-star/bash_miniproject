#!/bin/bash
echo "Counting protein entries in humchrx.txt..."

# Count non-empty lines (assuming each protein entry is one line)
count=$(grep -c "^[A-Z0-9]" Data/humchrx.txt)
echo "Total protein entries: $count" > results/protein_count.txt
echo "Found $count protein entries. Saved to results/protein_count.txt"
