
#Zad3

wind=read.table('Wiatry.txt', header=FALSE)

lambda.cint = function(x, conf) {
  n=length(x)
  alfa=1-conf
  zA=qnorm(1-alfa/2)

  zA/sqrt(n)
  R=
  L=
  

}
lambda.cint(wind$V1, 0.95)


var.cint<-function(x,conf.level=0.95){
  m=var(x)
  n=length(x)
  a=1-conf.level
  R=((n-1)*var(x))/(qchisq(a/2,n-1))
  L=((n-1)*var(x))/(qchisq(1-a/2,n-1))
  w=list(title="var", est=m,LEFT=L, RIGHT=R, conf.level=conf.level)
  class(w)="confint"
  return(w)
}
var.cint(wind$V1, 0.95)


print.confint = function(x){
  cat(x$conf.level*100, "percent confidence interval:", "\n")
  cat(x$L, " ", x$R, "\n")
}
summary.confint = function(x){
  cat("\n", "Confidence interval of", x$title, "\n", "\n")
  cat(x$conf.level*100, "percent confidence interval:", "\n")
  cat(x$L, " ", x$R, "\n")
  cat("sample estimate", "\n")
  cat(x$est, "\n")
}















#Zad1
library('EnvStats')


time=read.table('Czas.txt',header = TRUE)


result=eexp(unlist(time),ci=TRUE, conf = 0.95)
str(result)
result$parameters
result$interval$limits


#Zad2

qqnorm(Pomiary$V1)
qqline(Pomiary$V1,col='red')

#dla wartosci oczekiwanej(mean)
result=enorm(Pomiary$V1, ci=TRUE, ci, ci.param='mean')
result[1]$parameters
result$interval$limits

#dla wariancji (E=mean^2)
result=enorm(Pomiary$V1, ci=TRUE, ci, ci.param='variance')
result$parameters[2]**2
result$interval$limits
