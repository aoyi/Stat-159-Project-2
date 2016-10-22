# UC Berkeley Statistics 159 Fall 2016 Project 2

## Introduction

In this project, our objective is to apply model selection methods introduced in Chapter 6, Linear Model Selection and Regularization, from the book "An Introduction to Statistical Learning" by Gareth James, Deniela Witten, Trevor Hastie and Robert Tibshirani. In our analysis, we compare the fit of models generated by 5 different regression methods, regression model obtained by Ordinary Least Squares, Ridge regression, Lasso regression, Principal Components regression and Partial Least Squares regression. To evaluate how well each model fits the data, we perform 10-fold cross validation in the model construction process and select the model with minimum cross-validation errors in terms of the running parameter. To perform the analysis, we mainly apply computational toolkit in r such as lm(), glmnet(), pcr() function and combine them with key elements for reproducible work such as makefile and git. The requirement for this project can be found at https://github.com/ucb-stat159/stat159-fall-2016/blob/master/projects/proj02/proj02-predictive-modeling.pdf. 

## Structure

The structure of this project is listed as following:

```
stat159-fall2016-project2/
    .gitignore
    README.md
    LICENSE
    Makefile
    session-info.txt
    code/
        README.md
        test-that.R
        functions/
            regression-functions.R
        scripts/
            eda-script.R
            regression-script.R
            session-info-script.R
    data/
        data-sets/
	          Credit.csv
	          scaled-credit.csv
	          train-set.csv
	          test-set.csv
	      eda-outputs/
	          eda-output-qualitative.txt
	          eda-output-quantitative.txt
	          eda-output-correlation.txt
	          eda-output-anova.txt
	      README.md
    images/
	      boxplot/
	      conditional-boxplot/
	      histograms/
	      scatterplot-matrix/
    report/
    	  report.Rmd
    	  report.pdf
```

## Reproduction Steps

Install R packages, `xtable` and `testthat`:

```
install.packages("xtable")
install.packages("testthat")
````

To reproduce the analysis:

1. Clone this project

2. Navigate to the folder stat159-fall2016-project2.

3. Run `make` in the terminal to regenerate all the output files, graphs and report. 

  Can also reproduce the result step by step by running:
 
  `make data` to download the data Advertising.csv in data folder. 
  
  `make eda` to perform elementary data analysis to obtain correlation matrix and histograms.
 
  `make regression` to run multiple regression and generate corresponding regression objects and regression plots. 
  
  `make report` to reproduce the report

3. Run `make tests` to test regression functions included in `code/functions/regression_functions.R`.

## Contributor

Aoyi Shan

UC Berkeley Class of 2017

Statistics, B.A. | Business Administration, B.S.

Email: aoyi95@berkeley.edu

Yukun(Diane) He

UC Berkeley Class of 2017

Statistics, B.A. | Economics, B.A

Email: yukunhe@berkeley.edu

## License

All media contents are licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

All code is licensed under [BSD-2.0](https://opensource.org/licenses/BSD-2-Clause).