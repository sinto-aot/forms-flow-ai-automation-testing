from json import dumps
from httplib2 import Http
#import docker
import schedule
import time
import os
import requests

# GitHub repository and job details
repository_owner = os.environ['USER_NAME']
repository_name = os.environ['REPO_NAME']
workflow_id = "robotframework.yml"  # Replace with the actual workflow ID
job_name = "robot-framework"  # Replace with the actual job name
workflow_name = os.environ['WORKFLOW_NAME']
branch_name = os.environ.get("GITHUB_REF").split("/")[-1]  # Extract branch name from GitHub environment
commit_sha = os.environ.get("GITHUB_SHA")
github_token = os.environ.get("ACCESS_TOKEN")

def main():
    error_details=get_failed_job_details()
    message = create_message(error_details, branch_name, commit_sha)
    send_message_to_chat(message)
    
def get_failed_job_details():
    headers = {"Authorization": f"Bearer {github_token}"}
    url = f"https://api.github.com/repos/{repository_owner}/{repository_name}/actions/runs"
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        latest_run = response.json().get("workflow_runs")[0] 
        if latest_run["conclusion"] == "failure":
            jobs_url = latest_run["jobs_url"]
            jobs_response = requests.get(jobs_url, headers=headers)
            if jobs_response.status_code == 200:
                failed_jobs = [job for job in jobs_response.json()["jobs"] if job["conclusion"] == "failure"]
                return failed_jobs
            else:
                print(f"Failed to fetch job details. Status code: {jobs_response.status_code}")
        return None
    else:
        print(f"Failed to fetch job details. Status code: {response.status_code}")
        return None
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
if __name__ == "__main__":
    main()

