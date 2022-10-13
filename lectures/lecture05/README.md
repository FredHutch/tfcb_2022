# Lecture 05: Next steps in the shell

**Melody Campbell ([@melodygcampbell](https://twitter.com/melodygcampbell), [campbelllab.org](http://campbelllab.org))**

This lesson builds on the work that we did in the previous session, while adding additional complexity.

## Learning objectives

After these two lectures, you should be able to:

- Navigate a file system in the shell (lecture 04)
- Run commands in the shell (lecture 04)
- Understand basic usage of redirection (lecture 04)
- Write a for loop (lecture 05)
- Edit a file using vim (lecture 05)
- Write a basic shell script (lecture 05)


In the second lecture, We will go over the commands presented in the previous session. We will use some of these commands to write a for loop that can automate tasks. We will also learn how to edit a file using vim and how to write and submit a shell script. A signficant portion of this session will be dedicated to working though the tutorial, initially made by [Erick Matsen](https://twitter.com/ematsen).

[The slides are here](https://github.com/FredHutch/tfcb_2022/blob/main/lectures/lecture05/slides/2022oct13_MCB536_Lecture05.pdf), and if you missed the lecture [here will be a recorded version](https://washington.zoom.us). 

## Tutorial

This is an interactive tutorial to teach you about navigating the shell.

To get started,
[access the unix shell on your computer](https://github.com/FredHutch/tfcb_2022/blob/main/lectures/lecture04/README.md#setup-accessing-a-command-line).
Make sure you're connected to the Fred Hutch network,
either on campus via the Marconi wireless network,
via VPN,
or using `snail` as described [here](https://fredhutch.github.io/tfcb_2021/software/unix_rhino#off-campus-log-in).

Once you have logged on,
execute the following commands:

(Optional) If you followed along yesterday for the interactive lecture, you will need to mv your directory since it has the same name as the one we will use today.

    mv tfcb_2022 tfcb_2022_inclass
    
Then use this command to grab the materials we'll work though today:

    git clone https://github.com/fredhutch/tfcb_2022.git
    cd tfcb_2022/lectures/lecture04

Now you can start the first lesson by clicking [here](https://fredhutch.github.io/tfcb_2022/lectures/lecture04/01-first-steps).
We recommend keeping a browser open with the lesson materials as you work through the exercises on VS Studio or your computer.
Go to [this page](https://github.com/fredhutch/tfcb_2022/tree/master/lectures/lecture04) to see the complete list of files for this lecture.
The [`quickref.md` file](https://fredhutch.github.io/tfcb_2022/lectures/lecture04/quickref) is a short-as-possible quick reference sheet with basic commands.
