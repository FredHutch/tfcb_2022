# Lecture 03: First steps in the shell

**Erick Matsen ([@ematsen](https://twitter.com/ematsen), [matsen.group](http://matsen.group))**

This lesson introduces you to the command line (a.k.a. Unix shell), which is useful (and necessary) for automating tasks, working with files/directories, and using compute clusters.

In the first lecture, I will describe the larger context of why we want to use the command line.
[Here are the slides](https://fredhutch.github.io/tfcb_2021/lectures/lecture03/slides/slides.html) if you wish to follow along, and if you missed the lecture [here is a recorded version](https://www.youtube.com/watch?v=dzkacZ2BTjw) covering the same material.


## Learning objectives

After this course, you should be able to:

- Navigate a file system in the shell
- Run commands in the shell
- Understand basic usage of piping and redirection
- Edit a file using vim
- Write a basic shell script
- Run a command in parallel using GNU Parallel

## Class materials

- All instructions for this lesson are links or are available in this repository.
  - See the Tutorial section below to get started with the exercises.
  - The recorded lecture and introductory slides are linked to above.
- This material requires access to a [unix shell](https://fredhutch.github.io/tfcb_2021/software/#unix-command-line-shell). Different "flavors" of shell have slight variations in commands available. These materials are designed to work on the group of computing servers at Fred Hutch called "rhino". Please see [these instructions](https://fredhutch.github.io/tfcb_2021/software/unix_rhino) for logging on to rhino, and note there is an extra step to log in off campus. You can execute most of these commands on your own computer (e.g., without logging in to rhino), but don't be surprised if some of the commands and options are slightly different (especially on OS X).

## Reminders

- Homework 2 (command line) is available [here](https://fredhutch.github.io/tfcb_2021/homeworks/homework02); it may be useful to reference these questions as you work through material in today's class.

## Tutorial

This is an interactive tutorial to teach you about navigating the shell.

To get started,
[access the unix shell on your computer](https://fredhutch.github.io/tfcb_2021/software#unix-command-line-shell).
Make sure you're connected to the Fred Hutch network,
either on campus via the Marconi wireless network,
via VPN,
or using `snail` as described [here](https://fredhutch.github.io/tfcb_2021/software/unix_rhino#off-campus-log-in).
Follow the instructions to [log on to `rhino`](https://fredhutch.github.io/tfcb_2021/software/unix_rhino#logging-on-to-rhino).
Once you have logged on,
execute the following commands:

    git clone https://github.com/fredhutch/tfcb_2021.git
    cd tfcb_2021/lectures/lecture03

Now you can start the first lesson by clicking [here](01-first-steps.md).
We recommend keeping a browser open with the lesson materials as you work through the exercises on rhino.
Go to [this page](https://github.com/fredhutch/tfcb_2021/tree/master/lectures/lecture03) to see the complete list of files for this lecture.
The [`quickref.md` file](https://fredhutch.github.io/tfcb_2021/lectures/lecture03/quickref) is a short-as-possible quick reference sheet with basic commands.

## Further references

* [Software Carpentry's shell introduction](https://swcarpentry.github.io/shell-novice/)
* [Software Carpentry's shell topics](https://carpentries-incubator.github.io/shell-extras/)
* [MIT Computer Science "Missing Semester"](https://missing.csail.mit.edu/)
