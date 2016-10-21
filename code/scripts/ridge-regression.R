library("glmnet")

train.set = read.csv("data/data-sets/train-set.csv", header = T)

dependent <- as.matrix(train.set$Balance)
regressor <- as.matrix(train.set[c(-1, -13)])
grid <- 10^seq(10, -2, length = 100)
set.seed(1235)
ridge.mod <- cv.glmnet(regressor, dependent, lambda = grid, intercept = FALSE, standardize = FALSE)
ridge.summary <- summary(ridge.mod)

save(ridge.mod, ridge.summary,file = "data/regression-data/ridge-regression.RData")