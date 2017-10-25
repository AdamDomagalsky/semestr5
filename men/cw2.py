import math
import numpy as np

def quadra(data):
    a,b,c=data
    if a == 0:
        print('Not a quad function')
        return

    delta=b*b-4*a*c
    if delta > 0:   
        sd=math.sqrt(delta)
        x1= ((-1*b)-sd)/(2*a)
        x2= ((-1*b)+sd)/(2*a)

        viete1=(-1*x2)-(b/a)
        viete2=(-1*x1)-(b/a)
        if(x1):
            vieteX2=c/(b*x1)
        if(x2):
            vieteX1=c/(b*x2)    

        print('Data:\n\ta: '+str(a)+'\n\tb: '+str(b)+'\n\tc: '+str(c)+'\n\t\tdelta:'+str(delta)+'\n\t\tx1: '+str(x1)+'\n\t\tx2: '+str(x2))
        wx = lambda x: a*x*x+b*x+c
        print('\t\t\tw(x1):'+str(wx(x1))+'\t<----------')
        print('\t\t\tw(x2):'+str(wx(x2)))
        print('\t\t\tw(viete1 {-x2-(b/a)}):'+str(wx(viete1)))
        print('\t\t\tw(viete2 {-x1-(b/a)}):'+str(wx(viete2)))
        print('\t\t\tw(vieteX1 {c/(b*x1)}):'+str(wx(vieteX1)))
        print('\t\t\tw(vieteX2 {c/(b*x1)}):'+str(wx(vieteX2)))
    
    elif delta == 0:
        x=(-1*b)/(2*a)
        print('Data:\n\ta: '+str(a)+'\n\tb: '+str(b)+'\n\tc: '+str(c)+'\n\t\tdelta:'+str(delta)+'\n\t\tx: '+str(x))        
    else:
        print('delta < 0')

'''
datas=[
    [0,0,1],
    [0,1,0],
    [1,0,0],
    [2,10,1],
    [0.25,5,0.25],
    [1,-4,3.99999],
    [1,-8.01,16.004],
    [2*math.pow(10,17),math.pow(10,18),math.pow(10,17)],
    [math.pow(10,-17),math.pow(-10,17),math.pow(10,17)],
    [2.1,-2.2,math.pow(10,-6)],
    [0.2,1,0.1]
]
'''

datas=[
    [2*math.pow(10,17),math.pow(10,18),math.pow(10,17)],
]
for data in datas:
    quadra(data)
