library("glmnet")

train.set = read.csv(file = "data/data-sets/train-set.csv", header = T)

dependent <- as.matrix(train.set$Balance)
regressor <- as.matrix(train.set[c(-1, -2, -13)])

grid <- 10^seq(10, -2, length = 100)
set.seed(1234)
lasso.mod <- cv.glmnet(regressor, dependent, alpha = 1, lambda = grid, intercept = FALSE, standardize = FALSE)
lasso.summary = summary(lasso.mod)

save(lasso.mod, lasso.summary, file = "data/regression-data/lasso-regression.RData")