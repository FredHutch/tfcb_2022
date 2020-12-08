# for importing annotations
library(rtracklayer)
# for handling htseq alignments
library(GenomicAlignments)
# for tidy operations on Bioconductor objects
library(plyranges)
library(tidyverse)

args <- commandArgs(trailingOnly=TRUE)
input_file <- args[1]
output_file <- args[2]
annotations_file <- args[3]

# input_file <- './data/alignments/cd34_sh_luc_rna_1.bam'
# output_file <- './data/gene_counts/cd34_sh_luc_rna_1.tsv.gz'
# annotations_file <- '/fh/fast/subramaniam_a/db/rasi/genomes/human/hg38/gencode/annotations/gencode.v32.annotation.gff3.gz'


genes <- import.gff3(annotations_file) %>% 
  filter(type == "gene", gene_type == "protein_coding") %>% 
  select("gene_name") %>% 
  as_tibble() %>% 
  mutate(seqnames = str_replace(seqnames, "chr", "")) %>% 
  GRanges() %>% 
  print()

# skip secondary alignments
param <- ScanBamParam(flag=scanBamFlag(isSecondaryAlignment=FALSE))
aln <- readGAlignments(input_file, param = param) %>% 
  print()
counts <- summarizeOverlaps(genes, aln, ignore.strand = T)

count_df <- rowData(counts) %>% 
  as_tibble() %>% 
  mutate(count = assay(counts)[,1]) %>% 
  arrange(desc(count)) %>% 
  write_tsv(output_file)