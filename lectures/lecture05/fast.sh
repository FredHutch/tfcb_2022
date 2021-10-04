#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1
#SBATCH -o job_%j.out
#SBATCH -e job_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=matsen@fredhutch.org
set -eu
set -o pipefail

hostname
echo "here is a message from" $(hostname) > job_output.txt
