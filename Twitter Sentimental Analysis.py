
# Author: Tangudu Avinash
# Twitter Sentiment Analysis

import tweepy

from textblob import TextBlob

# Get these keys from twitter API
consumer_key = 'Your Key'
consumer_secret = 'Your Secret'

access_token = "Your access token"
access_token_secret = "Your token secret"

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)

celeb_tweets = api.search('Abdul Kalam')

    for tweet in celeb_tweets:
        print(tweet.text)
        analysis = TextBlob(tweet.text)
        print(analysis.sentiment)
