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
    failed_jobs = get_failed_jobs()
    if failed_jobs:
        for job in failed_jobs:
            print(f"Failed Job Name: {job['name']}")
            print(f"Branch Name: {job['head_branch']}")
            print(f"Commit SHA: {job['head_sha']}")
            print("\n")
    else:
        print("No failed jobs found in the latest workflow run.")

def get_failed_jobs():
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
if __name__ == "__main__":
    main()

