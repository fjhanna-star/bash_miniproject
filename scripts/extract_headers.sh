#!/bin/bash
echo "Extracting sequence identifiers..."
grep ">" Data/IP-004_S38_L001_scaffolds.fasta | cut -d'_' -f1,2 > results/sequence_ids.txt
count=$(wc -l < results/sequence_ids.txt)
echo "Extracted $count sequence identifiers to results/sequence_ids.txt"
