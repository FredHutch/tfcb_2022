#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH -o job_%j.out
#SBATCH -e job_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=EMAIL
set -eu
set -o pipefail

#### pre-processing RNAseq data ####

CHR22=/fh/fast/subramaniam_a/tfcb/chr22

# requires prior configuration of fastq-dump

ml SRA-Toolkit FastQC cutadapt HISAT2 SAMtools

# prepare directory
mkdir ~/lecture18_rnaseq
cd lecture18_rnaseq
mkdir -p data/fastq data/trim alignments

# download data
fastq-dump SRR4450332 --gzip -O data/fastq/

# trim reads
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --minimum-length=22  -o data/trim/SRR4450332.fastq.gz data/fastq/SRR4450332.fastq.gz

# map reads
hisat2 -p 6 -x $CHR22/chr22 -U data/trim/SRR4450332.fastq.gz -S alignments/SRR4450332.sam

# convert output
samtools view -@ 6 -b alignments/SRR4450332.sam > alignments/SRR4450332.unsorted_bam
samtools sort -@ 6 alignments/SRR4450332.unsorted_bam > alignments/SRR4450332.bam
samtools index -@ 6 alignments/SRR4450332.bam

# extract mapping statistics
samtools stats alignments/SRR4450332.bam > alignments/SRR4450332.stats.tsv
