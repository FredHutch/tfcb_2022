# Lecture 2: First steps in the shell

**Erick Matsen ([@ematsen](https://twitter.com/ematsen), [matsen.group](http://matsen.group))**

This lesson introduces you to the command line (a.k.a. Unix shell), which is useful (and necessary) for automating tasks, working with files/directories, and using compute clusters.

* [Recorded lecture](https://www.youtube.com/watch?v=dzkacZ2BTjw)
* [Corresponding slides](https://fredhutchio.github.io/tfcb_2020/lectures/lecture02/slides/slides.html)


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
  - You are responsible for the material through **Redirection** for this class session; we'll complete the rest of the material in lecture 3.
- This material requires access to a [unix shell](/software#unix-command-line-shell). Different "flavors" of shell have slight variations in commands available. These materials are designed to work on the group of computing servers at Fred Hutch called "rhino". Please see [these instructions](/software/unix_rhino.md) for logging on to rhino, and note there is an extra step to log in off campus. You can execute most of these commands on your own computer (e.g., without logging in to rhino), but don't be surprised if some of the commands and options are slightly different (especially on OS X).

## Reminders

- Homework 1 (command line) is available [here](/homeworks/homework01); it may be useful to reference these questions as you work through material in today's class.

## Tutorial

     _______     _______.  ______     ___      .______    _______
    |   ____|   /       | /      |   /   \     |   _  \  |   ____|
    |  |__     |   (----`|  ,----'  /  ^  \    |  |_)  | |  |__
    |   __|     \   \    |  |      /  /_\  \   |   ___/  |   __|
    |  |____.----)   |   |  `----./  _____  \  |  |      |  |____
    |_______|_______/     \______/__/     \__\ | _|      |_______|

    .___________. __    __   _______
    |           ||  |  |  | |   ____|
    `---|  |----`|  |__|  | |  |__
        |  |     |   __   | |   __|
        |  |     |  |  |  | |  |____
        |__|     |__|  |__| |_______|

         _______. __    __   _______  __       __
        /       ||  |  |  | |   ____||  |     |  |
       |   (----`|  |__|  | |  |__   |  |     |  |
        \   \    |   __   | |   __|  |  |     |  |
    .----)   |   |  |  |  | |  |____ |  `----.|  `----.
    |_______/    |__|  |__| |_______||_______||_______|


This is an interactive tutorial to teach you about navigating the shell.

To get started,
[access the unix shell on your computer](tfcb_2020/software#unix-command-line-shell).
Make sure you're connected to the Fred Hutch network,
either on campus via the Marconi wireless network,
via VPN,
or using `snail` as described [here](tfcb_2020/software/unix_rhino.md#off-campus-log-in).
Follow the instructions to [log on to `rhino`](tfcb_2020/software/unix_rhino.md#logging-on-to-rhino).
Once you have logged on,
execute the following commands:

    git clone https://github.com/fredhutchio/tfcb_2020.git
    cd tfcb_2020/lectures/lecture02

Now you can start the first lesson by clicking [here](tfcb_2020/lectures/lecture02/)
to access the [`01-first-steps.md` file.
We recommend keeping a browser open with the lesson materials as you work through the exercises on rhino.

The [`quickref.md` file](tfcb_2020/lectures/lecture02/quickref.md) is a short-as-possible quick reference sheet with basic commands.

## Further references

* [Software Carpentry's shell introduction](https://swcarpentry.github.io/shell-novice/)
* [Software Carpentry's shell topics](https://carpentries-incubator.github.io/shell-extras/)
* [MIT Computer Science "Missing Semester"](https://missing.csail.mit.edu/)
