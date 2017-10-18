#ZAD1
  NY_F=c(32,33,41,52,62,72,77,75,68,58,47,35)
  months=c('Styczeń','Luty','Marzec','Kwiecień','Maj','Czerwiec','Lipiec','Sierpień','Wrzesień','Październik','Listopad','Grudzień')
  
  miasta=data.frame(NY_F)
  
  row.names(miasta)=months
  
  #b
  NY_C=round((NY_F-32)*5/9,2)
  miasta=cbind(miasta, NY_C)
  #c
  save(miasta, file='Miasta.RData')

#ZAD2
  cities=read.csv('Cities.csv',sep=';')
  cities
  #cities$MONTH=NULL #lub tak
  cities=cities[-1]
  
  
  #b
  Atlanta_C=round((cities$ATLANTA-32)*5/9,2)
  PHOENIX_C=round((cities$PHOENIX-32)*5/9,2)
  SANDIEGO_C=round((cities$SANDIEGO-32)*5/9,2)
  
  #c
  load('Miasta.RData')
  
  miasta=cbind(miasta, Atlanta_C, PHOENIX_C, SANDIEGO_C)
  
  #d
  
  miasta$NY_F = NULL
  #e
  colnames(miasta)=c('Nowy York', 'Atlanta','Phoenix','San Diego');
  #f
  save(miasta,file='Miasta1.RData')
  #g
  matplot(miasta,type='b',pch=1:4,ylab = 'Temp (w C)',xlab='Miesiac')
  




