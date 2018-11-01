#Evaluation Criterion: 
#to determine the power of the method: 
#is the p-value of the test significant at 0.05 level?
#if yes, then the test rejected the null-hypothesis that the difference 
#between the groups is 0: i.e., the alternative hypothesis is correctly accepted
#if no, then the null hypothesis is incorrectly not rejected.

MyEvaluationPC <- function(MyAnalysisResult){
  res <- ifelse(MyAnalysisResult$p.value < 0.05, 1, 0)
  # 1 means: the alternative hypothesis is correctly accepted
  # 0 means: the null hypothesis is incorrectly not rejected
 return(res)
  }
