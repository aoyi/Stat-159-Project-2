
# Read in data sets
full.set = read.csv("data/data-sets/scaled-credit.csv", header = T)
train.set = read.csv("data/data-sets/train-set.csv", header = T)
test.set = read.csv("data/data-sets/test-set.csv", header = T)

# Fit ols model to training set
ols.mod = lm(Balance ~ Income + Limit + Rating + Cards + Age + Education
             + GenderFemale + StudentYes + MarriedYes + EthnicityAsian
             + EthnicityCaucasian, data = train.set)
ols.summary = summary(ols.mod)
save(ols.mod, ols.summary,file = "data/regression-data/ols-regression.RData")

# Use the fitted model on testset to calculate MSE

ols.test.predict <- predict(ols.mod, test.set[2:12])
MSE.ols <- mean((ols.test.pred - test.set[,13])^2)

# Fit the model in the original dataset to find estimated coefficients

ols.full.fit <- lm(Balance ~ Income + Limit + Rating + Cards + Age + Education
                   + GenderFemale + StudentYes + MarriedYes + EthnicityAsian
                   + EthnicityCaucasian, data = full.set)
ols.fitted.coef <- coef(ols.full.fit)

save(MSE.ols, ols.fitted.coef, file = "data/regression-data/ols-model-stats.RData")
