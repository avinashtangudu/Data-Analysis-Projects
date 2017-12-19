
# Author : Tangudu Avinash
# Decision Trees

from sklearn import tree

# Height Weight and Shoe Size

X = [[190,78,43],[176,88,41],[189,61,46],[182,72,48],[184,77,53],
     [187,87,49],[186,79,55]]

Y = ['male', 'female', 'male', 'male', 'female', 'male', 'female']

classific = tree.DecisionTreeClassifier()

classific = classific.fit(X,Y)

# Lets predict with new values

prediction = classific.predict([[183,69,49]])

print prediction
