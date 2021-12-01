# Lecture 17: Introduction to bulk RNA-seq analysis

We will apply all our learnings to undertake analysis of RNA-seq data. In this lecture, we will use R/Bioconductor to perform bulk RNA-seq analysis and in the next two lectures we will Python to perform single-cell RNA-seq analysis. 

This lecture will begin with a introduction to RNA-seq and the steps in RNA-seq analysis. We will then undertake a hands-on excercise using R and Bioconductor tools to analyze RNA-seq data generated using Glioblastoma Multiforme patient samples.

## Learning Objectives 
- Bulk RNA-seq data QC and generating count matrices from alignment files
- Differential gene expression analysis
- Visualization of bulk RNA-seq data

## Class materials
- The lecture slides are available [here](Lecture17_bulk_RNAseq_slides.pdf)

- The Notebook which will be using for this lecture is available at [Lecture17.ipynb](Lecture17.ipynb). If you have difficulty performing a `git pull` to obtain the materials for this class, it is likely because you have a conflict between `Lecture17.ipynb)` and the version in the public GitHub repo. You can resolve this by making a copy of that markdown (naming it something different, like `my_Lecture17.ipynb)`) and then discarding changes to the original markdown file. 

- The bam files for generation of count matrices are available [here](https://drive.google.com/file/d/1VWvwatiE4WbMpocCm3W1rdCtakkqdAI6/view?usp=sharing) and the Glioblastoma patient data is available [here](https://drive.google.com/file/d/1NcGZcyhpJ1QxUGL4aYpe7KsPLUXfQ9Kd/view?usp=sharing). Please download (and unzip the files) to the `data` folder. 

## Class preparation

### Environment set up
We will create a new conda environment for the RNA-seq lectures

```
# Create new conda environment
conda create -n tfcb2021_rna r r-tidyverse r-irkernel bioconductor-plyranges bioconductor-genomicfeatures bioconductor-rtracklayer bioconductor-ggbio bioconductor-deseq2 bioconductor-enhancedvolcano   bioconductor-goseq r-pheatmap r-rcolorbrewer  bioconductor-org.hs.eg.db -c conda-forge -c bioconda

# Activate conda environment
conda activate tfcb2021_rna

```

Follow the instructions [here](https://github.com/FredHutch/tfcb_2021/blob/main/software/README.md#getting-started-with-using-terminalpythonr-in-vscode) to setup the new conda environment in VSCode. Repeated below for convenience.
1. Open the Terminal window in VSCode (Terminal > New Terminal) and activate the `tfcb2021_rna` environment you previously created with `conda activate tfcb2021_rna`.
2. Type `which R` into Terminal to identify where the R interpreter is located in the environment (ex. `/usr/local/anaconda3/envs/tfcb2021_rna/bin/R`).
3. Now switch back to the base environment with `conda activate base`. 
4. Type the location identified in Step 2 (ex. `/usr/local/anaconda3/envs/tfcb2021_rna/bin/R`). This should start the R interpreter.
5. In the R interpreter, type `IRkernel::installspec()` after the >. This should install kernelspec in the right location.

### Data files
- The bam files for generation of count matrices are available [here](https://drive.google.com/file/d/1VWvwatiE4WbMpocCm3W1rdCtakkqdAI6/view?usp=sharing) and the Glioblastoma patient data is available [here](https://drive.google.com/file/d/1NcGZcyhpJ1QxUGL4aYpe7KsPLUXfQ9Kd/view?usp=sharing). Please download (and unzip the files) to the `data` folder. 




