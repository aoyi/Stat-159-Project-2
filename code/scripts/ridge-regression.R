library("glmnet")

scaled_credit = read.csv("data/data-sets/scaled-credit.csv", header = T)

dependent <- as.matrix(scaled_credit$Balance)
regressor <- as.matrix(scaled_credit[c(-1, -2, -13)])
grid <- 10^seq(10, -2, length = 100)
ridge.mod <- cv.glmnet(regressor, dependent, lambda = grid, intercept = FALSE, standardize = FALSE)
ridge.summary <- summary(ridge.mod)

save(ridge.mod, ridge.summary,file = "data/regression-data/ridge-regression.RData")