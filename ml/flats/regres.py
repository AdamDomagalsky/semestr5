import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

from sklearn.preprocessing import StandardScaler
from sklearn import linear_model
from sklearn.preprocessing import PolynomialFeatures
from sklearn.tree import DecisionTreeRegressor


cols = ['price','isNew','rooms','floor','location','sqrMetres']
df = pd.read_csv('./train/train.tsv', header=None, sep='\t')
df.columns = cols

colsT = ['isNew','rooms','floor','location','sqrMetres']
test = pd.read_csv('./test-A/in.tsv', header=None, sep='\t')
test.columns = colsT


# sns.set(style="darkgrid",context="notebook")
# sns.pairplot(df, size=2.5)
# plt.show()	


# cm = np.corrcoef(df[cols].values.T)
# sns.set(font_scale=1.5)
# hm=sns.heatmap(cm,cbar=True,annot=True,square=True,fmt=".2f",annot_kws={'size':15},yticklabels=cols,xticklabels=cols)
# plt.show()

y = df['price']
X = df[['isNew','rooms','floor','location','sqrMetres']]
X_test=test[['isNew','rooms','floor','location','sqrMetres']]

#Linear
lr = linear_model.LinearRegression()
lr.fit(X, y)
predictions = lr.predict(X_test)

#Saveing data
with open('test-A/out.tsv','w') as f:
	for row in predictions:
		f.write(str(row)+'\n')

print('done')