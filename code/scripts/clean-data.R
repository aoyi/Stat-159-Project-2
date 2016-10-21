credit = read.csv("data/data-sets/Credit.csv", header = T)
temp_credit <- model.matrix(Balance ~ ., data = credit)
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)
write.csv(scaled_credit, file = "data/data-sets/scaled-credit.csv")

set.seed(123)
train.sample = sample(1:400, 300, replace = F)
train.set = scaled_credit[train.sample, ]
test.set = scaled_credit[-train.sample, ]
write.csv(train.set, file = "data/data-sets/train-set.csv")
write.csv(test.set, file = "data/data-sets/test-set.csv")
