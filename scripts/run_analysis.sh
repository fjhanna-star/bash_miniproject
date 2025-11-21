#!/bin/bash
# Master analysis script for genomic data
# Usage: ./run_analysis.sh /path/to/Data/

echo "=== Genomic Data Analysis ==="
echo "Started: $(date)"

# Check if data directory is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide data directory path"
    echo "Usage: ./run_analysis.sh /path/to/Data/"
    exit 1
fi

DATA_DIR=$1

# Check if data files exist
if [ ! -f "$DATA_DIR/IP-004_S38_L001_scaffolds.fasta" ]; then
    echo "Error: FASTA file not found in $DATA_DIR"
    exit 1
fi

if [ ! -f "$DATA_DIR/humchrx.txt" ]; then
    echo "Error: Protein file not found in $DATA_DIR"
    exit 1
fi

echo "Data directory: $DATA_DIR"
echo "Creating results directory..."
mkdir -p results

# Run FASTA analysis
echo "1. Analyzing FASTA sequences..."
./scripts/count_sequences.sh
./scripts/extract_headers.sh
./scripts/longest_sequence.sh

# Run sequence filtering
echo "2. Filtering sequences..."
./scripts/filter_by_length.sh 5000
./scripts/high_quality_scaffolds.sh

# Run protein analysis
echo "3. Analyzing protein database..."
./scripts/count_proteins.sh
./scripts/extract_genes.sh
./scripts/search_proteins.sh kinase

# Generate summary
echo "4. Generating analysis summary..."
echo "=== ANALYSIS SUMMARY ===" > results/analysis_summary.txt
echo "Date: $(date)" >> results/analysis_summary.txt
echo "Total sequences: $(cat results/sequence_count.txt)" >> results/analysis_summary.txt
echo "High-quality scaffolds: $(wc -l < results/high_quality_scaffolds.txt)" >> results/analysis_summary.txt
echo "Total protein entries: $(cat results/protein_count.txt)" >> results/analysis_summary.txt

echo "Analysis complete! Check results/analysis_summary.txt"
