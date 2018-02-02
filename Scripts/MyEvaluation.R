#Evaluation Criterion 1: to determine the power of the method we want to know:
#is the p-value of the test significant at 0.05 level?
#if yes, then the test rejected the null-hypothesis that the difference between the groups is 0

MyEvaluation <- function(MyAnalysisResult){
  res <- ifelse(MyAnalysisResult$p.value < 0.05, 1, 0)
 return(res)
  }
