# Pre-flight check

Before you get started, type

    pwd

again and make sure that the output ends with `tfcb_2022/lectures/lecture04`.

# Directories

Execute

    cd 02-directories

Congratulations, you just changed directory using `cd`, which is short for "change directory".
By executing `cd directories` you moved your current location inside a directory called `directories`.
You can think about this being like double clicking on a folder in a graphical user interface.

Think back to the previous lesson, and execute the command that allows you to see the currently available set of files from this directory.

### Paths

It takes a little work to keep track of where you are in the shell.
As we have seen so far, the

    pwd

command shows you where you are.
The `pwd` command is short for "print working directory."

On my computer the `pwd` command outputs

    /home/melody/tfcb_2022/lectures/lecture04/02-directories

which shows the list of directories I'm in.
Such a list of directories (perhaps ending with a file name) is called an _absolute path_.
Each successive directory is separated from the previous one with a `/`, so I'm in a directory called `directories`, which is contained in a directory called `lecture04`, which is contained in a directory called `lectures`, and so on.
As I described before the beginning ("root") directory is called `/`.

Remember how before we learned how to give an argument to the directory-listing command?
Try this: give that command a part of your path, so see the list of files at various places in your directory hierarchy.
For example, on my computer I could try

    ls /home/melody/tfcb_2022

but on your machine the path components will be different.

### Tab completion

Experienced shell users do not write out the full names of files or directories.
Instead, they use the tab key to have the shell complete file names for them.

For example, try typing `ls REA` and then hitting the tab key.

This also works to make your way through directories!
Try `ls pur`, and tab.
Now just hit tab a few more times.
The shell should bring up some options, and you can select between them by typing the first letter or so and hitting tab again.
Continue doing this until you run out of directories.


### Moving around more freely

Try `cd`-ing into the `purchase` directory.
How do we get back?

First try the slow way.
Use `pwd` to find your current directory as an "absolute path" starting from the root directory `/`.
Then copy and paste the that whole path, except for the `purchase` at the end, and use that as an argument for `cd`.
Use `pwd` again to check your location.

There is an easier way!
The `..` symbol means "one directory towards the root," so `cd ..` will take you to the directory that contains your current directory.
Try that out now.

We can also `cd` through multiple directories at once by giving an argument like `cd first/second/third` (replacing `first`, `second` and `third` with actual names of directories.

Try jumping into the `greenland` directory in one hop now.

You can also chain together `..`s. Try going back in one hop.

Now try

    cd -

what does this command do?
(Remember you can use `pwd` to write out where you are.)

First use `pwd` to print out your current directory, and save that location.
Now try changing your directory to `/`.
Take a look around.
What do you see?

Now go back to where you were before.

---

Congratulations!
You now know how to navigate around the file system.

**For the next lesson,** go up one directory and then into the `03-redirection` directory and have a look at the README there.
