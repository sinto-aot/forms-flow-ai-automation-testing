from json import dumps
from httplib2 import Http
#import docker
import schedule
import time


def main():
    send_message_to_chat('Testing Robot Framework')


def send_message_to_chat(message):
    url = 'https://chat.googleapis.com/v1/spaces/AAAA8Z0qjaE/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=hAsqjVt0pR5AwuhBdRx8DtcNIgOX83nC87bVBvr1ioI'
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