library(glmnet)

# Read in data sets
full.set = read.csv("data/data-sets/scaled-credit.csv", header = T)
train.set = read.csv("data/data-sets/train-set.csv", header = T)
test.set = read.csv("data/data-sets/test-set.csv", header = T)

# Fit ridge model to training set
dependent.train <- as.matrix(train.set$Balance)
regressor.train <- as.matrix(train.set[c(-1, -13)])
grid <- 10^seq(10, -2, length = 100)
set.seed(1235)
ridge.mod <- cv.glmnet(regressor.train, dependent.train, lambda = grid, alpha = 0, intercept = FALSE, standardize = FALSE)
best.lambda.ridge <- ridge.mod$lambda.min

# Save ridge regression object and plot
save(ridge.mod,file = "data/regression-data/ridge-regression.RData")
png('images/regression-plot/ridge-regression-plot.png')
plot(ridge.mod, main = "Ridge Regressin Plot")
dev.off()

# Use the best fitted lambda on test set to calculate MSE
test.set.input <- as.matrix(test.set[, 2:12])
ridge.test.predict <- predict(ridge.mod, s = best.lambda.ridge, newx = test.set.input)
ridge.test <- as.matrix(test.set[,13])
MSE.ridge <- mean((ridge.test - ridge.test.predict)^2)

# Fit the model in the original dataset to find estimated coefficients
dependent.full <- as.matrix(full.set$Balance)
regressor.full <- as.matrix(full.set[c(-1, -13)])
ridge.full.fit <- glmnet(regressor.full, dependent.full, alpha = 0, lambda = best.lambda.ridge, standardize = FALSE, intercept = FALSE)
ridge.fitted.coef <- coef(ridge.full.fit)

save(best.lambda.ridge, MSE.ridge, ridge.full.fit, ridge.fitted.coef, file = "data/regression-data/ridge-model-stats.RData")


