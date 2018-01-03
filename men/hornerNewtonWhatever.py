import numpy as np
#
# #solve first equation
# a = np.array([[2, 6], [2, 6.00001]])
# b = np.array([8, 8.00001])
#
# x = np.linalg.solve(a, b)
# print("Solution 1st eq:", x)
# print("Is the result correct?", np.allclose(np.dot(a, x), b))
#
# # cond first equation
# a = np.array([[2, 6, 8], [2, 6.00001, 8.00001]])
# print("Cond 1st eq:", np.linalg.cond(a), "\n")
#
# #solve 2nd equation
# a = np.array([[2, 6], [6, 2.00001]])
# b = np.array([8, 8.00001])
# x = np.linalg.solve(a, b)
# print("Solution 2nd eq:", x)
# print("Is the result correct?", np.allclose(np.dot(a, x), b))
#
# # cond 2nd equation
# a = np.array([[2, 6, 8], [6, 2.00001, 8.00001]])
# print("Cond 2nd eq:", np.linalg.cond(a), "\n")
#

# print("Result is:", np.polyval([8,0,13], -1))

def horner(poly, coeff):
    tempDiv = np.polydiv(poly, [1, -coeff])
    print(tempDiv)
    if tempDiv[0][0] != 0:
        horner(tempDiv[0], coeff)
    else:
        print("Result is: ", tempDiv[1][0], "\n")

# horner([1,6,9,0,17], 2)
# horner([8,8,13,0], -1)


def coef(x, y):
    x.astype(float)
    y.astype(float)
    n = len(x)
    a = []
    for i in range(n):
        a.append(y[i])

    for j in range(1, n):

        for i in range(n-1, j-1, -1):
            a[i] = float(a[i]-a[i-1])/float(x[i]-x[i-j])

    return np.array(a)


def Eval(a, x, r):
    x.astype(float)
    n = len( a ) - 1
    temp = a[n]
    for i in range( n - 1, -1, -1 ):
        temp = temp * ( r - x[i] ) + a[i]
    return temp


coeffs = coef(np.array([100,121,144]), np.array([10,11,12]))
print(coeffs)

x = Eval(coeffs, np.array([100, 121, 144]), 117)
print("Result is:", x)
