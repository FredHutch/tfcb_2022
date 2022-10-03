# Software installation

We ask you come prepared to class with a laptop on which you can participate in coding activities. Please follow the instructions below to install the required software for this course (all programs are freely available for academic use). We'll use the other files in this directory to test the software together in class. The tools you'll need include:

- [VSCode Editor](#text-editor) for file viewing / manipulation
- [Docker](#docker) for running software in reproducible environments
- [VSCode Remote Development Extension Pack](#vscode-remote-development-extension-pack) for running software withing VSCode
- [Git](#git) for version control

Once you have the above software installed, you should be able to run the example [Python](test_python.ipynb) and [R](test_R.ipynb) Jupyter notebooks after you open this repository using a Remote Development Container within VSCode.

## VSCode Text Editor

We will use VSCode as the source code and text editor for this class. Install [VSCode](https://code.visualstudio.com/Download) on your computer and view the introductory video [here](https://code.visualstudio.com/docs/introvideos/basics) before the first class to familiarize yourself with the user interface.

We will use the following features in VSCode as part of this class:

1. Work with [Git and GitHub](https://code.visualstudio.com/docs/introvideos/versioncontrol) for version control (see more below).
2. Edit Markdown files and [preview rendered versions](https://code.visualstudio.com/docs/languages/markdown).
3. Write Python and R code in [native Jupyter notebooks](https://code.visualstudio.com/docs/datascience/jupyter-notebooks).
4. Use the [integrated terminal](https://code.visualstudio.com/docs/editor/integrated-terminal).
5. [Connect to and work on remote hosts](https://code.visualstudio.com/docs/remote/ssh) such as the Fred Hutch Rhino computing cluster.

## Docker

We need Docker for creating reproducible environments for running programs written in Python or R.
You can install Docker following links [here](https://code.visualstudio.com/docs/remote/containers#_installation). Ignore steps 2 and 3 about the WSL 2 for now. 

## VSCode Remote Development Extension Pack

You can follow instructions [here](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) to install the extension pack.

## Git

You can follow the instructions [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) to install Git. Use the default settings in the installer.

## Testing Software Installation

Once you have installed the requisite software, then you should be able to perfom the following steps:

1) Open VS Code

2) "Reopen in container" the TFCB Docker container. This will install the container.

3) After installing the container (takes a minute), then you should be able to run the test code (hint: pick the right kernel for R, python etc.)

## R

R in vscode is run via jupyter. Ignore the next bit if R seems to be working.
See: https://code.visualstudio.com/docs/languages/r

1) Open terminal in vscode inside the dev container. Check your environment, which is located left of your current path and likely says `(base)`.

2) Check which conda you are using by typing `which conda` and `conda --version` into terminal. These should return something like `/opt/conda/bin/conda` and `conda 4.12.0` respectively.

3) Check your conda environments with `conda env list`. We will use the tidy env for R, which can be activate with `conda activate tidy`.

4) Inside the tidy environment you can run R directly from the commandline, which is helpful for installing new packages. Of note, the devcontainer already comes with most things you need and adding new packages can create conflicts, so be careful installing packages that you don't overwrite dependencies or install anything risky from a 3rd party developer. For now lets just determine which R we are running, which I will let you figure out using some of the above commands (see step 2). What happens if you run these commands outside the conda environment?

5) Add your R path to the `Rterm` in the dev container settings. Your R path should now appear under available kernels, which you can select to run the R test notebook.
