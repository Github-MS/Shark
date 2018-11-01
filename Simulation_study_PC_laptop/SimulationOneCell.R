MySimulationCell<- function(Design = Design, RowOfDesign = 1, K = 2){
  # Input arguments:
  #Design = designmatrix
  # RowOfDesign: number that refers to the row of the design matrix = one cell
  # K: Total number of replications = number of data sets generated in one cell
  #Create matrix or dataframe to store the results:
  MyResult <- matrix(NA, nrow = K, ncol=2)
  #create a loop over the replications k = 1 to K:
  for (k in 1:K){
    # Generate data
    # set a random number seed to be able to replicate the result exactly
    set.seed((k + 1000)*RowOfDesign)
    SimDat <- do.call(MyDataGeneration, Design[RowOfDesign,] )
    # Analyze data set with Method_new
    tmp <- proc.time()
    MyAnalysisResult1 <- Method_new(SimDat)
    #Analyze data set with Method_old
    MyAnalysisResult2 <- Method_old(SimDat)
    #Combine relevant results of the analysis by the two methods in a vector (optional)
    MyAnalysisResult <- c(MyAnalysisResult1$p.value, MyAnalysisResult2$p.value)
    #Evaluate the analysis results of Method_new (Result1) and Mehtod_old (Result2)
    MyResult1 <- MyEvaluation(MyAnalysisResult1)
    MyResult2 <- MyEvaluation(MyAnalysisResult2)
    #store the results in the right row k of your result matrix:
    #We only store the second result which is the evaluation criterion
    MyResult[k, ] <- c(MyResult1, MyResult2)
  }
  #save the time to run the analyses of K data sets in one cell of the design.
  time <- proc.time() - tmp
  return(MyResult)
}

Row <- 1
MyResult <- MySimulationCell(Design = Design, RowOfDesign = Row, K = 2 )
# Write output of one cell of the design
save(MyResult, file =paste("MyResult", "Row", Row,".Rdata" , sep =""))
#optional to save timing of analyses of K replications in 1 cell
save(time, file =paste("Time", "Row", Row, ".Rdata" , sep =""))
