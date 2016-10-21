scaled_credit = read.csv("data/data-sets/scaled_credit.csv", header = T)

OLS.mod = lm(Balance ~ Income + Limit + Rating + Cards + Age + Education
             + GenderFemale + StudentYes + MarriedYes + EthnicityAsian
             + EthnicityCaucasian, data = as.data.frame(scaled_credit))
OLS.summary = summary(OLS.mod)

save(OLS.mod, OLS.summary,file = "data/OLS-regression.RData")
