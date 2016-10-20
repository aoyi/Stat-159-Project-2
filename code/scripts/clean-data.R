credit = read.csv("data/Credit.csv", header = T)
temp_credit <- model.matrix(Balance ~ ., data = credit)
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)
write.csv(scaled_credit, file = "data/scaled-credit.csv")

set.seed(123)
train.sample = sample(1:400, 300, replace = F)
train.set = credit[train.sample, ]
test.set = credit[-train.sample, ]
write.csv(train.set, file = "data/train-set.csv")
write.csv(test.set, file = "data/test-set.csv")
