#!/bin/bash
# Check if minimum length is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide minimum length as argument"
    echo "Usage: ./filter_by_length.sh 5000"
    exit 1
fi

min_length=$1
echo "Filtering sequences with length >= $min_length bases..."

# Filter sequences by length
grep ">" Data/IP-004_S38_L001_scaffolds.fasta | \
awk -F'[_=]' -v min_len=$min_length '$4 >= min_len' > results/filtered_sequences.txt

count=$(wc -l < results/filtered_sequences.txt)
echo "Found $count sequences with length >= $min_length bases"

