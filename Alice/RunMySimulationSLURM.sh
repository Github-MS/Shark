#!/bin/env bash
#SBATCH -J Sim_study
#SBATCH -N 1
#SBATCH --mem=512MB
#SBATCH --output=sim_study_%J.out
#SBATCH --error=sim_study_%J.err
#SBATCH --mail-user j.claramunt.gonzalez@fsw.leidenuniv.nl
#SBATCH --mail-type=BEGIN,END,FAIL

module load R/4.0.5-foss-2020b

Rscript MainSimulationScriptSLURM.R $i $j
