#!/bin/bash
echo "Counting protein entries in humchrx.txt..."

# Count protein entries (they end with // lines)
count=$(grep -c "^//$" Data/humchrx.txt)
echo "Total protein entries: $count" > results/protein_count.txt
echo "Found $count protein entries. Saved to results/protein_count.txt"
