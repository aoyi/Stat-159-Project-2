library("glmnet")

# Read in data sets
scaled.credit = read.csv("data/data-sets/scaled-credit.csv", header = T)
train.set = read.csv(file = "data/data-sets/train-set.csv", header = T)
test.set = read.csv(file = "data/data-sets/test-set.csv", header = T)

# Fit lasso model to train set
dependent <- as.matrix(train.set$Balance)
regressor <- as.matrix(train.set[c(-1,-13)])
grid <- 10^seq(10, -2, length = 100)
set.seed(12345)
lasso.mod <- cv.glmnet(regressor, dependent, alpha = 1, lambda = grid, intercept = FALSE, standardize = FALSE)
lasso.summary = summary(lasso.mod)

# Save lasso regression object and plot
save(lasso.mod, file = "data/regression-data/lasso-regression.RData")
best.lambda.lasso <- lasso.mod$lambda.min
png('images/regression-plot/lasso-regression-plot.png')
plot(lasso.mod, main = "Lasso Regression Plot")
dev.off()

# Use the best fitted lambda on test set to calculate MSE
lasso.test.predict=predict(lasso.mod, s=best.lambda.lasso, newx=as.matrix(test.set[c(-1,-13)]))
lasso.test = as.matrix(test.set[,13])
MSE.lasso = mean((lasso.test - lasso.test.predict)^2)

# Fit the model in the original dataset to find estimated coefficients
dependent.full = as.matrix(scaled.credit$Balance)
regressor.full = as.matrix(scaled.credit[c(-1,-13)])
lasso.full.fit = glmnet(regressor.full, dependent.full, alpha = 1, lambda = best.lambda.lasso, intercept = FALSE, standardize = FALSE)
lasso.fitted.coef = coef(lasso.full.fit)

save(best.lambda.lasso, MSE.lasso, lasso.full.fit, lasso.fitted.coef, file = "data/regression-data/lasso-model-stats.RData")

