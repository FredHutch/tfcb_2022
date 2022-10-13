# Lecture 04: First steps in the shell

**Melody Campbell ([@melodygcampbell](https://twitter.com/melodygcampbell), [campbelllab.org](http://campbelllab.org))**

This lesson introduces you to the command line (a.k.a. Unix shell), which is useful (and necessary) for automating tasks, working with files/directories, and using compute clusters.

In the first lecture, I will describe the history of and larger context for why we want to use the command line.
[Here are the slides](https://fredhutch.github.io/tfcb_2021/lectures/lecture03/slides/slides.html), and if you missed the lecture [here is a recorded version](https://washington.zoom.us/rec/share/kAlIrKjjhTXqy76tNzHBJG8g1BlglpnBkWj4vAS-7taesKBxFPTeyd6X4vmBnTnw.RXJ0i7Snc2N6Trel). 

If you want a second opnion or want to learn cluser-based computing and paralleization, [here is a recorded version](https://www.youtube.com/watch?v=dzkacZ2BTjw) covering related material by Erick Matsen in 2020.


## Learning objectives

After these two lectures, you should be able to:

- Navigate a file system in the shell (lecture 04)
- Run commands in the shell (lecture 04)
- Understand basic usage of redirection (lecture 04)
- Write a for loop (lecture 05)
- Edit a file using vim (lecture 05)
- Write a basic shell script (lecture 05)

## Class materials

- All instructions for this lesson are links or are available in this repository.
  - See the Tutorial section in the next lecture to get started with the exercises.
  - The recorded lecture and introductory slides are linked to above.
  
## Setup: Accessing a Command Line

This material requires access to a [unix shell](https://fredhutch.github.io/tfcb_2021/software/#unix-command-line-shell). Different "flavors" of shell have slight variations in commands available so don't be surprised if some of the commands and options are slightly different (especially on OS X).
  
- **Use a Command Line via Visual Studio Code (recommended)**
  - [Install using these instructions](https://github.com/FredHutch/tfcb_2022/blob/main/software/README.md#vscode-text-editor)
  - Adjust the view options in the upper right corner to toggle view and maximize the "Terminal" tab
  
- **Use a Command Line on Mac OS X**
  - Macintosh operating systems are built on Unix, so many of the tools you’ll need are pre-installed on your computer. You can access the command line through an application called Terminal. You can either search for this in Finder, or use the Go drop-down menu to locate it in the Utilities folder.
  
- **Use a Command Line on Windows 10**
  - Windows 10 comes with a new feature called Windows Subsystem for Linux (WSL) that allows you to access Unix tools on your computer. Please install WSL with the instructions [here](https://learn.microsoft.com/en-us/windows/wsl/install).


## Reminders

- Homework 2 (command line) will be available [here](https://fredhutch.github.io/tfcb_2022/homeworks/homework02) on October 13th; it may be useful to reference these questions as you work through material in the second class.

## Further references

* [Software Carpentry's shell introduction](https://swcarpentry.github.io/shell-novice/)
* [Software Carpentry's shell topics](https://carpentries-incubator.github.io/shell-extras/)
* [MIT Computer Science "Missing Semester"](https://missing.csail.mit.edu/)
