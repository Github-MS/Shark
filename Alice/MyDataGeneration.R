

#Comparison of power of Mann-Whitney U test and power of t-test
# In group 1 variable Y is from a normal distribution with mu = 0 and sigma = 1
# In group 2 variable Y is from a normal distribution with mu = 0 + es and sigma = 1
# es is "effect size", which is a factor in the simulation design (either 0.2, 0.5, or 0.8) 
# samp = sample size of group 1 = sample size of group 2
# samp = 10, 20, 40, 80
MyDataGeneration <- function(samp, es){
  var1 <- rnorm(samp, 0, 1) 
  var2 <- rnorm(samp, 0 + es, 1)
  Y <- c(var1, var2)
  group <- as.factor(c(rep(1, samp), rep(2,samp)))
  dat <- data.frame(Y,group)
  return(dat) 
}

