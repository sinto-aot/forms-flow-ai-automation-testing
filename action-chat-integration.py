import requests
import json
import os
# Define the message to send
message = {
    "text": "Error Details from GitHub Actions",
    "cards": [
        {
            "sections": [
                {
                    "widgets": [
                        {
                            "textParagraph": {
                                "text": "The build job failed in GitHub Actions."
                            }
                        },
                        {
                            "textParagraph": {
                                "text": "${{ github.workflow }} workflow failed on branch ${{ github.ref }}."
                            }
                        },
                        {
                            "textParagraph": {
                                "text": "Error Details:",
                            }
                        },
                        {
                            "textParagraph": {
                                "text": "${{ job.status }}: ${{ job.name }}"
                            }
                        },
                        {
                            "textParagraph": {
                                "text": "${{ job.steps.[0].name }}: ${{ job.steps.[0].outcome }}"
                            }
                        },
                    ]
                }
            ]
        }
    ]
}

# Send the message to Google Chat
response = requests.post(
    os.environ["GOOGLE_CHAT_WEBHOOK"],
    headers={"Content-Type": "application/json"},
    data=json.dumps(message),
)
if response.status_code == 200:
    print("Message sent to Google Chat successfully")
else:
    print(f"Failed to send message to Google Chat. Status code: {response.status_code}")