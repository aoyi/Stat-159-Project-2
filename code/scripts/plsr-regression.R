library(pls)

# Read in data sets
scaled.credit = read.csv("data/data-sets/scaled-credit.csv", header = T)
train.set = read.csv(file = "data/data-sets/train-set.csv", header = T)
test.set = read.csv(file = "data/data-sets/test-set.csv", header = T)

# Fit plsr model to training set
set.seed(1)
plsr.mod = plsr(Balance ~ Income + Limit + Rating + Cards + Age + Education
                + GenderFemale + StudentYes + MarriedYes + EthnicityAsian
                + EthnicityCaucasian, data = train.set,scale = FALSE, validation = "CV")
plsr.sum = summary(plsr.mod)

# Pick the m that will minimize the validation error
validation.error <- plsr.mod$validation$PRESS
best.m.plsr <- which(validation.error == min(validation.error))

# Save plsr regression object and plot
save(plsr.mod, plsr.sum, file = "data/regression-data/plsr-regression.RData")
png('images/regression-plot/plsr-regression-plot.png')
validationplot(plsr.mod, val.type = "MSEP", main = "PLSR Regression Plot")
dev.off()

# Use the best fitted m on testset to calculate MSE
plsr.test.predict <- predict(plsr.mod, test.set[c(-1,-13)],ncomp = best.m)
MSE.plsr = mean((plsr.test.predict - test.set[,13])^2)

# Fit the model in the original dataset to find estimated coefficients
plsr.full.fit <- plsr(Balance ~ Income + Limit + Rating + Cards + Age + Education
                    + GenderFemale + StudentYes + MarriedYes + EthnicityAsian
                    + EthnicityCaucasian, data = scaled.credit, scale = FALSE, ncomp = best.m)
plsr.fitted.coef <- coef(plsr.full.fit)

save(best.m.plsr, MSE.plsr, plsr.fitted.coef, plsr.full.fit, file = "data/regression-data/plsr-model-stats.RData")
