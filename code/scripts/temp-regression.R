# Generate least squares model

scaled_credit = read.csv("data/data-sets/scaled-credit.csv", header = T)

ols.mod = lm(Balance ~ Income + Limit + Rating + Cards + Age + Education
             + GenderFemale + StudentYes + MarriedYes + EthnicityAsian
             + EthnicityCaucasian, data = scaled_credit)
ols.summary = summary(ols.mod)

save(ols.mod, ols.summary,file = "data/regression-data/ols-regression.RData")
