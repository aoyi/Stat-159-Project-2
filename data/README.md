## Data README

This data folder contains three sub-folders: data-sets, eda-outputs and regression-data.

The data-sets folder contains four data sets: `Credit.csv`, `scaled-credit.csv`, `test-set.csv`, and `train-set.csv`. All of the four data sets are generated by `clean-data.R`.

   `Credit.csv` is the original data set.
   
   `scaled-credit.csv` is generated by `clean-data.R` script and contains a mean-centered and standardized data set after dummy out categorical variables.
	
   `train-set.csv` and `test-set.csv` are also generated by `clean-data.R`. `train-set.csv` contains a random sample of size 300 from `scaled-credit.csv` and `test-set.csv` contains the rest of 100 observations that are not included in the train set.

The eda-outputs folder contains four text files: `eda-output-anova.txt`, `eda-output-correlation.txt`, `eda-output-qualitaive.txt`, and `eda-output-quantitative.txt`. All of the four text files are generated by `eda-script.R`.

   `eda-output-qualitative.txt` contains the summary statistics for all the qualitative variables.

   `eda-output-quantitative.txt` contains the summary statistics for all the quantitative variables.
	
   `eda-output-correlation.txt` contains matrix of correlations among all quantitative variables.

   `eda-output-anova.txt` contains summary of anova between balance and all the qualitative variables.

The regression-data folder contains ten RData files, two for each regression method. `ols-regression.R`, `ridge-regression.R`, `lasso-regression.R`, `pcr-regression.R` and `plsr-regression.RData` each generates two RData files. 

   All the RData files named `..-regression.RData` contain the regression object of running cross-validation of each regression method.

   All the RData files named `..-model-stats.RData` contain the best lambda/best m, test MSE, regression model of full data set, and coefficient estimates for each regression method.  
  
