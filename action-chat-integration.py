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
    failed_job_details = get_failed_job_details()
    if failed_job_details:
        print(f"Failed Job Details: {failed_job_details}")
    else:
        print("No failed job found.")
def get_failed_job_details():
    headers = {"Authorization": f"Bearer {github_token}"}
    url = f"https://api.github.com/repos/{repository_owner}/{repository_name}/actions/workflows/{workflow_id}/jobs"
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        jobs = response.json()["jobs"]
        for job in jobs:
            if job["name"] == job_name and job["conclusion"] == "failure":
                branch_name = job["head_branch"]
                commit_sha = job["head_sha"]
                return {
                    "Job Name": job_name,
                    "Branch Name": branch_name,
                    "Commit SHA": commit_sha
                }
        return None
    else:
        print(f"Failed to fetch job details. Status code: {response.status_code}")
        return None

if __name__ == "__main__":
    main()

