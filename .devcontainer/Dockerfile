# base conda container
FROM continuumio/miniconda3:4.12.0

# Install mamba installer for quick conda installations
RUN conda install -y mamba -c conda-forge
# Install standard python packages in base conda environment
RUN mamba install -y -c conda-forge -c bioconda \
    jupyter \
    pandas \
    matplotlib \
    ipykernel \
    biopython \
    scikit-learn \
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
# Make R kernel visible to Jupyter
RUN /opt/conda/envs/tidy/bin/R -s -e "IRkernel::installspec(sys_prefix = T)"

# Create new conda environment for Manu Setty's lectures
RUN conda create -n tfcb2022_rna -c conda-forge -c bioconda

# Scanpy installation
RUN mamba install -y -n tfcb2022_rna seaborn \
  scikit-learn \
  statsmodels \
  numba \
  pytables
RUN mamba install -y -n tfcb2022_rna -c conda-forge python-igraph leidenalg
RUN conda run -n tfcb2022_rna pip install scanpy

# cellxgene installation
RUN conda run -n tfcb2022_rna pip install cellxgene

# harmonypy installation
RUN conda run -n tfcb2022_rna pip install harmonypy

# umap version
RUN conda run -n tfcb2022_rna pip install umap-learn==0.5.1

# jupyter/ipython installation
RUN mamba install -y -n tfcb2022_rna -c conda-forge ipykernel

# install for Gavin Ha's lectures
RUN mamba install -y -n tidy -c bioconda bioconductor-variantannotation

RUN mamba create -n samtools
RUN mamba install -y -n samtools -c bioconda -c conda-forge samtools=1.16.1
RUN mamba create -n picard
RUN mamba install -y -n picard -c bioconda -c conda-forge picard-slim=2.21.6