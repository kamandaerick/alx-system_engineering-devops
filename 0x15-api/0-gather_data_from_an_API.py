#!/usr/bin/python3
"""Get and return information about an employee's todo"""
import requests
import sys
import json


if __name__ == "__main__":
    # Get the user ID from command line arguments
    user_id = sys.argv[1]
    # Define URLs for user details and user tasks
    tasks_url = f"https://jsonplaceholder.typicode.com/users/{user_id}/todos"
    name_url = f"https://jsonplaceholder.typicode.com/users/{user_id}"
    # Fetch user details
    name_response = requests.get(name_url)
    names = name_response.json()
    name = names['name']
    # Fetch user tasks
    response = requests.get(tasks_url)
    if response.status_code == 200:
        tasks = response.json()
        completed_count = 0
        uncompleted_count = 0
        completed_titles = []
        # Process each tak
        for task in tasks:
            if task["completed"]:
                completed_count += 1
                completed_titles.append(task["title"])
            else:
                uncompleted_count += 1
    # Print results
    print(f"Employee {name} is done with tasks \
            ({completed_count}/{completed_count + uncompleted_count}):")
    for title in completed_titles:
        print(f"     {title}")
else:
    print(f"Failed to retrieve data: {response.status_code}")
