library("glmnet")

train.set = read.csv(file = "data/data-sets/train-set.csv", header = T)
test.set = read.csv(file = "data/data-sets/test-set.csv", header = T)

dependent <- as.matrix(train.set$Balance)
regressor <- as.matrix(train.set[c(-1,-13)])

grid <- 10^seq(10, -2, length = 100)
set.seed(1234)
lasso.mod <- cv.glmnet(regressor, dependent, alpha = 1, lambda = grid, intercept = FALSE, standardize = FALSE)
lasso.summary = summary(lasso.mod)

save(lasso.mod, file = "data/regression-data/lasso-regression.RData")

small.lambda.index <- lasso.mod$lambda.min

png('images/regression-plot/lasso-regression-plot.png')
plot(lasso.mod, main = "Lasso Regression Plot")
dev.off()

lasso.test.predict=predict(lasso.mod ,s=small.lambda.index, newx=as.matrix(test.set[c(-1,-13)]))
lasso.test = as.matrix(test.set[,13])
MSE_lasso = mean((lasso.test - lasso.test.predict)^2)

dependent_full = as.matrix(scaled_credit$Balance)
regressor_full = as.matrix(scaled_credit[c(-1,-13)])
lasso.full.fit = glmnet(regressor_full, dependent_full, alpha = 1, lambda = small.lambda.index, intercept = FALSE, standardize = FALSE)
fitted_coef = coef(lasso.full.fit)
