# Lecture 18: Introduction to single-cell RNA-seq

In this lecture, we will discussin single-cell RNA-seq data analysis. We will start with a brief discussion of why we need scRNA-seq and experimental innovation. We will then spend some time interacting with a previously processed data using [cellxgene](https://github.com/chanzuckerberg/cellxgene). We will dig into the nuts and bolts of single-cell RNA-seq data preprocessing, analysis and batch correction. Method development for analysis of scRNA-seq data is a highly active area of research. This lecture will provide an introduction to the most commonly used approaches and provide pointers to alternative approaches and resources.

The dataset which we will interact with is made available by 10X Genomics. This profile peripheral blood mononuclear cells derived from a healthy donor. Details of the dataset are available [here](https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.0.0/pbmc_10k_protein_v3). Analyzed data is available to download from [here](https://drive.google.com/file/d/1haywzdKgexv0Mm5KMDfJMVjI0PLaSy5b/view?usp=sharing).

## Learning Objectives 
- Insights about why and how of single-cell RNA-seq.
- Interact with single-cell data using cellxgenes.
- Understand the reasoning behind various QC, preprocessing and analysis approaches for scRNA-seq. 

## Class materials
- The lecture slides are available [here](Lecture18_singlecell_RNAseq_slides.pdf)
- The anndata file which contains analyzed PBMC data is [here](https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.0.0/pbmc_10k_protein_v3). Analyzed data is available to download from [here](https://drive.google.com/file/d/1haywzdKgexv0Mm5KMDfJMVjI0PLaSy5b/view?usp=sharing). Please download this to the `data/` folder.


## Class preparation

## Class preparation

We will be using `cellxgene`, and `scanpy` for Lectures 18 and 19, and Homework 8. All the packages and dependencies can be installed using `conda`.

### Environment setup
Using `conda`, the following commands can be used to install all the required dependencies. 
```
# Activate conda environment
conda activate tfcb_2021_rna


# Scanpy installation 
conda install seaborn scikit-learn statsmodels numba pytables
conda install -c conda-forge python-igraph leidenalg
pip install scanpy


# cellxgene installation 
pip install cellxgene

# harmonypy installation
pip install harmonypy

# umap version
pip install umap-learn==0.5.1

# jupyter/ipython installation 
conda install -c conda-forge jupyterlab

```
