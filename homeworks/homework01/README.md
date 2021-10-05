# Homework 1

This homework will assess your ability to use GitHub, organize projects, and apply tidy data principles, and represents content covered in lectures 1 and 2.

## Problem 1

**15 points**

Make a GitHub account and populate your bio by including your research interests, place of work, location, professional webpage (or science-focused twitter account!). Here's an example [github.com/trvrb](https://github.com/trvrb/).

_Include the link to your GitHub profile here._

## Problem 2

**15 points**

This question assesses your ability to track a project using Git.

Download the course files with the following link: [github.com/FredHutch/tfcb_2021/archive/refs/heads/main.zip](https://github.com/FredHutch/tfcb_2021/archive/refs/heads/main.zip). Copy the contents of `homeworks/homework01/messy-project-directory/` to a new directory on your computer named `tfcb-homework01`.

Open VSCode and make a "New repository" with name `tfcb-homework01`. Set "Local Path" to the location in your computer where your `tfcb-homework01` directory can be found.

Create an initial commit that adds all the local files in `tfcb-homework12`:
- `Survey Data.xlsx`
- `get Species_list.py`
- etc...

You do not need to submit anything for this problem; your success will be evaluated in the next problem.

## Problem 3

**15 points**

This question assesses your ability to publish projects to GitHub.

Publish `tfcb-homework12` to GitHub using Git. Make sure to set this to be a "public" repository. The resulting repository can now be accessed at `github.com/{your_name}/tfcb-homework01`. If necessary, you can make this repository public by going to "Settings" from this page.

_Include the link to your `tfcb-homework01` GitHub repository here._

## Problem 4

**15 points**

This question assesses your ability to organize files and directories associated with research projects.

Organize files into a more consistent structure. Group images into a `images/` directory. Separate source code and data. Rename files to remove spaces and improve consistency. Commit changes and publish to your public GitHub repository.

_Include the link to your `tfcb-homework01` GitHub repository here._

## Problem 5

**20 points**

This question assesses your ability to write a README with Markdown formatting.

Create a file called `README.md` and populate with Markdown. Demonstrate headers, lists, links, embedded images (by linking to images contained in the directory) and tables in this readme.

Commit this file and publish to your public GitHub repository.

_Include the link to your `README.md` here._

## Problem 6

**20 points**

This question assesses your understanding of tidy data principles.

Clean up the file that was originally named `Survey Data.xlsx`. Some points to remember: aim for a single tidy data frame in a single tab, don't use formatting as data, use preferred date format, properly record null values.

Export this as a tab-delimited `.tsv` text file with Unix line endings.

Commit the modified `.xlsx` file and the `.tsv` file and publish to your public GitHub repository.

_Include the link to your `.tsv` file on GitHub here._
