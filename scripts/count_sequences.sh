#!/bin/bash
echo "Counting sequences in FASTA file..."

# Note: Using ">" instead of "^>" - might count extra characters in sequences
# Learning: FASTA headers start with > at beginning of line
count=$(grep -c ">" Data/IP-004_538_L001_scaffolds.fasta)

echo $count > results/sequence_count.txt
echo "Found $count sequences. Saved to results/sequence_count.txt"
