## Code README

This code folder contains three sub-folders: functions, scripts tests.

The functions folder contains eda-functions and regression-functions.
  
  eda-functions.R contains functions used to automate the process of sinking summary statistics for each variable, quantitative and qualitative, and generating related graphs including histogram, boxplot and conditional boxplot. 
  regression-functions.R
  
The scripts folder contains all of 8 scripts used in this project.
  
  session-info-script.R contains code for generating information about our current session, including R packages we used and the R's session information.  
  clean-data.R contains code for standarizing our original data set, Credit.csv, and split it into train set and test set in order to accommodate our model fitting stage. 
  eda-script.R contains our process of implementing exploratory data analysis such as calculating summary statistics and generate graphs. 
  Then, we have one R-script for each regression method we applied in this project. 
  ols-regression.R fit a multiple linear regression model via Ordinary Least Squares. 
  ridge-regression.R fit a multiple linear regression model via Ridge regression. 
  lasso-regression.R fit a multiple linear regression model via Lasso regression. 
  pcr-regression.R fit a multiple linear regression model via Principal Components regression. 
  plsr-regression.R fit a multiple linear regression model via Partial Least Squares regression. 
  
The tests folder contains unit tests for eda-functions and for regression functions.
  