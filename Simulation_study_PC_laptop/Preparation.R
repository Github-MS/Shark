#Preparation of the analysis
### Initialize the factors of your design:
samp <- c(10, 20, 40, 80)
es <- c(0.2, 0.5, 0.8)
##And create the simulation design matrix (full factorial)
# Design is a data.frame with all possible combinations of the factor levels
# Each row of the design matrix represents a cell of your simulation design
Design <- expand.grid(samp = samp, es = es)
###Preparation of the analysis:
# If you use R packages that are not standard:
# Install the relevant R packages, for example:
#install.packages("ica")
#Always use library() to activate the package
#library(ica)
#NB we do not use this package for our example
### Source the relevant R functions of our example
### These functions are available from:
### https://github.com/Github-MS/Shark/tree/master/Scripts
source("MyDataGeneration.R")
source("Method_new.R")
source("Method_old.R")
source("MyEvaluation.R")