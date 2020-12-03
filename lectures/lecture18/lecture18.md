# Developing genomics pipelines with remote computing

So far in this course, 
you've had a whirlwind tour of different technical skills and methods
for performing computational analyses involving biological data.
Over the next two lectures, 
we'll start to put the pieces together,
and help you understand how different computational tools 
are used together to answer scientific questions.

## Overview

A standard RNAseq workflow to evaluate genome-wide differential gene expression generally includes the following steps:

1. Biological sampling and library preparation
2. Sequence reads
3. Adapter trimming
4. Map reads to genome
5. Count reads associated with genes
6. Statistical analysis to identify differentially expressed genes

For more extended explanations, you can view more complete material [here](https://hbctraining.github.io/Intro-to-rnaseq-hpc-O2/schedule/),
specifically the day 2 materials for [Intro to RNA-seq](https://github.com/hbctraining/Intro-to-rnaseq-hpc-O2/blob/master/lectures/rna-seq_design.pdf)
and [NGS workflows](https://github.com/hbctraining/Intro-to-rnaseq-hpc-O2/blob/master/lectures/NGS_workflows.pdf).

The first two steps happen in the lab, steps 3-5 often occur on the command line (usually using high-performance computing, like a compute cluster), and the last step happens in R or Python. 

In this lecture,
we'll take a closer look at how to run command line software.
While you may be able to install some of these programs on your own computer,
we'll be using Fred Hutch's on-premise compute cluster.
We'll be performing the first steps in analyzing RNAseq data,
using the same data you saw in Homework 6,
and emulating the process of developing a genomics pipeline.
Because we're constrained by the time we have in class,
we'll start with testing a single data file 
and applying basic steps in the early stage of the workflow.
In our next class,
you'll learn more efficient ways to connect the pieces of this 
analysis together.

The following code uses these tools:
- [fastq-dump](https://ncbi.github.io/sra-tools/fastq-dump.html) from SRA-Toolkit to download data from SRA
- [cutadapt](https://cutadapt.readthedocs.io/en/stable/index.html) to remove adapter tags from sequences
- [hisat2](https://ccb.jhu.edu/software/hisat2/manual.shtml) to align/map reads to the reference genome
- [samtools-1.0](http://www.htslib.org/doc/samtools-1.0.html) to manipulate sam files and count reads

## Getting set up

Let's first get our project directory set up:

    mkdir ~/lecture18_rnaseq
    cd lecture18_rnaseq
    mkdir -p data/fastq

It's ok to use the login nodes (`rhino`) for basic unix commands,
but now we're going to start loading and using modules,
so we'll request a compute node using `grabnode`
(a single node for a single day,
and otherwise default settings is fine).

Once our node has been allocated,
we can download our data.
Let's load the tool and execute the line to download:

    ml SRA-Toolkit
    fastq-dump SRR4450332 --gzip -O data/fastq/

Oops, looks like we need to get set up to download data.
Let's creat a directory to hold the prefetch data:

    mkdir ~/sra-prefetch

Then we can follow the instructions in the last error:

    vdb-config -i

In the resulting interactive window, type:
- `c` to select the "Cache" tab
- `o` to choose location of the user-repository
- use the down arrow to select `sra-pre-fetch`
- `tab` so `[ OK ]` is shown in red
- `x` to exit

For more information on configuring `fastq-dump`,
please see [this resource](https://github.com/ncbi/sra-tools/wiki/03.-Quick-Toolkit-Configuration).

Now that we're appropriately configured,
we can execute our download again:

    fastq-dump SRR4450332 --gzip -O data/fastq/

We'll only download a [single sample](https://www.ncbi.nlm.nih.gov/sra/SRX2268409[accn]) from the dataset to save time,
but it will still take a few minutes to complete.
In the meantime,
take a look at the [fastq-dump documentation](https://ncbi.github.io/sra-tools/fastq-dump.html)
to determine what each part of the command above accomplishes.

When your command prompt (`$`) has returned,
you're ready to check and see that your data are available:

    ls data/fastq

You should see your data file present.

## Adapter trimming

These data still have adapters included from the sequencing process,
which must be trimmed before we can analyze them.
Let's create a location to store the trimmed data files:

    mkdir data/trim

We'll use `cutadapt` to remove adapters:

    ml cutadapt
    cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA --minimum-length=22  -o data/trim/SRR4450332.fastq.gz data/fastq/SRR4450332.fastq.gz

You can read more about the options we're using in the [cutadapt documentation](https://cutadapt.readthedocs.io/en/stable/guide.html#illumina-truseq) (note: our data are single-end, not paired-end,
so we are only using one adapter).

Here is some of the output you should see printed to your screen:

```
=== Summary ===

Total reads processed:              16,020,153
Reads with adapters:                15,988,495 (99.8%)
Reads written (passing filters):    13,308,156 (83.1%)

Total basepairs processed:   801,007,650 bp
Total written (filtered):    395,061,666 bp (49.3%)
```

## Map reads to genome

Now that our data have been cleaned,
we can work on mapping them to a reference genome.
First, let's load the software we'll use for read mapping:

    ml HISAT2

To map these reads,
we also need an indexed genome
(the index is created by the mapping software to 
make it computationally possible to compare so many reads
across the genome).
We'll minimize the computational intensity by using a previously indexed portion of the genome (chromosome 22)
located in the shared class folder.
Let's take a look at the index files:

    CHR22=/fh/fast/subramaniam_a/tfcb/chr22
    echo $CHR22
    ls $CHR22

We'll also create a new directory to store the output:

    mkdir alignments

Now we're ready to map the reads:

    hisat2 -p 6 -x $CHR22/chr22 -U data/trim/SRR4450332.fastq.gz -S alignments/SRR4450332.sam

We'll convert the output sam to bam:

    ml SAMtools
    samtools view -@ 6 -b alignments/SRR4450332.sam > alignments/SRR4450332.unsorted_bam
    samtools sort -@ 6 alignments/SRR4450332.unsorted_bam > alignments/SRR4450332.bam
    samtools index -@ 6 alignments/SRR4450332.bam

Then we can extract the mapping statistics:

    samtools stats alignments/SRR4450332.bam > alignments/SRR4450332.stats.tsv

From here, we could use the bam file to:

- visualize the genomic read mapping
- count reads for differential expression
- assess variants, by comparing to human population genomic data

## Putting it together

Now that we've worked through each stage of the workflow interactively,
we know each step works.
We could record our work in a script to make it easier to reproduce,
and also document the specific details of our analysis
(which would be really useful if we want to perform it again on other data!).
You can view one example of such a script in [`slurm.sh`](slurm.sh),
which includes slurm instructions for batch submission,
but still needs a few tweaks to run to completion.

## Questions for discussion

1. How would you view the mapping statistics?
2. What do you need to change in `slurm.sh` for it to run to completion?
3. What approaches (e.g., software) would you take to perform each of the additional steps listed above?
4. How do you know what programs to use? Which algorithms, and which parameters?
5. How do we make this analysis above more automated/reproducible?
6. What if you'll be using a different cluster or computer for this analysis? What can stay the same, and what needs to change?
