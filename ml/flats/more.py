#Quadratic
prQ = linear_model.LinearRegression()
quadratic = PolynomialFeatures(degree=2)
X_quad = quadratic.fit_transform(X)
prQ.fit(X_quad,y)

predictionsQ = prQ.predict(quadratic.fit_transform(X_test))

# Tree
tree = DecisionTreeRegressor(max_depth=3)
tree.fit(X, y)
predictionsT = tree.predict(X_test)