# Lecture 17: Introduction to remote computing

**Erick Matsen ([@ematsen](https://twitter.com/ematsen), [matsen.group](http://matsen.group))**

## Learning objectives

After this course, you should:

- Understand the computational resources available at the center
- Be able to use the interactive and cluster nodes

## Class materials

[A tour of Fred Hutch scientific computing resources video](https://www.youtube.com/watch?v=VkYdbQ0VoWU)

## Reminders


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

The `slow.sh` script is the same one that I demoed in the video.

* change it so that it emails you, not me
* change the job output file names
* try running it with `sbatch`
* watch the output accumulate using `tail -f`
* see your job with `squeue -u $USER`
* copy the job ID from that command and cancel your job with `scancel`
* see your recent cluster history with `sacct`
