
# Generate summary statistics for quantitative variables
output_quantitative_stats <- function(data, name, file) {
  data_min <- min(data)
  data_max <- max(data)
  data_range <- data_max - data_min
  data_1stQ <- unname(quantile(data_set$Income)[2])
  data_median <- median(data)
  data_3rdQ <- unname(quantile(data_set$Income)[4])
  data_IQR <- data_3rdQ - data_1stQ
  data_avg <- mean(data)
  data_sd <- sd(data)
  cat("Summary Statistics for", name, "\n\n", file = file, append = TRUE)
  cat(sprintf("Minimum       : %0.2f", data_min), "\n", file = file, append = TRUE)
  cat(sprintf("Maximum       : %0.2f", data_max), "\n", file = file, append = TRUE)
  cat(sprintf("Range         : %0.2f", data_range), "\n", file = file, append = TRUE)
  cat(sprintf("First Quantile: %0.2f", data_1stQ), "\n", file = file, append = TRUE)
  cat(sprintf("Median        : %0.2f", data_median), "\n", file = file, append = TRUE)
  cat(sprintf("Third Quantile: %0.2f", data_3rdQ), "\n", file = file, append = TRUE)
  cat(sprintf("IQR           : %0.2f", data_IQR), "\n", file = file, append = TRUE)
  cat(sprintf("Mean          : %0.2f", data_avg), "\n", file = file, append = TRUE)
  cat(sprintf("Std Dev       : %0.2f", data_sd), "\n\n", file = file, append = TRUE)
}

# Generate summary statistics for qualitative variables
output_qualitative_stats <- function(data, name, file) {
  freq_table <- table(data)
  relative_freq <- prop.table(freq_table)
  summ_table <- rbind("Frequency" = freq_table, "Relative Frequency" = relative_freq)
  title <- paste("Summary Statistics for", name)
  print(title)
  print(summ_table)
}

# Generate histograms and save in png format
histogram_generator <- function (data, var_name) {
  file_path <- paste("images/histogram/Histogram-",var_name,".png", sep = "")
  png(file_path)
  hist(data, main = paste("Histogram of", var_name), xlab = paste(var_name), col = "pink")
  dev.off()
}

# Generate boxplots and save in png format
boxplot_generator <- function (data, var_name) {
  file_path <- paste("images/boxplot/Boxplot-",var_name,".png", sep = "")
  png(file_path)
  boxplot(data, main = paste("Boxplot of", var_name), xlab = paste(var_name), col = "purple")
  dev.off()
}

# Generate conditional boxplots and save in png format
condition_boxplot_generator <- function (var_name) {
  file_path <- paste("images/conditional-boxplot/Condition-boxplot-between-Balance-and-",var_name,".png", sep = "")
  png(file_path)
  boxplot( data_set$Balance ~ data_set[,var_name], 
           main = paste("Conditional boxplot between Balance and", var_name), 
           xlab = paste(var_name), col = "yellow")
  dev.off()
}
