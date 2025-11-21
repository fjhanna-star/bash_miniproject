#!/bin/bash
echo "Extracting and sorting unique gene names..."
# Extract first word from data lines (gene names)
grep "^[A-Z]" Data/humchrx.txt | awk '{print $1}' | sort | uniq > results/gene_names_sorted.txt
count=$(wc -l < results/gene_names_sorted.txt)
echo "Extracted $count unique gene names"
echo "Results saved to results/gene_names_sorted.txt"
# Show sample
echo "First 10 gene names:"
head -10 results/gene_names_sorted.txt
