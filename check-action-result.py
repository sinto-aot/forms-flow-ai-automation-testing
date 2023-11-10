from json import dumps
from httplib2 import Http
#import docker
import schedule
import time
import os
import requests

# GitHub repository details
repository_owner = os.environ['USER_NAME']
repository_name = os.environ['REPO_NAME']

# Workflow run details
workflow_name = os.environ['WORKFLOW_NAME']
branch_name = os.environ.get("GITHUB_REF").split("/")[-1]  # Extract branch name from GitHub environment
commit_sha = os.environ.get("GITHUB_SHA")

github_token = os.environ.get("ACCESS_TOKEN")

def main():
    error_details= fetch_error_details()
    message = create_message(error_details, branch_name, commit_sha)
    send_message_to_chat(message)

def fetch_error_details():
    headers = {"Authorization": f"Bearer {github_token}"}
    url = f"https://api.github.com/repos/{repository_owner}/{repository_name}/actions/workflows/{workflow_name}/runs?branch={branch_name}&event=push"
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        runs = response.json().get("workflow_runs", [])
        for run in runs:
            conclusion = run.get("conclusion")
            if conclusion == "failure":
                html_url = run.get("html_url")
                return html_url
        return "No recent failed runs found"
    else:
        return f"Failed to fetch GitHub Actions details. Status code: {response.status_code}"
    
def create_message(error_details, branch_name, commit_sha):
    if error_details.startswith("https://"):
        return f"GitHub Actions on branch '{branch_name}' and commit '{commit_sha}' failed. Details: {error_details}"
    else:
        return f"GitHub Actions on branch '{branch_name}' and commit '{commit_sha}' succeeded. {error_details}"

def send_message_to_chat(message):
    url = os.environ['WEBHOOK_URL_HERE']
    bot_message = {
        'text': message,
    }
    message_headers = {'Content-Type': 'application/json; charset=UTF-8'}
    http_obj = Http()
    response = http_obj.request(
        uri=url,
        method='POST',
        headers=message_headers,
        body=dumps(bot_message),
    )      
main()