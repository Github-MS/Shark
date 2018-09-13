#!/bin/bash
#$ -S /bin/bash
#$ -q all.q
#$ -N sim_1
#$ -l h_vmem=1G
#$ -cwd
#$ -j Y
#$ -V

R CMD BATCH "--args $i $j" MainSimulationScript.R

