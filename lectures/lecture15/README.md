# Lecture 15: Genomic data in R

This lecture will unite the last lecture's content on genomic analysis with our previous coding in R. The packages we'll use this week are from [Bioconductor](http://bioconductor.org), a collection of software specifically designed for genomic analysis in R.

## Lecture Notes
[Lecture slides](./MCB536_lecture15_GenomicDataInR.pdf)

## Learning objectives

Genome variant analysis (Background)
- Types of genomic variation
- Tools to predict genomic variations
- Learn the common file formats for variation data
- Databases and online resources for human variation data

Genomic Data (hands-on tutorials)
- Use Bioconductor packages to work with genomic data in R
- Load, inspect, and query genomic data (BED/SEG, VCF files)
- Identify and annotate genomic variants

## Before the class

We will be working through some tutorials directly on your laptop using R. 

### 1. Install the R packages

- Tutorial is tested for R-4.0.3
- You will need the Docker container containing the correct version of R and the required R packages already installed.
- This these packages:
  - `GenomicRanges`: manipulating genomic data
  - `plyranges`: fast & easy tool for mannipulating GRanges
  
    ```
    ## start R session ##
    R
    ## check that these packages can be loaded successfully ##
    library(tidyverse)
    library(GenomicRanges)
    library(plyranges)
    ```
### 2. Class materials: R Markdown and Jupyter Notebook files containing the tutorials

- If you have not done so already, update your local copy of the class repository from GitHub. You should have a directory (`lecture15`) containing the following three R tutorials:
  - R Markdown files
    - [Lecture15_GenomicData.Rmd](Lecture15_GenomicData.Rmd): store genomic data as objects, assess genomic ranges, apply operations on genomic data
    - [Lecture15_VariantCalls.Rmd](Lecture15_VariantCalls.Rmd): load and assess variant (vcf) data
  - Jupyter Notebook files
    - [Lecture15_GenomicData.ipynb](Lecture15_GenomicData.ipynb)
    - [Lecture15_VariantCalls.ipynb](Lecture15_VariantCalls.ipynb)
  
### 3. Class materials: Genomic and sequencing data for the tutorials

- Please download all data files found in [this folder](https://drive.google.com/drive/folders/13jM29nhzELyThKQXl27MrRXxbziVunQr?usp=sharing) and add them to your `lecture15` directory. The files should have the following filenames:
  - `BRCA.genome_wide_snp_6_broad_Level_3_scna.seg`
  - `GIAB_highconf_v.3.3.2.vcf.gz` (if this file was automatically uncompressed on your computer, resulting in a file named `GIAB_highconf_v.3.3.2.vcf`, look in your Trash folder to find the original file ending in `gz`)
  - `GIAB_highconf_v.3.3.2.vcf.gz.tbi`
