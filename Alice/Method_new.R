#Method new: Mann-Whitney U test

Method_new<- function(SimData){
  formula <- Y~group
  res <- wilcox.test(formula, data = SimData)
  return <- res}

