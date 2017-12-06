
import numpy as np


a=np.array([[2,6],[2,6.00001]])
b=np.array([8,8.00001])
x = np.linalg.solve(a,b)

print('{} | cond= {}'.format(x,np.linalg.cond(a)))


a=np.array([[2,6],[2,5.99999]])
b=np.array([8,8.00001])
x = np.linalg.solve(a,b)

print('{} | cond = {}'.format(x,np.linalg.cond(a)))


a=np.array([[2,6],[2,2.00001]])
b=np.array([8,8.00001])
x = np.linalg.solve(a,b)

print('{} | cond = {}'.format(x,np.linalg.cond(a)))

a=np.array([[2,6],[2,1.99999]])
b=np.array([8,8.00001])
x = np.linalg.solve(a,b)

print('{} | cond = {}'.format(x,np.linalg.cond(a)))