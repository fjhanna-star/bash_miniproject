#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Error: Please provide a search term"
    echo "Usage: ./search_proteins.sh kinase"
    exit 1
fi

search_term=$1
echo "Searching for proteins containing: $search_term"

# Search in protein descriptions (case insensitive)
grep -i "$search_term" Data/humchrx.txt > results/protein_search_results.txt

count=$(wc -l < results/protein_search_results.txt)
echo "Found $count proteins matching '$search_term'"
echo "Results saved to results/protein_search_results.txt"

# Show first few matches
echo "First 3 matches:"
head -3 results/protein_search_results.txt
