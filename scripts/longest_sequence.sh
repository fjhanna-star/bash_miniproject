#!/bin/bash
echo "Finding the longest sequence..."

# Extract headers with length and find the longest
grep ">" Data/IP-004_S38_L001_scaffolds.fasta | \
awk -F'[_=]' '{print $2, $4, $6}' | \
sort -k2 -nr | head -1 > temp_longest.txt

# Read the results
read node length coverage < temp_longest.txt

# Save to results
echo "Longest sequence: NODE_$node" > results/longest_sequence.txt
echo "Length: $length bases" >> results/longest_sequence.txt
echo "Coverage: $coverage" >> results/longest_sequence.txt

# Clean up
rm temp_longest.txt

echo "Longest sequence analysis complete. Check results/longest_sequence.txt"
