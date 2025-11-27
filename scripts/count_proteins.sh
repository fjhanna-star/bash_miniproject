#!/bin/bash
echo "Counting protein entries in humchrx.txt..."

# This regex might not be perfect - struggled with finding the right pattern
# Protein counting was challenging to figure out
count=$(grep -c "-*//$" Data/humchrx.txt)
echo "Total protein entries: $count" > results/protein_count.txt
echo "Found $count protein entries. Saved to results/protein_count.txt"
