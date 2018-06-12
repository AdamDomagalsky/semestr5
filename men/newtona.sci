E=10^(-3)
x=poly(0,'x')
f=x^4+x^2+2+3*%i

x0=1
df=derivat(f)
x1= x0-horner(f,x0)/horner(df,x0)

it=1

while abs(x1-x0) > E
  x0=x1
  x1=x0-horner(f,x0)/horner(df,x0)
  it = it + 1
  end