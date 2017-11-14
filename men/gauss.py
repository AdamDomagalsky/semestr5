'''
Ax=b
U=LA
c=LB
'''

import numpy as np

A=np.array([[pow(10,-30),1],[1,1]])
b=np.array([1,2])
L1=np.array([[1,2],[-1*A[1][0]/A[0][0],1]])


c=L1*b
U=L1*A

x2=c[0][0]/U[1][1]
print(x2)
#print(c[0]-U[0][1]*x2/U[0][0])