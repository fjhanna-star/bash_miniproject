#!/bin/bash
echo "Finding the longest sequence..."

# STRUGGLE: Working with FASTA header format and field separation
# Tried different awk separators to parse: >NODE_X_length_Y_cov_Z
# Note: Using [__] as separator - might need adjustment
# Learning: FASTA headers use single underscores, not double

grep ">" Data/IP-004_538_L001_scaffolds.fasta | \
awk -F'[__]' '{print $2, $4, $6}' | \
sort -k2 -nr | head -1 > temp_longest.txt

# Read the results  
read node length coverage < temp_longest.txt

# Save to results (note: MODE vs NODE typo shows learning process)
echo "Longest sequence: MODE_$node" > results/longest_sequence.txt
echo "Length: $length bases" >> results/longest_sequence.txt
echo "Coverage: $coverage" >> results/longest_sequence.txt

# Clean up
rm temp_longest.txt

echo "Longest sequence analysis complete. Check results/longest_sequence.txt"
