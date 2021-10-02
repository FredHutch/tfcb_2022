# Redirection

Here we'll try out the fantastically powerful technique of redirection.
We can use this to chain commands together easily to make things run fast.
Let's make sure we're in the right place-- `pwd` should end in `03-redirection`.

## Pipes

Remember how we didn't want to cat the `sequence.gb` file because it was too big?
Sometimes the output from a command is also very verbose and we'd like to be able to page through it.
For example, `tree /` will make a tree of every single file on your file system, which may be in the millions.
You don't want to wait for that to scroll past.

So!
Try this:

    tree / | less

Magic!
We can now use our less keys to page through the output.

What happened here is that we took the output flowing from `tree` and connected it using a "pipe" to `less`.
The "pipe" operator is `|`.
The general format is

    command_producing_output | command_consuming_output

Perhaps `command_consuming_output` also produces output, and we'd like to continue the chain.
We can chain together an arbitrary number of commands like

    command1 | command2 | command3 | command4

etc.

Now it's your turn.
Use redirection to count the number of files in the `lecture03` directory.
(Remember the various flags we used for `ls`, and the fact that you can give it an argument, as well as the thing-counting command we encountered towards the end of `01-first-steps.md`.)


## Filtering

One often wants to take a subset of the output that one gets from a command, and pass it to another command.
For example, there is the `grep` command.
Try

    ls ../slides/images

and then

    ls ../slides/images | grep jpg

You can see that adding the `grep jpg` filtered the output to only things containing the string `jpg`.
That's what it does!
You can read more about grep using `man`.
It's incredibly powerful!

Now pipe together `tree` and other commands you know to find the number of files in `lecture03` that contain `md`.


## Redirecting to files

Sometimes we want to keep the output of a command so that we can use it later.
We can do that with another redirection operator, which is `>`.

For example, try

    tree .. > output.txt

Now take a look at the `output.txt` using an appropriate command.

Now use a similar command to record the output of `date` in `output.txt` and then look at it.

Did you over-write the previous content of `output.txt`?
Sometimes that's intended, but if we don't want to over-write the output of a file, we can use the `>>` operator, like so:

    date >> output.txt

This appends the output of `date` to our file.

Now it's your turn.
Make a file that has the date, a picture of Darth Vader, and the directory tree of `lecture03`.
You can use multiple commands to achieve this result.

---

Congratulations!
You know know the basics of output redirection between commands and into files.

The next step is to work through the `04-vim` README, so `cd ../04-vim`.
