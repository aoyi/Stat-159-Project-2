library(pls)

# Read in data sets
full.set = read.csv("data/data-sets/scaled-credit.csv", header = T)
train.set = read.csv("data/data-sets/train-set.csv", header = T)
test.set = read.csv("data/data-sets/test-set.csv", header = T)

# Fit pcr model to training set
set.seed(1236)
pcr.mod <- pcr(Balance ~ Income + Limit + Rating + Cards + Age + Education
               + GenderFemale + StudentYes + MarriedYes + EthnicityAsian
               + EthnicityCaucasian, data = train.set, scale = FALSE, validation = "CV")
pcr.summ <- summary(pcr.mod)

# Pick the m that will minimize the validation error 
validation.error <- pcr.mod$validation$PRESS
best.m <- which(validation.error == min(validation.error))

# Save pcr regression object and plot
save(pcr.mod, pcr.summ, file = "data/regression-data/ridge-regression.RData")
png('images/regression-plot/pcr-regression-plot.png')
validationplot(pcr.fit, val.type = "MSEP", main = "PCR Regression Plot")
dev.off()

# Use the best fitted m on testset to calculate MSE
pcr.test.predict <- predict(pcr.mod, test.set[2:12], ncomp = best.m)
MSE.pcr <- mean((pcr.test.pred - test.set[,13])^2)

# Fit the model in the original dataset to find estimated coefficients
pcr.full.fit <- pcr(Balance ~ Income + Limit + Rating + Cards + Age + Education
                + GenderFemale + StudentYes + MarriedYes + EthnicityAsian
                + EthnicityCaucasian, data = full.set, scale = FALSE, ncomp = best.m)
fitted.coef <- coef(pcr.full.fit)

save(best.m, MSE.pcr, fitted.coef, file = "data/regression-data/pcr-model-stats.RData")


