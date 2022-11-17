# Lectures 18: Introduction to single-cell RNA-seq

In this lecture, we will take analyze a single-cell RNA-seq data using [scanpy](https://scanpy.readthedocs.io/en/stable/). The lecture will introduce `Anndata` objects, plotting and interacting witn single-cell RNA-seq, QC and analysis of data and as time permits, batch correction. 

We will use two PBMC datasets made available by 10X Genomics. Please download the following to the `data/` directory:
- Pre-analyzed data from [here](https://drive.google.com/file/d/1Wfd6jHnLFsOBheMfzgryRjYei0xGJsFN/view?usp=share_link). 
- Count matrix from  [here](https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_10k_protein_v3/pbmc_10k_protein_v3_filtered_feature_bc_matrix.h5). See [here](https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.0.0/pbmc_10k_protein_v3) for description of the data.
- A second count matrix of PBMCs to be used for batch-correction. Download from [here](https://cf.10xgenomics.com/samples/cell-exp/6.1.0/10k_PBMC_3p_nextgem_Chromium_X/10k_PBMC_3p_nextgem_Chromium_X_filtered_feature_bc_matrix.h5) and a description is available [here](https://cf.10xgenomics.com/samples/cell-exp/6.1.0/10k_PBMC_3p_nextgem_Chromium_X/10k_PBMC_3p_nextgem_Chromium_X_web_summary.html).


## Learning Objectives 
- Insights about why and how of single-cell RNA-seq.
- Learn how to process and analyze single-cell RNA-seq datasets. 
- Single-cell RNA-seq data is highly interactive. Learn different ways to visualize and interact with the data.
- Perform batch correction of scRNA-seq data.
- Understand the reasoning behind various QC, preprocessing and analysis approaches for scRNA-seq. 

## Class materials
- The lecture slides are available [here](Lecture18_singlecell_RNAseq_slides.pdf)
- The Jupyter notebook which will be used for the lecture are available here slides are available [Lecture18-scRNA-seq-analysis.ipynb](Lecture18-scRNA-seq-analysis.ipynb). If you have difficulty performing a `git pull` to obtain the materials for this class, it is likely because you have a conflict between `Lecture19-scRNA-seq-analysis.ipynb)` and the version in the public GitHub repo. You can resolve this by making a copy of that markdown (naming it something different, like `my_Lecture19-scRNA-seq-analysis.ipynb)`) and then discarding changes to the original markdown file. 

### Data Download
Download the following datasets and copy it a folder called `data/`
- Pre-analyzed data from [here](https://drive.google.com/file/d/1Wfd6jHnLFsOBheMfzgryRjYei0xGJsFN/view?usp=share_link). 
- Count matrix from  [here](https://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_10k_protein_v3/pbmc_10k_protein_v3_filtered_feature_bc_matrix.h5). See [here](https://support.10xgenomics.com/single-cell-gene-expression/datasets/3.0.0/pbmc_10k_protein_v3) for description of the data.
- A second count matrix of PBMCs to be used for batch-correction. Download from [here](https://cf.10xgenomics.com/samples/cell-exp/6.1.0/10k_PBMC_3p_nextgem_Chromium_X/10k_PBMC_3p_nextgem_Chromium_X_filtered_feature_bc_matrix.h5) and a description is available [here](https://cf.10xgenomics.com/samples/cell-exp/6.1.0/10k_PBMC_3p_nextgem_Chromium_X/10k_PBMC_3p_nextgem_Chromium_X_web_summary.html).

### Environment setup
Please use the environment `tfcb2022_rna` which has all dependencies installed.

```
