# load our data set
data(iris)

# make sure the ANN library is available
library(neuralnet)

# convert the labels into numeric labels and put them into a data frame
Species.numeric <- as.numeric(iris$Species)
iris.df <- data.frame(iris,Species.numeric)

# train a neural network with two hidden nodes
net <- neuralnet(
    Species.numeric ~ Sepal.Width+Sepal.Length+Petal.Width+Petal.Length,
    iris.df,
    algorithm = "rprop+",
    threshold=0.001,
    stepmax="1000000",
    lifesign="none",
    hidden=8)

# display the ANN
plot(net)

# the training predictions from the ANN are numeric values, 
# turn them into labels by rounding
predicted.labels <- round(net$net.result[[1]])

# plot the confusion matrix
print(table(iris.df$Species.numeric,predicted.labels))