# Lecture 19: Putting it all together using `snakemake`

This last session will walk through a realistic example of analyzing RNA-Seq data that will use several of the tools that we learned in the previous 18 lectures.
We will combine these tools using the [Snakemake](https://snakemake.readthedocs.io/en/stable/index.html#) workflow management system.


## Learning objectives

After this session, you should be able to:
- create an annotations file for an RNA-Seq experiment that reflects the experiment design.
- outline a workflow for analyzing data from a new RNA-Seq experiment.
- implement the workflow as a `Snakefile` using command line tools and R scripts.
- Idnetify differentially expressed genes from RNA-Seq data.

## Class materials

- RNA-Seq experiment annotations: <sample_annotations.tsv>
- Snakemake workflow for RNA-Seq analysis: <Snakefile>
- Script for counting RNA-Seq reads for each gene: <calculate_gene_counts.R>
- Rmarkdown file for identifying differentially expressed genes: <identify_differentially_expressed_genes.Rmd>
