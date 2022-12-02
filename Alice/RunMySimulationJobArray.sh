#!/bin/bash
#$ -q all.q
#$ -N my_array
#$ -V
#$ -cwd
#$ -j y
#$ -l h_vmem=200M
#$ -t 1-10
i=1
j=$SGE_TASK_ID

R CMD BATCH "--args $i $j" foreachSHARK.R foreachSHARK.$SGE_TASK_ID.Rout 