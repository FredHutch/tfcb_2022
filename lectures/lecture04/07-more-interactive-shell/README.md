# A bit more interactive shell

### A little about wildcards/globbing

In the scripting component you just did, we used wildcards like so:

    ls PHOTO*.jpg

The `*` just represents any set of characters.
Thus this `ls` call just lists anything that starts with `PHOTO` and ends with `.jpg`.

Now it's your turn.
You can combine wildcards, using them for example for both directory and file names.
Try using a wildcard to list all of the `.md` files in `02-directories/purchase` directory one directory down.
(There is also a Python `glob` module which implements wildcards, if you need that at some point.)

[There are other symbols you can use if you want more precise control over your wildcard matches](http://www.linfo.org/wildcard.html) but `*` is a fine start.


### Hidden directories and files

The shell has a special way of hiding files that you don't want to see: any file or directory starting with a period (`.`) is hidden when you `ls`.
It's also not matched with `*`.
Try doing

    echo ~/*

which compactly lists all of the non-hidden files in your home directory (which is `~`).
Then try

    echo ~/.*

which shows all of the hidden files.

You can also use

    ls -a ~

which will list all of the files in `~`.


### Removing files

Removing files happens with

    rm FILENAMES

where `FILENAMES` can be one or more names.
Removing directories happens with

    rmdir DIRECTORYNAMES

where `DIRECTORYNAMES` is one or more directory names.
However, these directories need to be empty.
It is more common to use the less safe

    rm -r DIRECTORYNAMES

which recursively removes `DIRECTORYNAMES` and all of their contents.

BE CAREFUL!! Unlike "putting something in the trash" on a desktop OS, once linux removes a file, it's gone!


### Making directories

Making directories is done with

    mkdir DIRECTORY

which makes a directory called `DIRECTORY`.


### Copying and moving/renaming files

Copying files uses the `cp` command, like so:

    cp SOURCE DESTINATION

where `SOURCE` is an extant file, and `DESTINATION` is a place the file can go.
If `DESTINATION` is a file name, it will copy that file to have that new name.
If `DESTINATION` is a directory, it will copy the file with the same name into that directory.

You can also use the form

    cp SOURCES DIRECTORY

where `SOURCES` is a collection of files and `DIRECTORY` is a directory.

Moving/renaming files is just the same, except that you use the `mv` command rather than the `cp` command.

Now it's your turn.

* Copy this `README.md` file into `..`
* Rename it `../README.copy.md`
* Make a directory called `copies`
* Copy `../README.copy.md` and into `copies`
* Remove the `copies` directory

---

Congratulations!
You are done with the tutorial!
