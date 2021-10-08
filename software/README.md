# Software installation

We ask you come prepared to class with a laptop on which you can participate in coding activities. Please follow the instructions below to install the required software for this course (all programs should come pre-installed on your computer, or are freely available for academic use). We'll use the other files in this directory to test the software together in class. The tools you'll need include:

- [Git](#git) for GitHub commands
- [WSL or Terminal](#unix-command-line) for Unix command line
- [Anaconda](#python) for installing Python
- [Conda Environment](#conda-environment) for installing R and R packages
- [Text Editor](#text-editor) for file viewing / manipulation
- [Passwordless Authentication](#pass-authentication-rhino) for Rhino

## Git

You can follow the instructions [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) to install Git. 

## Unix command line

### For Windows users

Windows 10 comes with a new feature called Windows Subsystem for Linux (WSL) that allows you to access Unix tools on your computer. Please install WSL with the instructions [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

### For MacOSX users

Macintosh operating systems are built on Unix, so many of the tools you'll need are pre-installed on your computer. You can access the command line through an application called **Terminal**. You can either search for this in Finder, or use the Go drop-down menu to locate it in the Utilities folder.

## Python

Please install Python using Anaconda, which includes Jupyter notebooks and most of the other packages we'll use for the course, according to the following instructions:
- Download the [Anaconda](https://www.anaconda.com/download/) installer for Python 3.x for your particular operating system.
- Double-click the downloaded file and follow the prompts to install Anaconda (default options are acceptable).
- If you are using WSL, you may need to follow [these steps instead](https://gist.github.com/kauffmanes/5e74916617f9993bc3479f401dfec7da#steps-to-install-anaconda-on-windows-ubuntu-terminal) (especially if you are running into issues with conda within vscode terminal)

## Conda Environment

A conda environment is a directory that stores a specific collection of packages that you have installed. For this course, we ask that you create a custom conda environment with certain R packages so that everyone will be on the same page. To do this:
- Check that Anaconda has been installed.
- In WSL or Terminal, create a new conda environment with the packages we'll need for this course using the following command. Type 'y' when asked to Proceed. (NOTE: if prompted with a "To use the java command-line tool...", just press OK).
  * `conda create -n tfcb2021 r r-tidyverse r-irkernel bioconductor-plyranges bioconductor-genomicfeatures -c conda-forge -c bioconda`
- Activate the environment with:
  * `conda activate tfcb2021`

## Text Editor

Biological data is almost exclusively represented as text, and we will be writing code and documentation in text files. It's useful to be able to open, examine, and edit text files using a light-weight text editor. Microsoft Word is not suitable for these types of files, and we do not recommend the text editors set as default on your computer, as these programs are often not optimized for working with code. 

We will use VSCode as the source code and text editor for this class. Install [VSCode](https://code.visualstudio.com/docs/editor/versioncontrol) on your computer and view the introductory video [here](https://code.visualstudio.com/docs/introvideos/basics) before the first class to familiarize yourself with the user interface.

We will use the following features in VSCode as part of this class:

1. Work with [Git and GitHub](https://code.visualstudio.com/docs/introvideos/versioncontrol) for version control (see more below).
2. Edit Markdown files and [preview rendered versions](https://code.visualstudio.com/docs/languages/markdown).
3. Write Python code in [native Jupyter notebooks](https://code.visualstudio.com/docs/datascience/jupyter-notebooks).
4. Use the [integrated terminal](https://code.visualstudio.com/docs/editor/integrated-terminal).
5. [Connect to and work on remote hosts](https://code.visualstudio.com/docs/remote/ssh) such as the Fred Hutch Rhino computing cluster.

## Getting started with using Terminal/Python/R in VSCode

**To get started on using VSCode**:
1. Open VSCode and click on 'Extensions' on the left-side menu.
2. Install Python (by Microsoft), Markdown Preview Enhanced (by Yiyi Wang), and Remote - SSH (by Microsoft).
3. Clone the `tfcb2021` GitHub repository in VSCode with View > Command Palette > Git: Clone > https://github.com/FredHutch/tfcb_2021.git.
4. Click on 'Explorer' on the left-side menu, and you should be able to open and manipulate all the files in the TFCB 2021 GitHub repository.

**To use Python in Jupyter notebook**:
1. Open the test Jupyter notebook `test_python.ipynb`. 
2. In the upper right corner, you should see an icon to select a kernel. Select the anaconda environment that you created, which should look something like `Python 3.x.x 64-bit (conda)`.
3. On the left-side of the code block, click the triangle to execute the code.
4. You should see a 2 x 2 table filled with 1's (and no error messages).

**To use R in Jupyter notebook**:
1. Open the Terminal window in VSCode (Terminal > New Terminal) and activate the `tfcb2021` environment you previously created with `conda activate tfcb2021`.
2. Type `which R` into Terminal to identify where the R interpreter is located in the environment (ex. `/usr/local/bin/R`).
3. Now switch back to the base environment with `conda activate base`. 
4. Type the location identified in Step 2 (ex. `/usr/local/bin/R`). This should start the R interpreter.
5. In the R interpreter, type `IRkernel::installspec()` after the >. This should install kernelspec in the right location.
6. Open the test Jupyter notebook `test_R.ipynb`.
7. In the upper right corner, select `R` as the kernel this time. 
8. Run the code block.
9. You should see a scatter plot of hwy vs. displ.

## Passwordless authentication for Rhino

It can get annoying having to type your password everytime you ssh into rhino. With an SSH key, you won't have to enter your password anymore. To set this up:
1. Open a Terminal window on your local computer and type `ssh-keygen`.
2. When prompted with "Enter file in which to save the key (/Users/USERNAME/.ssh/id_rsa):", simply press `Enter` to save the key in the default location.
3. Follow the prompt and enter a passphrase, which should be a longer complex password to ensure best protection of your key.
4. Now, you should see that your public key has been saved. To copy your key to snail, type the command: `ssh-copy-id HUTCHID@snail.fhcrc.org`. To copy your key to rhino (via snail), type the command: `ssh-copy-id -o ProxyJump=HUTCHID@snail.fhcrc.org HUTCHID@rhino.fhcrc.org`. It should prompt you for your password.
5. Lastly, modify your `~/.ssh/config`. To do this:
  * Check that you have the Remote - SSH extension installed. If not, follow instructions [here](#text-editor) to install this extension.
  * In VSCode, click View > Command Palette > Remote-SSH: Open SSH Configuration File...
  * You should see a config file that looks like this:
```
# Read more about SSH config files: https://linux.die.net/man/5/ssh_config
Host alias
    HostName hostname
    User user
```
  * Delete the text and copy/paste the text below into its place. Modify the "HUTCHID" parts to your Hutch username, and save.

```
Host snail
    Hostname snail.fhcrc.org
    User HUTCHID

Host rhino
    UseKeychain  yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa
    User HUTCHID
    HostName rhino.fhcrc.org
    ProxyCommand ssh HUTCHID@snail.fhcrc.org exec nc %h %p 2> /dev/null

```
6. Congratulations! Now, you should be able to ssh into rhino without typing your password each time using `ssh rhino`.
<!---
# Software installation

We ask you come prepared to class with a laptop on which you can participate in coding activities. Please follow the instructions below to install the required software for this course (all programs should come pre-installed on your computer, or are freely available for academic use). We'll use the other files in this directory to test the software together in class. The tools you'll need include:

- [Jupyter Notebooks via Anaconda](#python) for Python
- [Text Editor](#text-editor) for file viewing / manipulation
- [Spreadsheet program](#spreadsheet-program), like Microsoft Excel or LibreOffice Calc
- [R and RStudio](#r) for R statistical programming
- [WSL or Terminal](#unix-command-line) for Unix command line


## Python

We will use [Jupyter notebooks](http://jupyter.org) to record code, output, and text throughout the course.
We recommend installing Python using Anaconda, which includes Jupyter notebooks and most of the other packages we'll use for the course, according to the following instructions:
- Download the [Anaconda](https://www.anaconda.com/download/) installer for
Python 3.x for your particular operating system.
- Double-click the downloaded file and follow the prompts to install Anaconda (default options are acceptable).

## Text Editor

Biological data is almost exclusively represented as text, and we will be writing code and documentation in text files. It's useful to be able to open, examine, and edit text files using a light-weight text editor. Microsoft Word is not suitable for these types of files, and we do not recommend the text editors set as default on your computer, as these programs are often not optimized for working with code. 

We will use VSCode as the source code and text editor for this class. Install [VSCode](https://code.visualstudio.com/docs/editor/versioncontrol) on your computer and view the introductory video [here](https://code.visualstudio.com/docs/introvideos/basics) before the first class to familiarize yourself with the user interface.

We will use the following features in VSCode as part of this class:

1. Work with [Git and GitHub](https://code.visualstudio.com/docs/introvideos/versioncontrol) for version control (see more below).
2. Edit Markdown files and [preview rendered versions](https://code.visualstudio.com/docs/languages/markdown).
3. Write Python code in [native Jupyter notebooks](https://code.visualstudio.com/docs/datascience/jupyter-notebooks).
4. Use the [integrated terminal](https://code.visualstudio.com/docs/editor/integrated-terminal).
5. [Connect to and work on remote hosts](https://code.visualstudio.com/docs/remote/ssh) such as the Fred Hutch Rhino computing cluster.

## Spreadsheet program

Spreadsheet programs are a useful way for us as humans to interact with data. The most common of these is Microsoft Excel. Commands may differ a bit between programs, but the general ideas for thinking about spreadsheets are the same. If you are working on a computer owned by Fred Hutch, Microsoft Office (including Excel) is available through the Self Service application. If you are working on a personal computer that doesn’t have a spreadsheet program, you can use a free, open source program called LibreOffice.

Install LibreOffice by going to the installation page. The version for your operating system should automatically be selected. Click Download Version X.X.X (whichever is the most recent version). You will go to a page that asks about a donation, but you don’t need to make one. Your download should begin automatically.
Once the installer is downloaded, double click on it and LibreOffice should install.

## Git

Git is version control software, which helps you keep track of changes made to files. GitHub is a repository for data and code tracked with Git, and is a mechanism for publishing and collaborating on project development. VSCode and GitHub play nicely together and you will be able to do lot of Git-related activities from within VSCode. Installing VScode should also install Git on your computer.

### GitHub Account

If you do not already have one, please register for a [GitHub account](https://github.com). Please note that your name and email will be publicly visible through GitHub by default, but more information on controlling privacy settings can be found [here](https://help.github.com/en/articles/setting-your-commit-email-address).


## R

R and RStudio are separate downloads.
R is the "engine", while RStudio is an integrated desktop environment (IDE) that makes using R much more pleasant.
R must be installed before RStudio.
Follow the instructions below for your operating system to install them.
If you are working on a computer owned by Fred Hutch,
RStudio + R is available through the Self Service application.

### Windows

- Download the installer for the latest version of R from [CRAN](http://cran.r-project.org/bin/windows/base/release.htm).
  The file will begin downloading automatically.
- Double-click the downloaded `.exe` file and follow the prompts to install.
- Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download).
- Under _Installers_, click the link for the _Windows Vista/7/8/10_ installer to download it.
- Double-click the downloaded `.exe` file and follow the prompts to install (default options are acceptable).
- Once both are installed, launch RStudio and make sure there are no error messages.

### MacOSX

- Download the installer for the latest version of R compatible with your version of macOS from [CRAN](https://cran.r-project.org/bin/macosx/).
  If you are not using a recent version of macOS you may have to scroll down to _Binaries for legacy OS X systems_ and find the one appropriate for your version of macOS.
  To check what version of macOS you are using, click the apple icon in the upper left corner of your screen and go to _About This Mac_.
  Please note the instructions on that page for downloading and installing [XQuartz](https://www.xquartz.org/) if necessary.
- Double-click the downloaded `.pkg` file and follow the prompts to install (default options are acceptable).
- Go the the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download).
- Under _Installers_, click the link for the your OSX version's installer to download it.
- Double-click the downloaded `.dmg` file, then open the RStudio folder that appears on your desktop. Drag the RStudio icon into the Applications folder.
- Once everything is installed, launch RStudio and make sure there are no error messages.

### Installing tidyverse

- Open Rstudio.
- Click the Packages tab in the lower right panel.
- Click the Install button (upper left corner of the panel). In the empty space for Packages, type `tidyverse`. The other defaults (Install from CRAN and the Install to Library path) should be ok. Make sure the box next to "Install dependencies" is checked, and click Install.
- If your installation is successful, you should see tidyverse appear in the list below.

## Unix command line (shell)

### Windows

Windows 10 comes with a new feature called Windows Subsystem for Linux (WSL) that allows you to access Unix tools on your computer. Installation instructions can be found [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

Another option (such as if you are not running Windows 10) is Git for Windows, which also installs Git command-line tools. You can download [here](https://git-scm.com/download/win) and install with default options.

### MacOSX

Macintosh operating systems are built on Unix, so many of the tools you'll need are pre-installed on your computer. You can access the command line through an application called **Terminal**. You can either search for this in Finder, or use the Go drop-down menu to locate it in the Utilities folder.

### Logging on to rhino

We'll be using a computer cluster at Fred Hutch called rhino for the unix classes. Please see [these instructions](https://fredhutchio.github.io/tfcb_2021/software/unix_rhino) for logging on to rhino, and note there is an extra step to log in off campus.
-->
