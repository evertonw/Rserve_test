# install.packages("paty")
str(iris)
set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]
#
library(party)
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data=trainData)
# check the prediction
table(predict(iris_ctree), trainData$Species)
#plot(iris_ctree)
#
testPred <- predict(iris_ctree, newdata = testData)
print(testPred)
print(testData)
table(testPred, testData$Species)
#
#
testData$prediction <- testPred
testData
#
testData <- data.frame(Sepal.Length=5.0, Sepal.Width=3.6, Petal.Length=1.4, Petal.Width=0.2)
testPred <- predict(iris_ctree, newdata = testData)
testData$prediction <- testPred
testData
