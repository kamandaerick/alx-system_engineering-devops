#!/usr/bin/python3

"""
Get the titles of top 10 hot topics of a subreddit
"""

from requests import get


def top_ten(subreddit):
    """
    Print a list of top ten hot topics
    """

    if subreddit is None or not isinstance(subreddit, str):
        print("None")

    user_agent = {'User-agent': 'kamanda/0.1'}
    params = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'.format(subreddit)

    response = get(url, headers=user_agent, params=params)
    results = response.json()

    try:
        my_data = results.get('data').get('children')

        for i in my_data:
            print(i.get('data').get('title'))

    except Exception:
        print("None")
