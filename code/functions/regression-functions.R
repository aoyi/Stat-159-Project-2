# Residual Sum of Squares Function
# The functions calculates the sum of all differences between the actual value and the correponding prediction by the regression model.
# It serves as a measure to determine how well our regression models fits the data.
# The function takes two inputs, a regression object, which is the output of lm() function and the observed values. 
# The returned output is the value of RSS. 

residual_sum_squares <- function(reg_obj, data) {
  sum((data - predict(reg_obj))^2)
}

# Total Sum of Squares Function
# The functions calculates the total variance in the response Y.
# It serves as a measure of the variability inherent in the dependent variable before the regression is performed. 
# The function takes two inputs, a regression object, which is the output of lm() function and the observed values. 
# The returned output is the corresponding value of TSS. 

total_sum_squares  <- function(reg_obj, data) {
  ESS <- sum((predict(reg_obj) - mean(data))^2)
  residual_sum_squares(reg_obj, data) + ESS
}

# R-Squared Function
# The function calculates the proportion of variance in Y that can be explained by the change in X. 
# It also serves as a goodness of fit measure for the linear regression model. 
# The function takes two inputs, a regression object, which is the output of lm() function and the observed values. 
# The returned output is the corresponding value of R-square. 

r_squared  <- function(reg_obj, data) {
  1 - residual_sum_squares(reg_obj, data)/total_sum_squares(reg_obj, data)
}

# F-Statistic Function
# F statistic is used to determine whether all of the regression coefficients are zero. 
# The function takes three inputs, a regression object, which is the output of lm() function, the observed values and number of predictor used in the multiple linear regression. 
# The returned output is the correponding f statistics.

f_statistic <- function(reg_obj, data) {
  p <- length(reg_obj$coefficients) - 1
  RSS <- residual_sum_squares(reg_obj, data)
  ((total_sum_squares(reg_obj, data) - RSS)/p) / (RSS/(length(data)-p-1))
}

# Residual Standard Error Function
# RSE is an estimate of the standard error of the residual, which is approximately the average amount that the response will deviate from the true regression line. 
# The function takes two inputs, a regression object, which is the output of lm() function and the observed values. 
# The returned output is the corresponding value of RSE. 

residual_std_error <- function(reg_obj, data) {
  p <- length(reg_obj$coefficients) - 1
  sqrt(residual_sum_squares(reg_obj, data)/(length(data) - p - 1))
}



