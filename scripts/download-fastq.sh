#!/bin/bash

# Set some useful settings to handle errors
set -euo pipefail

# Define file paths, file names, and URLs
FASTQ_R1="SRR11518889_1.fastq.gz"
FASTQ_R2="SRR11518889_2.fastq.gz"
FASTQ_URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/SRR11518889"

DATA_DIR="../data/raw/fastq/SRP255885"
mkdir -p ${DATA_DIR}

#### Process the R1 file ####
echo "Downloading the R1 file"

# Download
# -O: keep same file name as on internet
# -s: don't print status bar or errors
# -S: but actually want to still print errors as/if they occur 
curl -sSO ${FASTQ_URL}/${FASTQ_R1}

# Move the file
mv ${FASTQ_R1} ${DATA_DIR}/

echo "The R1 file has this many lines:"

# Print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l


#### Process the R2 file ####
echo "Downloading the R2 file"

# Download
curl -sSO ${FASTQ_URL}/${FASTQ_R2}

# Move the file
mv ${FASTQ_R2} ${DATA_DIR}/

echo "The R2 file has this many lines:"

# Print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l