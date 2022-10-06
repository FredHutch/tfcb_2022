---
controls: false
progress: false
enableMenu: false
enableChalkboard: false
enableTitleFooter: false
enableSearch: false
transition: slide
theme: night
customTheme: custom
---

# Lecture 3: Data and Project Management

## [Rasi Subramaniam](http://rasilab.fredhutch.org)

---

## Reminders

The homework assignment is available today (October 6) and is due October 13 at 3:20pm.

---

## Learning objectives

- Identify minimum requirements for a reproducible computational project
- Apply good practices for file organization 
- Use `tidy` principles for tabular (`spreadsheet`-style) data

---

## Outline

1. Elements of reproducibility
2. File organization
3. Tidy data

This class requires Microsoft Excel or LibreOffice Calc (for opening `.xlsx` or `.csv` files).

---

## Minimum elements for computational reproducibility

- *Annotated* data from experiments or simulations
- *Documented* code for data analyses
- *Defined* software environments
- *Standardized* organization of above 3 elements

<div style="font-size: 60%; text-align: left; margin-top: 50px;">

</div>

---

## 1 project = 1 GitHub repository

- Code
- Data*
- Lab notebook
- Presentations
- Manuscripts
- Grants & fellowships
- Discussion

<div style="font-size:50%;margin-top:50px">

\* Large datasets are stored in cloud (eg. [AWS S3](https://aws.amazon.com/s3/)) or public repositories (eg. [Zenodo](https://zenodo.org/), [SRA](https://www.ncbi.nlm.nih.gov/sra))

</div>

---

## Benefits of GitHub

- Version control (file history, track changes)
- Collaboration (branches, merging, issue comments, discussion)
- Project management tools (project board, issues, milestones, labels)

---

## Naming conventions

- Project repo: Short, descriptive, understandable
- File names: 
  - No caps
  - No spaces
  - Date format: `YYYY-MM-DD`
  - No version numbers or names such as `rasi_v20` (GitHub does this automatically)

---



### Reproducible science guidelines

My number one suggestion for reproducible research is to have:

**_One paper = One GitHub repo_**

Put both data and code into this repository. This should be all someone needs to reproduce your results.

_Digression to demo GitHub._

This has a few added benefits:

1. Versioning data and code through GitHub allows you to _collaborate_ with colleagues on code. It's extremely difficult to work on the same computational project otherwise. Even Dropbox is messy.

2. You're always working with future you. Having a single clean repo with documented readme makes it possible to come back to a project years later and actually get something done.

3. Other people can build off your work and we make science a better place.

I have a couple examples to look at here:

* My 2015 paper on global migration of influenza viruses: [github.com/blab/global-migration](https://github.com/blab/global-migration)
* [Sidney Bell's](https://bedford.io/team/sidney-bell/) 2018 paper on dengue evolutionary dynamics: [github.com/blab/dengue-antigenic-dynamics](https://github.com/blab/dengue-antigenic-dynamics)


Some things to notice:
* There is a top-level `README.md` (written in Markdown...) file that describes what the thing is, provides authors, provides a citation and link to the paper and gives an overview of project organization.
* There is a top-level `data/` directory.
* Each directory should have a `README.md` file describing its contents.
* The readme files should specify commands to run, or point to the make file that does.
* Versioned Jupyter notebooks ([example](https://github.com/blab/dengue-antigenic-dynamics/blob/master/figures/titer-tree-heatmap.ipynb)) are viewable in the browser, as are `.tsv` files ([example](https://github.com/blab/dengue-antigenic-dynamics/blob/master/data/titers_katzelnick2015/dengue_titers.tsv)).
* Relative links throughout.
* Include language-specific dependency install file, Python uses `requirements.txt` as standard, or even better use Conda or Docker.
* Figures are embedded directly in the readme files via Markdown ([example](https://github.com/blab/global-migration/tree/master/geo)).

If there is too much raw data to include in GitHub (100Mb max is allowed), my preferred strategy is to store raw data in Amazon S3 (or the equivalent) and fetch this data as part of processing scripts.

* [Katie Kistler's](https://bedford.io/team/katie-kistler/) 2021 preprint on SARS-CoV-2 adaptive evolution: [github.com/blab/sarscov2-adaptive-evolution](https://github.com/blab/sarscov2-adaptive-evolution) computes SARS-CoV-2 trees using the supplied Nextstrain workflow and retrieves these trees from Amazon S3 when computing figures.

More sophisticated examples will use a workflow manager like Snakemake to automate builds. For example:

* Alistair Russell and Jesse Bloom's recent work on single-cell sequencing of influenza: [github.com/jbloomlab/IFNsorted_flu_single_cell/](https://github.com/jbloomlab/IFNsorted_flu_single_cell/)
* John Huddelston's influenza forecasting work: [github.com/blab/flu-forecasting](https://github.com/blab/flu-forecasting) (this also provides a Conda environment for better reproducibility)

With GitHub as lingua franca for reproducible research, there are now services built on top of this model. For example:

* [Zenodo](https://zenodo.org/) allows you to mint DOIs from GitHub releases.
* In [github.com/trvrb/sismid](https://github.com/trvrb/sismid), I provide a [notebook for running evolutionary simulations](https://github.com/trvrb/sismid/blob/master/selection/mutation-drift.ipynb). You can use [Binder](https://mybinder.org/) to launch an interactive Jupyter notebook without installing any code locally via: [mybinder.org/v2/gh/trvrb/sismid/HEAD](https://mybinder.org/v2/gh/trvrb/sismid/HEAD)
* We've built [Nextstrain](https://nextstrain.org) to look for results files in public GitHub repos to provide interactive figures. For example [community/blab/ncov-cryptic-transmission](https://nextstrain.org/community/blab/ncov-cryptic-transmission/introductions) provides an interactive visualization directly from files hosted on GitHub at [github.com/blab/ncov-cryptic-transmission/](https://github.com/ncov-cryptic-transmission/).

### Project communication

For me, as PI, I enforce a further rule:

**_One paper = One GitHub repo = One Slack channel_**

It's _much_ easier if all project communication goes in one place.

### Further reading

Some suggested readings on reproducible research include:

* [Excellent advice from Karl Broman on initial steps to reproducible research](https://kbroman.org/steps2rr/)

## Project and data organization

It's important to keep a tidy project directory, even if something is not as the stage of being versioned on GitHub.

Some general advice:

1. **Encapsulate everything within one directory, which is named after the project.** Have a single directory for a project, containing all of the data, code, and results for that project. This makes it easier to find things, or to zip it all up and hand it off to someone else.
2. **Separate the data from the code.** I prefer to put code and data in separate subdirectories. I’ll often have a `data/` subdirectory and a `scripts/` (or `src/`) subdirectory.
3. **Use relative paths (never absolute paths).** If you encapsulate all data and code within a single project directory, then you can refer to data files with relative paths (e.g., `../data/some_file.csv`). If you were to use an absolute path (like `~/Projects/SomeProject/data/some_file.csv` or `C:\Users\SomeOne\Projects\SomeProject\data\some_file.csv)` then anyone who wanted to reproduce your results but had the project placed in some other location would have to go in and edit all of those directory/file names.
4. **Write dates as YYYY-MM-DD**. This sorts properly and also avoids ambiguities.
5. **Include readme files**. This bit of documentation greatly helps in describing what a folder contains.
6. **Continually up-to-date directory.** I aim for a clean and up-to-date directory that is continually modified rather than a chronological directory structure (as described in [this article](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424)). A separate electronic lab notebook with chronological entries can be hugely helpful for record-keeping purposes.

### File names

Borrowing excellent slide deck from Ciera Martinez and colleagues: [Reproducible Science Workshop: File Naming](https://rawgit.com/Reproducible-Science-Curriculum/rr-organization1/master/organization-01-slides.html#1)

### File organization

Continuing slide deck from Ciera Martinez and colleagues: [Reproducible Science Workshop: Organization](https://rawgit.com/Reproducible-Science-Curriculum/rr-organization1/master/organization-02-slides.html)

### Documenting your data

Ideally, your `data/` directory will include an additional `README` that (at bare minimum) includes a data dictionary (e.g., what the rows and columns represent). Fully documented metadata (data about the data) will include:
- **Data description**: descriptions for labels of rows and columns (e.g., abbreviations defined, units of measurement)
- **Intent**: project description and purpose, reference to other published works and associated documentation (e.g., manuscripts)
- **Collection method**: experimental design
- **File structure**: if multiple data files are present, the organization and relationship among these files
- **Data type**: file types and formats
- **Provenance**: how data were created and by whom (including analytical pipelines), what normalization or transformations are currently represented

Documenting data can be a time-consuming process, but is often required to submit data to repositories. Since data publishing is a requirement for most academic research as a part of publication, keeping track of this information early on can save you time later, and increase the chances of other researchers using your data later (which means more citations for you).

### Miscellaneous advice

[More excellent advice from Karl Broman](https://kbroman.org/dataorg/)

---

## Tidy data

Tidy data is term from Hadley Wickham and refers to:

>A standard method of displaying a multivariate set of data is in the form of a data matrix in which rows correspond to sample individuals and columns to variables, so that the entry in the ith row and jth column gives the value of the jth variate as measured or observed on the ith individual.

Data in this form is much easier to deal with programmatically. This is also known as a _data frame_. This [tutorial presents a nice overview](https://r4ds.had.co.nz/tidy-data.html).

---

1. Each variable forms a column
2. Each observation forms a row.
3. Each type of observational unit forms a table

See for example, single cell RNA sequencing data, with cells as rows and genes as columns. This is also the way that relational databases (MySQL, Postgres, etc...) are constructed.

---

### Exercise on tidy data

1. Demonstrate conversion of simple example dataset. Work from [Table 2 in Bedford et al. 2014](https://bedford.io/papers/bedford-flux/), available as an [Excel table in the course repo](tables/influenza-evolutionary-parameters.xlsx).

2. Split into small groups of 3-4 people to work from an HI (haemagglutination-inhibition) table and convert to tidy data. Data available as an [Excel table in the course repo](tables/influenza-titer-data.xlsx).

---

## File formats

Saving data as plain text files is necessarily to process this data with either R or Python. You can export from Excel to `.tsv` (tab-delimited, my preferred format) or `.csv` (comma-delimited). A few things to note when exporting data files in these formats:
- Beware that [line endings](https://support.nesi.org.nz/hc/en-gb/articles/218032857-Converting-from-Windows-style-to-UNIX-style-line-endings) differ between Windows and Unix (including Mac), though the text editors we recommend for this class can deal with this
- Exporting from Excel only works for the currently displayed spreadsheet. If you have multiple sheets, you'll need to export multiple times.

---

## Further reading


* [Good Enough Practices for Scientific Computing](https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/)


* [Practical computational reproducibility in the life sciences](https://pubmed.ncbi.nlm.nih.gov/29953862/)

* [Reproducibility standards for machine learning in the life sciences](https://pubmed.ncbi.nlm.nih.gov/34462593/)