# Lecture 19: Introduction to single-cell RNA-seq continued

In this lecture, we will take analyze a single-cell RNA-seq data using [scanpy](https://scanpy.readthedocs.io/en/stable/). The lecture will introduce `Anndata` objects, plotting and interacting witn single-cell RNA-seq, QC and analysis of data and as time permits, batch correction. 

We will use two PBMC datasets made available by 10X Genomics. Please download the following to the `data/` directory:
- Pre-analyzed data from [here](https://drive.google.com/file/d/1haywzdKgexv0Mm5KMDfJMVjI0PLaSy5b/view?usp=sharing). 
- Count matrix from  [here](https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_10k_protein_v3/pbmc_10k_protein_v3_filtered_feature_bc_matrix.h5). See [here](https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.0.0/pbmc_10k_protein_v3) for description of the data.
- A second count matrix of PBMCs to be used for batch-correction. Download from [here](https://cf.10xgenomics.com/samples/cell-exp/6.1.0/10k_PBMC_3p_nextgem_Chromium_X/10k_PBMC_3p_nextgem_Chromium_X_filtered_feature_bc_matrix.h5) and a description is available [here](https://cf.10xgenomics.com/samples/cell-exp/6.1.0/10k_PBMC_3p_nextgem_Chromium_X/10k_PBMC_3p_nextgem_Chromium_X_web_summary.html).

## Learning Objectives 
- Learn how to process and analyze single-cell RNA-seq datasets. 
- Single-cell RNA-seq data is highly interactive. Learn different ways to visualize and interact with the data.
- Perform batch correction of scRNA-seq data.

## Class materials
- The Jupyter notebook which will be used for the lecture are available here slides are available [Lecture19-scRNA-seq-analysis.ipynb](Lecture19-scRNA-seq-analysis.ipynb). If you have difficulty performing a `git pull` to obtain the materials for this class, it is likely because you have a conflict between `Lecture19-scRNA-seq-analysis.ipynb)` and the version in the public GitHub repo. You can resolve this by making a copy of that markdown (naming it something different, like `my_Lecture19-scRNA-seq-analysis.ipynb)`) and then discarding changes to the original markdown file. 
- Pre-analyzed data from [here](https://drive.google.com/file/d/1haywzdKgexv0Mm5KMDfJMVjI0PLaSy5b/view?usp=sharing). 
- Count matrix from  [here](https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_10k_protein_v3/pbmc_10k_protein_v3_filtered_feature_bc_matrix.h5). See [here](https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.0.0/pbmc_10k_protein_v3) for description of the data.
- A second count matrix of PBMCs to be used for batch-correction. Download from [here](https://cf.10xgenomics.com/samples/cell-exp/6.1.0/10k_PBMC_3p_nextgem_Chromium_X/10k_PBMC_3p_nextgem_Chromium_X_filtered_feature_bc_matrix.h5) and a description is available [here](https://cf.10xgenomics.com/samples/cell-exp/6.1.0/10k_PBMC_3p_nextgem_Chromium_X/10k_PBMC_3p_nextgem_Chromium_X_web_summary.html).


## Class preparation
The code for Lectures 18 and 19 has been tested using Python 3.8. Use of [`conda`](https://docs.conda.io/en/latest/miniconda.html) to install and maintain python versions and packages is highly recommended. Please install the following packages and reach out if you have issues installing:
- [scanpy](https://scanpy.readthedocs.io/en/stable/) 
- [cellxgene](https://github.com/chanzuckerberg/cellxgene-documentation/blob/main/README.md)
- [harmonypy](https://github.com/slowkow/harmonypy)
- The latest version of `umap`(0.5.2) generates rather funny results with default parameters. Overwrite your installation results to the previous version using 
`pip install umap-learn==0.5.1` in your conda environment.

