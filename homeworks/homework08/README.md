# Homework 8: Single-cell RNA-seq analysis

The goal of the homework is to analyze a single-cell RNA-seq dataset derived from lung cancer patients. The data used in this homework is a subset of the data presented [here](https://pubmed.ncbi.nlm.nih.gov/34653364/).

The homework is a Jupyter notebook series of empty code-cells which you will need to update to generate the necessary outputs. The expected outputs are shown in many instances. Note that the umaps and clusters you will  identify might be slightly different to the outputs in the notebook due to random seeds used by `scanpy`.


## Data and environment
Download the following data into the `data` directory
1. RU675_RU682.h5ad available at [link](https://drive.google.com/file/d/1jvuL2zYNpmdX4OH6-mKT9OZuEkOuz74-/view?usp=share_link)
2. RU675_filtered.tar.gz at [link](https://drive.google.com/file/d/11yQoiVrOcFuvtlJ06bNErlOTCsnnlWM5/view?usp=share_link). Untar this file after downloading.
The conda environment that you built for the Lectures 18 and 19 will work for the Homework too. 

The first part of the homework will use the data from one patient available at `data/RU675_filtered`. 
The batch correction section of the algorithm will make use of the data in the preprocessed anndata object `data/RU675_RU682.h5ad`. 

## Submission
Make sure your entire notebook is executable, and has been executed in order (in the "Cell" menu, select "Run All"). Submit the ipynb notebook as well as an html or pdf version of your solution. The notebook can be exported to html or pdf using the `Export` action on the VSCode toolbar.

