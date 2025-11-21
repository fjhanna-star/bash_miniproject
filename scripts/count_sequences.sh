#!/bin/bash
echo "Counting sequences in FASTA file..."
count=$(grep -c ">" Data/IP-004_S38_L001_scaffolds.fasta)
echo $count > results/sequence_count.txt
echo "Found $count sequences. Saved to results/sequence_count.txt"
