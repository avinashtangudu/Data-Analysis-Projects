
# Author: Tangudu Avinash
# Recommendation Systems

# Importing a libraries

import numpy as np

''' Lightfm is a library which allows us to perform
any number of popular recommendation algorithms '''

from lightfm.datasets import fetch_movielens
from lightfm import LightFM

# fetching the data and formatting it

data = fetch_movielens(min_rating = 4.5)

# Printing and training the data
print(repr(data['train']))
print(repr(data['test']))

# creating a model
model = LightFM(loss='warp')

# training a model
model.fit(data['train'], epochs=30, num_threads=2)

def sample_recommendation(model, data, user_ids):
    # Number of user and movies in the training data
    n_users, n_items = data['train'].shape

    # Generating the recommendation for each users we input
    for user_id in user_ids:

        # Movies they have already liked
        known_positives = data['item_labels'][data['train'].tocsr()[user_id].indices]

        # Movies our model predicts they want to watch or like
        scores = model.predict(user_id, np.arange(n_items))
        # Ranking them in order of most liked to least liked
        top_items = data['item_labels'][np.argsort(-scores)]

        # Printing out the results
        print("User  %s" % user_id)
        print(" Known positives:")

        for x in known_positives[:3]:
            print("     %s" % x)

        print("    Recommended:")

        for x in top_items[:3]:
            print("     %s" % x)

        sample_recommendation(model, data, [5,32,476])







        
        
    
    
    


