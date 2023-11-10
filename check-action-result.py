from json import dumps
from httplib2 import Http
#import docker
import schedule
import time
import os

def main():
    send_message_to_chat('Testing Robot Framework')


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