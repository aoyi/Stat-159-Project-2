# Run "make" to reproduce report

.PHONY: all data data_clean tests eda ols ridge lasso pcr plsr regressions report slides session clean

# Set variables
eda_script = code/scripts/eda-script.R
ols_script = code/scripts/ols-regression.R
pcr_script = code/scripts/pcr-regression.R
ridge_script = code/scripts/ridge-regression.R
lasso_script = code/scripts/lasso-regression.R
plsr_script = code/scripts/plsr-regression.R

# All target
all: 

# Data target: Download data from the url
data: 
	cd data/data-sets && curl -O http://www-bcf.usc.edu/~gareth/ISL/Credit.csv && Rscript $<
	
# data_clean: Clean data and separate into test and train set
data_clean: code/scripts/clean-data.R
	Rscript $<

# Tests target: Run tests
tests: code/test-that.R code/tests/test-regression.R
	Rscript code/test-that.R 

# Report target: Produce reports by compiling Rmarkdown to pdf 
report: report/sections/*.Rmd
	cat report/sections/*.Rmd > report/report.Rmd
	cd report && Rscript -e "library(rmarkdown); render('report.Rmd', 'pdf_document')"

# Eda target: Run eda script to calculate summary statistics
eda: data $(eda_script)
	Rscript $(eda_script)

# ols target: Run ols regression and generate ols estimators
ols: $(ols_script) data
	Rscript $(ols_script)
	
# ridge target: Run ridge regression and generate ridge estimators
ridge: $(ridge_script) data
	Rscript $(ridge_script)	
	
# lasso target: Run lasso regression and generate lasso estimators
lasso: $(lasso_script) data
	Rscript $(lasso_script)

# pcr target: Run pcr regression and generate pcr estimators
pcr: $(pcr_script) data
	Rscript $(pcr_script)

# plsr target: Run plsr regression and generate plsr estimators
plsr: $(plsr_script) data
	Rscript $(plsr_script)

# regressions target: Run all 5 regressions
regressions: 
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

# slides target: Generate slides
slides:


# Session target: Run sessioninfo script
session: code/scripts/session-info-script.R
	Rscript $<

# Clean target: Delete report.pdf
clean:
	rm -f report/report.pdf
