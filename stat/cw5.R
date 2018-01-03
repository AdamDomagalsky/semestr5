#Zad 2

tmp=read.table('Czas.txt', header=TRUE)
time=unlist(tmp)

w.test = function(x, lambda0=0.001, alt="two.sided"){
  n=length(x)
  T=2*lambda0*n*mean(x)
  names(T)="T"
  pch=pchisq(T,2*n)
  if(alt=="two.sided"){
    pval=2*min(pch, 1-pch)
  }else if(alt=="less"){
    pval=1-pch
  }else if(alt=="greater"){
    pval=pch
  }
  
  dataname=deparse(substitute(x))
  result=list(statistic=T, parameter=2*n, p.value=pval,
             alternative=alt, method="Test chi^2 w modelu wykladniczym", data.name=dataname)
  class(result)="htest";
  return(result);
}

w.test(time,0.001,"greater")

m=mean(time)
s=sd(time)
n=length(time)
a=0.05

qchisq(1-a,2*n)
