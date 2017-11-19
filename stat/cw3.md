library(car)


x=c(1,2,3)
y=c(4,5,6)

emnk <- function(xi,yi) sum(xi*yi)/sum(xi^2)

emnk(x,y)

plot(cars)


linear<- lm(dist ~ speed, data=cars)
abline(linear)

summary(linear)




predicted=predict(linear, newdata=data.frame(speed=seq(30, 50, 1)), interval="predict")
predicted[,'fit']