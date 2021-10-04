# Homework 2: Unix shell

This homework will assess your ability to run commands in the shell and make a simple script.

Replace the lines specified in _italics_ with your answers and save as a text file.


## Problem 0

**60 points**

Complete the interactive tutorial.

_Did you hit any points of frustration, and if so, how could we improve the material to avoid that frustration?_


## Problem 1

**20 points**

Learn about the difference between standard out ("stdout") and standard error ("stderr") from [this article](https://www.howtogeek.com/435903/what-are-stdin-stdout-and-stderr-on-linux/) (feel free to read the whole thing, but you can stop before the section "Detecting Redirection Within a Script").
Note that in reading this article, you don't need to come up with a script that will throw an error: we have one at `tfcb_2021/lectures/lecture03/scripting/script2.sh`.

_Write a command here that redirects stdout from `script2.sh` to a file named `stdout.txt` and redirects stderr to a file named `stderr.txt`._


## Problem 2

**20 points**

You might have noticed that the files we're dealing with have "extensions" that describe their file type.
For example, text files are marked with `.txt`, and shell scripts are labeled with `.sh`.

This is a handy convention which is used heavily by a command-line library called [imagemagick](https://imagemagick.org/index.php) to manipulate images.
ImageMagick has been installed on rhino, but needs to be loaded before you use it:

    ml ImageMagick

Don't forget to load the updated version of parallel:

    ml parallel

Once the library is loaded, go to the `lecture03/slides/images` directory and try

    convert betty-crocker.jpg betty-crocker.png

which converts `betty-crocker.jpg` (a JPG image) to `betty-crocker.png` (a PNG image).
You can confirm proper conversion using `file`.
Now, your turn:

_Use parallel to convert all of the JPGs in this directory to PNG images._

Big hint: There is a very similar sort of command in the "Compute intensive jobs and substitution" section of the `parallel` man page.

Next:

_Write a script that will take all of the JPGs in the current directory, convert them to PNGs, and then assemble all of the PNGs in the current directory into a file called `montage.png` using the `montage` command. Paste that script here._
