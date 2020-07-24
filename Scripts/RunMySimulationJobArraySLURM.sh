#!/bin/env bash
#SBATCH -J my_array
#SBATCH -N 2
#SBATCH --mem=512MB
#SBATCH --output=sim_study_%a.out
#SBATCH --error=sim_study_%a.err
#SBATCH --array=1-10

module load statistical/R/4.0.2/gcc.8.3.1

Rscript MyArraytest.R $SLURM_ARRAY_TASK_ID