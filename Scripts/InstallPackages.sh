#!/bin/bash
#$ -S /bin/bash
#$ -q all.q
#$ -N installpackages
#$ -cwd
#$ -j Y
#$ -V
#$ -m be
#$ -M j.claramunt.gonzalez@fsw.leidenuniv.nl

R CMD BATCH InstallPackages.R InstallPackages.Rout