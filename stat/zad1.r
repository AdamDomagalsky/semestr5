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

#Zad3
    ankieta=read.table('Ankieta.txt',header = TRUE)
    tbl=table(ankieta$WYNIK)
    tbl
    prop.table(tbl)
    
    
    tmp=ankieta[ankieta$SZKOLA=='p',]
    pod=table(tmp$WYNIK)
    pod
    round(prop.table(pod),2)
    
    tmp=ankieta[ankieta$SZKOLA=='s',]
    srd=table(tmp$WYNIK)
    srd
    round(prop.table(srd),2)
    
    tmp=ankieta[ankieta$SZKOLA=='w',]
    wy=table(tmp$WYNIK)
    wy
    round(prop.table(wy),2)
    

    
    pie(main='P',pod)
    pie(main='S',srd)
    pie(main='W',wy)
    
    
    Kobiety = subset(Ankieta, (SZKOLA == 'w' | SZKOLA == 's') & PLEC == 'k',select=c(SZKOLA, PLEC, WYNIK))
    ankieta[ankieta$PLEC=='k' & ankieta$SZKOLA!='p',]
    
    library(car)
    ankieta$WYNIK=recode(ankieta$WYNIK,"c('a','b')=1;c('c','d')=2;c('e')=3")
    ankieta$WYNIK
  
      
    barplot(table(ankieta$WYNIK, ankieta$PLEC), col=1:5,beside=TRUE, legend=rownames(table(ankieta$WYNIK, ankieta$PLEC)))
    barplot(table(ankieta$PLEC, ankieta$WYNIK), beside=TRUE)
#Zad4
    
        
    
    
