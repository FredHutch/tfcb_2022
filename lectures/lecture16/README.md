# Lecture 16: Genomic data in R

This lecture will unite the last lecture's content on genomic analysis with our previous coding in R. The packages we'll use this week are from [Bioconductor](http://bioconductor.org), a collection of software specifically designed for genomic analysis in R.

## Lecture Notes
[Lecture slides](./MCB536_lecture16_GenomicDataInR.pdf)

## Learning objectives

Genome variant analysis (Background)
- Types of genomic variation
- Tools to predict genomic variations
- Learn the common file formats for variation data
- Databases and online resources for human variation data

Genomic Data (hands-on tutorials)
- Use Bioconductor packages to work with genomic data in R
- Load, inspect, and query genomic data (BED/SEG, BAM, VCF files)
- Identify and annotate genomic variants

## Before the class

We will be working through some tutorials directly on your laptop using R Studio.

### 1. Install the R packages

- Tutorial is tested for R-4.0.3
- You should run [this script in VSCode](../../software/genomic_data.R) to ensure all Bioconductor packages are installed.
    ```
    ## start R session ##
    R
    ## run this command within R session ##
    source("../../software/genomic_data.R")
    ```
- This script will install the following packages:
  - `Rsamtools`: querying BAM files
  - `VariantAnnotation`: reading VCF files
  - `GenomicRanges`: manipulating genomic data
  - `plyranges`: fast & easy tool for mannipulating GRanges

### 2. Class materials: R Markdown files containing the tutorials

- If you have not done so already, update your local copy of the class repository from GitHub. You should have a directory (`lecture16`) containing the following three RMarkdown tutorials:
  - [Lecture16_GenomicData.Rmd](Lecture16_GenomicData.Rmd): store genomic data as objects, assess genomic ranges, apply operations on genomic data
  - [Lecture16_Rsamtools.Rmd](Lecture16_Rsamtools.Rmd): load and query sequencing data; compute “pile-up” statistics at genomic loci to identify genomic variants
  - [Lecture16_VariantCalls.Rmd](Lecture16_VariantCalls.Rmd): load and assess variant (vcf) data

### 3. Install R Extension in VSCode 

- `Extensions` (on left panel) > Type in search bar: `"R Extension"` > Select `R Extension for Visual Studio Code` by Yuki Ueda
- The extension page should look something like this: https://marketplace.visualstudio.com/items?itemName=Ikuyadeu.r 

### 4. Install `pandoc` 

- To knit R Markdown files, you'll need the R Extension as well as `pandoc`.
- Install `pandoc` outside of VScode by downloading the installer here: https://pandoc.org/installing.html 
  
### 5. Class materials: Genomic and sequencing data for the tutorials

- Please download all data files found in [this folder](https://www.dropbox.com/sh/zoitjnobgp7l7c2/AABBIpTQcNA4lWYOFnV5dlMKa?dl=0) and add them to your `lecture16` directory. The files should have the following filenames:
  - `BRCA.genome_wide_snp_6_broad_Level_3_scna.seg`
  - `BRCA_IDC_cfDNA.bam`
  - `BRCA_IDC_cfDNA.bam.bai`
  - `GIAB_highconf_v.3.3.2.vcf.gz` (if this file was automatically uncompressed on your computer, resulting in a file named `GIAB_highconf_v.3.3.2.vcf`, look in your Trash folder to find the original file ending in `gz`)
  - `GIAB_highconf_v.3.3.2.vcf.gz.tbi`
