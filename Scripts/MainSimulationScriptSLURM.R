# #!/bin/bash
# # MainSimulationScriptSLURM.R
# # args is a stringvector
args <- commandArgs(TRUE)
args <- as.numeric(args)
print(args)

#args <- c(4,args)
#print(args)
RowOfDesign <- args[1]
Replication <- args[2]

### Simulation design example
samp <- c(10, 20, 40, 80)
es <- c(0.2, 0.5, 0.8)

# Design is a data.frame with all possible combinations of the factor levels
# Each row of the design matrix represents a cell of your simulation design

Design <- expand.grid(samp = samp, es = es)

# set a random number seed to be able to replicate the result exactly
set.seed((Replication + 1000)*RowOfDesign)

#Source the relevant R functions of our example

source("/home/jclaramuntganzalez/sharktutorial/MyDataGeneration.R")
source("/home/jclaramuntganzalez/sharktutorial/Method_new.R")
source("/home/jclaramuntganzalez/sharktutorial/Method_old.R")
source("/home/jclaramuntganzalez/sharktutorial/MyEvaluation.R")

#An alternative to the previous lines is to create your own directory
#and upload the files to it. For example: 
#source("/yourdirectorypath/MyDataGeneration.R")
#source("/yourdirectorypath/Method_new.R")
#source("/yourdirectorypath/Method_old.R")
#source("/yourdirectorypath/MyEvaluation.R")

######### simulation ###########
# Generate data
SimData <- do.call(MyDataGeneration, Design[RowOfDesign, ]  )

# Analyze data set with Method_new
tmp <- proc.time()
MyAnalysisResult1 <- Method_new(SimData)

#Analyze data set with Method_old
MyAnalysisResult2 <- Method_old(SimData)
time <- proc.time() - tmp #save the time to run the analyses of one cell of the design

#Combine relevant results of the analysis by the two methods in a vector (optional)

MyAnalysisResult <- c(MyAnalysisResult1$p.value, MyAnalysisResult2$p.value)

#Evaluate the analysis results of Method_new and Mehod_old
MyResult1 <- MyEvaluation(MyAnalysisResult1)
MyResult2 <- MyEvaluation(MyAnalysisResult2)

#combine the results in a vector:
MyResult <- c(MyResult1, MyResult2)

# save stuff on export
setwd("/exports/fsw/claramuntj/sharktutorial")
#Alternatively, you can also create your folder in the export/fsw directory 
#and set it as your working directory.


# Write output (also possible to first save everything in a list object)

#optional to save the data
#save(SimData, file = paste("Simdata","Row", RowOfDesign, "Rep" ,Replication ,".Rdata" , sep ="")) 
#optional to save the analysis result
#save(MyAnalysisResult, file = paste("Analysis","Row", RowOfDesign, "Rep", Replication ,".Rdata" , sep ="")) 

save(MyResult, file = paste("MyResult", "Row", RowOfDesign,"Rep",Replication ,".Rdata" , sep =""))

#optional to save timing of analyses 
#save(time, file = paste("Time", "Row", RowOfDesign, "Rep", Replication ,".Rdata" , sep =""))
