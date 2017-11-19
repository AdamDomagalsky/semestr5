rYn=[]
def Yn(n):
    if(n==0):
        return 0.182
    else:
        tmp = (1.0/n)-(5*Yn(n-1))
        rYn.append(tmp)
        print('{}->\t{}'.format(n, tmp))
        return tmp

Yn(8)


rYeN=[]
def YeN(n):
    if(n==8):
        return 0.019
    else:
        tmp = (1.0/(5*n))-(1.0/5.0)*YeN(n+1)
        rYeN.append(tmp)
        print('\t{}->\t{}'.format(n, tmp))
        return tmp

YeN(1)


for a,b in zip(rYn,rYeN):
    print('{}\t\t<->\t{}'.format(a, b))


