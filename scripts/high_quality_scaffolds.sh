#!/bin/bash
echo "Finding high-quality scaffolds (length >= 10000 and coverage >= 5.0)..."

# Filter for high quality scaffolds
grep ">" Data/IP-004_S38_L001_scaffolds.fasta | \
awk -F'[_=]' '$4 >= 10000 && $6 >= 5.0' > results/high_quality_scaffolds.txt

count=$(wc -l < results/high_quality_scaffolds.txt)
echo "Found $count high-quality scaffolds"
echo "Results saved to results/high_quality_scaffolds.txt"
