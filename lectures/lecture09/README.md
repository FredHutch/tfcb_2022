# Lecture 09: Practical analyses in Python

This lecture will continue using Python to perform biological sequence analyses.
In particular, we will use [Biopython](https://biopython.org) to read in sequencing data.
We will also briefly use [pandas](https://pandas.pydata.org/) for handling data frames, and [plotnine](https://plotnine.readthedocs.io/) for plotting.

## Learning objectives

After this lecture, you should be able to write Python functions:

- Parse barcodes from a real deep-sequencing experiment.

- Convert data into a data frame.

- Plot basic data.

## Class materials

- The content for this lecture is containing in the Jupyter notebook [lecture09.ipynb](lecture09.ipynb) located in this directory. The content from lecture 08 is duplicated here for your convenience. 

- If you have difficulty performing a `git pull` to obtain the materials for this class, it is likely because you have a conflict between `lecture09.ipynb` and the version in the public GitHub repo. You can resolve this by making a copy of that notebook (naming it something different, like `my_lecture09.ipynb`) and then discarding changes to the original notebook (you can do this in the GitHub Desktop app by going to the "Changes" tab, right clicking on this notebook, and selecting "Discard changes"). You should then be able to pull without issue.

- Please also install [plotnine](https://plotnine.readthedocs.io/) prior to class by opening Terminal (Mac) or Anaconda Prompt (Windows) and executing the following code: `conda install -c conda-forge plotnine` . Alternatively (on either platform), open Anaconda Navigator, go to "Environments" and click "not installed". Search for plotnine and click the box to install.
