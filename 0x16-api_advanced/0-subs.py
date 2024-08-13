#!/usr/bin/python3
'''
Number of subscribers for a subreddit
'''
import requests


def number_of_subscribers(subreddit):
  '''Query reddit API and return number of subscribers'''
  
  headers = {'User-Agent': 'Mozilla/5.0'}
  url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)

  response = requests.get(url, headers=headers, allow_redirects=False)

  if response.status_code == 200:
    data = response.json()
    return data.get('data').get('subscribers')
  else:
    return 0
