# Shell scripting!

We made it!
You have now arrived at the fabled land of shell scripting.
We will slide into shell scripting with the tools we've already built up.

Let's make sure we're in the right place-- `pwd` should end in `06-scripting`.

## History revisited

Wouldn't it be nice if we could replay a sequence of commands that we liked?
Here we'll set things up to do exactly that.

Previously we saw that we could view the history conveniently by piping `history` to `less`.
We can see the last set of commands by piping `history` to another command, called `tail`.

Try that!
Look at the manual for `tail` so that you can get the last 25 lines of your history rather than the default.

There's one annoying thing about `history`, which is that it includes the number of the command.
We can avoid that by using [fc](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/fc.html#top) as `fc -ln` in place of `history`.
If you get an error with `fc`, use `builtin fc -ln`.
(Note that if you try to read about `fc` with `man fc` it won't work, because `fc` is part of the shell language.)

Let's noodle around in the shell a bit to generate more history.

* redirect the output of `date` to a file called `date.txt`
* redirect the output of `ls` to a file called `ls.txt`
* echo "shell scripting is hip"
* do your own `echo` command with a phrase of your choice.

Now use `fc -ln -20` to get the last 20 commands you have written, and redirect that to a file called `script1.sh`.

Now edit that file with `vi script1.sh` (or however you like to edit files).
Delete the lines that you don't want, like `man` calls, etc (an easy way to do that is to go to a line you don't want with the arrow keys, and hit `dd`).
Leave at least one call to `echo` for fun.
Repeat until you are done and then close and save the file `ZZ`.

Try adding a comment!
Comments in shell start at the beginning of the line with `#` and can have any text after that.
They are a good idea for documenting what is happening in your script.

Now you can execute your shell script with

    bash script1.sh

This runs the commands that you have in `script1.sh`.
You can verify that the script is being run by first deleting the files `date.txt` and `ls.txt` using the `rm` command.
Verify that this removal worked using `ls` then run your script again.

Now it's your turn.
Make another script called `delete.sh` which deletes `date.txt` and `ls.txt`.
Hint, you don't have to start from scratch... you can use your history!


## Making your shell script stand-alone

I hope it's clear that shell scripting is... just a list of commands in a file!
It can get a lot more complicated than that, but it probably shouldn't in most cases.
Once you start needing to do more complex manipulations, it's probably time to reach for a language that has more sophisticated error handling and built-in functionality (such as Python).

You can make your shell script like executing a normal command by

* adding `#!/bin/bash` to the top
* calling `chmod a+x script1.sh`

Now you should be able to run your script with `./script1.sh`.

Next we'll be playing around scripting with samtools using the `wgs_bam_NA12878_20k_b37_NA12878.bam` file in this directory.

[samtools](https://www.htslib.org/doc/samtools.html) is a collection of tools for manipulating data in
Sequence Alignment/Map (SAM) format.
This software is installed on rhino, but needs to be made available for use using `module load`, or `ml` for short:

    ml SAMtools

Our data has an awkward name, so let's rename it `input.bam` with

    mv wgs_bam_NA12878_20k_b37_NA12878.bam input.bam

This file contains a bunch of sequence reads that align to the human genome.
You first need to prepare this file like so:

    samtools index input.bam

Samtools has a nice command line user interface that has commands within the command.
The format is like

    samtools COMMAND ETC

where `COMMAND` is a command such as `index` and `ETC` are flags, files, etc.
This is now common and is used for git and other lovely software.

You can view reads from the first chromosome with

    samtools view input.bam 1 | head

Try that out.
Rather than using `head`, try piping to something that will allow you to scroll.


## ERRORS!!!

Try running `./script2.sh` via

    ./script2.sh

* What happened?
* Did the script run to completion?
* What is in the final output file?
* Fix the "bug" in this script and re-run.
* How does the output look now?

You see, shell scripts are determined to finish come hell or high water.
That's a really bad thing!
When something goes wrong, such as getting a filename wrong, you want the program to stop, not making bad output.
Now we will learn something very important...

**Always put `set -eu` as the second line of your shell script.**

* Try putting `set -eu` as the second line, just after `#!/bin/bash`.
* Re-introduce the "bug".
* Remove the output files.
* Re-run the script.


## Don't write complex shell

"Classic" shell is a complex programming language.
The most frequently used shell, called "bash", [is way more complex](https://www.tldp.org/LDP/abs/html/).
As I've said before, I do not suggest that you write complex shell scripts.

Nevertheless, shell is the easiest way to automate lots of processes happening on large servers, which is the whole reason we're doing all of this.
So let's do this!
