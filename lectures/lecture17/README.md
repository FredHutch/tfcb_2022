# Lecture 17: Introduction to bulk RNA-seq analysis

We will apply all our learnings to undertake analysis of RNA-seq data. In this lecture, we will use R/Bioconductor to perform bulk RNA-seq analysis and in the next two lectures we will Python to perform single-cell RNA-seq analysis. 

This lecture will begin with a introduction to RNA-seq and the steps in RNA-seq analysis. We will then undertake a hands-on excercise using R and Bioconductor tools to analyze RNA-seq data generated using Glioblastoma Multiforme patient samples.

## Learning Objectives 
- Bulk RNA-seq data QC and generating count matrices from alignment files
- Differential gene expression analysis
- Visualization of bulk RNA-seq data

## Class materials
- The lecture slides are available [here](Lecture17_bulk_RNAseq_slides.pdf)

- The R Markdown file which will be using for this lecture is available at (Lecture17.Rmd)[Lecture17.Rmd]. If you have difficulty performing a `git pull` to obtain the materials for this class, it is likely because you have a conflict between `Lecture17.Rmd)` and the version in the public GitHub repo. You can resolve this by making a copy of that markdown (naming it something different, like `my_Lecture17.Rmd)`) and then discarding changes to the original markdown file. The output of the markdown is available at (Lecture17.html)[Lecture17.html]

- The bam files for generation of count matrices are available [here](https://drive.google.com/file/d/1VWvwatiE4WbMpocCm3W1rdCtakkqdAI6/view?usp=sharing) and the Glioblastoma patient data is available [here](https://drive.google.com/file/d/1NcGZcyhpJ1QxUGL4aYpe7KsPLUXfQ9Kd/view?usp=sharing). Please download (and unzip the files) to the `data` folder. 

## Class preparation
The code has been tested with R 4.0.3. Install the following R modules before the class. Please reach out if you have issues installing:
- rtracklyer
- Rsamtools
- GenomicAlignments
- DESeq2
- EnhancedVolcano
- goseq
- pheatmap
- RColorBrewer

The packages can be installed in one command using:
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

packages <- c('rtracklayer', 'Rsamtools', 'GenomicAlignments', 'DESeq2', 'EnhancedVolcano', 'goseq', 'pheatmap', 'RColorBrewer')
BiocManager::install(packages)
```

