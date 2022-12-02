#!/bin/env bash
#SBATCH -J my_array
#SBATCH -N 1
#SBATCH --mem=512MB
#SBATCH --output=sim_study_%a.out
#SBATCH --error=sim_study_%a.err
#SBATCH --array=1-10

module load R/4.0.5-foss-2020b

Rscript MyArraytest.R $SLURM_ARRAY_TASK_ID
