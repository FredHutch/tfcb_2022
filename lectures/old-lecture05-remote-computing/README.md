# Lecture 05: Introduction to remote computing

**Erick Matsen ([@ematsen](https://twitter.com/ematsen), [matsen.group](http://matsen.group))**

## Learning objectives

After this course, you should:

- Understand the computational resources available at the center
- Be able to use the interactive and cluster nodes

## Class materials

I'll give a tour of the FH computational environment during class.

Here is an outline of the tour:

* Welcome!
    * Scicomp has put together a very nice system
    * Be kind to sysadmins!
* Not going to cover
    * [motuz](https://sciwiki.fredhutch.org/compdemos/motuz/) file transfer
    * [getting a graphical user interface session on the remote machines](https://sciwiki.fredhutch.org/scicomputing/access_nx/)
    * Economy cloud storage
    * Cloud computing
* Lots of resources for you
    * https://sciwiki.fredhutch.org/ (please contribute)
    * http://www.fredhutch.io/
    * https://fhbig.slack.com/
* Interactive compute
    * the rhinos (for non-intensive use)
    * `grabnode`
    * `top`, `htop`
    * You need to use some strategy to avoid your jobs being killed when you close your laptop. [Options here](https://sciwiki.fredhutch.org/scicomputing/access_methods/#ssh-connections). [My notes on tmux](http://erick.matsen.org/2020/01/04/2nd-gen-interactive-shell.html).
* Modules
    * `ml SAMtools`
    * `ml fhDev`
    * [Available modules](https://sciwiki.fredhutch.org/scicomputing/compute_scientificSoftware/)
* Your home directory
    * Shared across every compute resource!
    * 100GB
    * `.snapshot`
* Storage
    * `/fh/fast`
    * Scratch storage: `cp to-delete /fh/scratch/delete30/matsen_e/` (replace `matsen_e` with your PI's name once you have one)
    * Economy cloud storage
* gizmo cluster
    * We use the [SLURM](https://slurm.schedmd.com/documentation.html) job scheduler
    * `sbatch`
    * `scancel`
    * `squeue -u $USER`
    * `tail -f slurm-output-file.out`
    * `sacct` and variants, e.g. `sacct -u $USER -o JobID,JobName%30,Elapsed,State,MaxRSS,AllocCPUs,MaxVMsize`
    * `hitparade`


[Here is a recorded video](https://www.youtube.com/watch?v=VkYdbQ0VoWU) with some of the same content.


## Interactive work

### Shell variables

Shell variables are variables that are associated with your shell session.
If you want to use their value, you write them with a `$` at the beginning.
They are typically written in all caps.

For example, the `$PWD` variable will always have your current working directory, just as if you had executed `pwd`.
We can learn the value of variables using `echo`.
For example, try the following commands:

* `echo $PWD`
* `echo $HOST`
* `echo $USER`

If you want to know more (e.g. how to set a variable), here are two excellent resources describing variables in shell (in fact, in Bash, but most people use Bash).

* [An excellent and short introduction](https://opensource.com/article/19/8/using-variables-bash)
* [A more detailed introduction](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html)


### Playing with the FH computational environment

* Grab a node with `grabnode`
* Run `htop`
* Log out from it
* See who is hammering the cluster using `hitparade`


### Cluster use

The `slow.sh` script in this `lecture05` directory is the same one that I demoed in the video.

* change it so that it emails you, not me
* change the job output file names
* try running it with `sbatch`
* watch the output accumulate using `tail -f`
* see your job with `squeue -u $USER`
* copy the job ID from that command and cancel your job with `scancel`
* see your recent cluster history with `sacct`
