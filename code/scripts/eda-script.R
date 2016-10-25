source("code/functions/eda-functions.R")

data_set <- read.csv("data/data-sets/Credit.csv")
quantitative_output_file <- "data/eda-outputs/eda-output-quantitative.txt"
qualitative_output_file <- "data/eda-outputs/eda-output-qualitative.txt"
correlation_output_file <- "data/eda-outputs/eda-output-correlation.txt"
anova_output_file <- "data/eda-outputs/eda-output-anova.txt"

sink(file = quantitative_output_file)

quantitative_variables <- c("Income", "Limit", "Rating", "Cards", "Age", "Education", "Balance")
for (i in quantitative_variables) {
  output_quantitative_stats(data_set[,i], i, quantitative_output_file)
}

sink()

sink(file = qualitative_output_file)
qualitative_variables <- c("Gender", "Student", "Married", "Ethnicity")
for (i in qualitative_variables) {
  output_qualitative_stats(data_set[,i], i, qualitative_output_file)
}
sink()

sink(file = correlation_output_file)
cat("Correlation Matrix \n\n", file = correlation_output_file, append = TRUE)
cor_matrix <- cor(data_set[, quantitative_variables], data_set[, quantitative_variables])
cor_matrix
sink()

for (i in quantitative_variables) {
  histogram_generator(data_set[,i], i)
  boxplot_generator(data_set[,i], i)
}

png("images/scatterplot-matrix/scatterplot-matrix.png")
pairs(data_set[, quantitative_variables])
dev.off()

sink(file = anova_output_file)
fit <- aov(Balance ~ Income + Limit + Rating + Cards + Age + Education, data = data_set)
summary(fit)
sink()

condition_boxplot_generator("Gender")
condition_boxplot_generator("Student")
condition_boxplot_generator("Ethnicity")
condition_boxplot_generator("Married")







