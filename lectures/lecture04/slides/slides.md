#

**_teaching goals_**

<br>

* what is high performance computing
* rudiments of command line interaction
* how to run a command in parallel across cores

# eventually you will outgrow your laptop

#
<p class="stretch"><img src="images/ferret.jpg"></p>

#
<section data-background="https://img-en.fs.com/community/wp-content/uploads/2016/08/Data-Center-.jpg"></section>

#
<section data-background="images/gizmo.png"></section>

#
<p class="stretch"><img src="images/galaxy.png"></p>

#
<p class="stretch"><img src="images/betty-crocker.jpg"></p>

#
<p class="stretch"><img src="images/cake-recipe.jpg"></p>

# linux = do whatever you want on high-performance compute systems

#
<section data-background="https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Wikimedia_Foundation_Servers-8055_08.jpg/1280px-Wikimedia_Foundation_Servers-8055_08.jpg"></section>

#
<section data-background="images/datacenter-cooling.jpg"></section>

#
<section data-background="https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Inside_and_Rear_of_Webserver.jpg/1920px-Inside_and_Rear_of_Webserver.jpg"></section>

#
<section data-background="images/processor.jpg"></section>

#
<section data-background="images/tractor.jpg"></section>

#
<section data-background="images/harvesters.jpg"></section>

#
<section data-background="https://upload.wikimedia.org/wikipedia/commons/c/c7/HuaweiRH2288HV2.JPG"></section>

# the command line is the computational lab bench

#

<p class="stretch"><img src="https://thumbs.dreamstime.com/z/pipeta-do-canal-da-mulher-qu%C3%ADmica-do-cientista-do-laborat%C3%B3rio-multi-27966547.jpg"></p>

#

the command line is the "native" environment <br> for interacting with linux

<br>

<div class=fragment>
similar environments also appear <br> on Mac OS and Windows
</div>

#

_buy eggs_

    buy eggs

<br>

<div class=fragment>
_buy two dozen eggs_

    buy --dozens 2 eggs
</div>



<br>

<div class=fragment>
_buy, using cash, two dozen eggs_

    buy --using cash --dozens 2 eggs
</div>

#

_buy eggs and fry them_

    buy eggs | fryingpan --oiled --minutes 4

<br>

<div class=fragment>

_buy eggs, fry them, and store on plate_

    buy eggs | fryingpan --oiled --minutes 4 > plate
</div>


#

You can write a little program <br>
to execute command line calls.

This is called a "shell script".

<br>

<div class=fragment>
    buy eggs | hands --action crack > bowl
</div>

<div class=fragment>
    whisk --input bowl | fryingpan --oiled --minutes 4 > plate
</div>

#

but first, let's mash the keyboard

#

    buy eggs | hands --action crack > bowl
    whisk --input bowl | fryingpan --oiled --minutes 4 > plate

<br>

    samtools view wgs_bam_NA12878_20k_b37_NA12878.bam \
                   | cut -f3 | sort | uniq -c > contig_counts.txt
    sort -n -r contig_counts.txt > contig_counts_sorted.txt
    head contig_counts_sorted.txt


#
**When to use shell programming?**

<br>

Just you are _only_ running other commands, like making a simple computational pipeline.

<div class=fragment>
For other tasks, use Python or R.
</div>

<div class=fragment>
For a serious computational pipeline, consider a tool such as [Snakemake](https://snakemake.readthedocs.io/en/stable/) or [Nextflow](https://www.nextflow.io/).
</div>


#

These slides were generated from source<br>
using a [shell script](https://github.com/FredHutch/tfcb_2021/blob/main/lectures/lecture03/slides/build.sh).


#

**Unix philosophy**

* Write programs that do one thing and do it well.
* Write programs to work together.
* Write programs to handle text streams, because that is a universal interface.

#

**May you be a happy and free ferret**

<br>

<p class="stretch"><img src="https://img-9gag-fun.9cache.com/photo/awxeMoR_700bwp.webp"></p>
