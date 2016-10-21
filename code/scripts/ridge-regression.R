library("glmnet")

full.set = read.csv("data/data-sets/scaled-credit.csv", header = T)
train.set = read.csv("data/data-sets/train-set.csv", header = T)
test.set = read.csv("data/data-sets/test-set.csv", header = T)

dependent <- as.matrix(train.set$Balance)
regressor <- as.matrix(train.set[c(-1, -13)])
grid <- 10^seq(10, -2, length = 100)
set.seed(1235)
ridge.mod <- cv.glmnet(regressor, dependent, lambda = grid, alpha = 0, intercept = FALSE, standardize = FALSE)
small.lambda.index <- ridge.mod$lambda.min

save(ridge.mod,file = "data/regression-data/ridge-regression.RData")

png('images/regression-plot/ridge-regression-plot')
plot(ridge.mod, main = "Ridge Regressin Plot")
dev.off()

test.set.input <- as.matrix(test.set[, 2:12])

ridge.test.predict <- predict(ridge.mod, s = small.lambda.index, newx = test.set.input)
ridge.test <- as.matrix(test.set[,13])
MSE_ridge <- mean(sum((ridge.test - ridge.test.predict)^2))

dependent_full <- as.matrix(full.set$Balance)
regressor_full <- as.matrix(full.set[c(-1, -13)])
ridge.full.fit <- glmnet(regressor_full, dependent_full, lambda = small.lambda.index, standardize = FALSE, intercept = FALSE)
fitted_coef <- coef(ridge.full.fit)

save(small.lambda.index, MSE_ridge, fitted_coef, file = "data/regression-data/ridge-model-stats")


