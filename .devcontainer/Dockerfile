# base conda container
FROM continuumio/miniconda3:4.10.3

# Install mamba installer for quick conda installations
RUN conda install -y mamba -c conda-forge
# Install standard python packages in base conda environment
RUN mamba install -y -c conda-forge -c bioconda \
    jupyter \
    pandas \
    matplotlib \
    ipykernel \
    biopython \
    pysam \
    plotnine

# Install Rasi's R conda environment named 'tidy'
RUN mamba create -y -n tidy
# tidyverse and R jupyter kernel
RUN mamba install -y -n tidy -c conda-forge \
    r-tidyverse \
    r-janitor \
    r-irkernel \
    r-plotrix
# bioconductor packages used by Rasi
RUN mamba install -y -n tidy -c bioconda -c conda-forge \
  bioconductor-plyranges \
  bioconductor-genomicfeatures \
  bioconductor-rtracklayer \
  bioconductor-bsgenome.hsapiens.ucsc.hg38    