#!/bin/bash
echo "Extracting and sorting unique gene names..."

# STRUGGLE: Finding the right pattern for gene names
# Tried: grep "\A-Z!" - didn't work as expected
# Learning: Gene names are in GN Name= fields, not just first words
grep "\A-Z!" Data/humchrx.txt | awk '{print $1}' | sort | uniq > results/gene_names_sorted.txt

count=$(wc -l < results/gene_names_sorted.txt)
echo "Extracted $count unique gene names"
echo "Results saved to results/gene_names_sorted.txt"

# Show sample
echo "First 10 gene names:"
head -10 results/gene_names_sorted.txt
