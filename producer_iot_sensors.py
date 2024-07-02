from kafka import KafkaProducer
import json
import time
import random

def produce_web_logs():
    producer = KafkaProducer(bootstrap_servers='localhost:9092', value_serializer=lambda v: json.dumps(v).encode('utf-8'))
    web_logs = [
        {"ip": "192.168.0.1", "request": "GET /index.html", "response_time": 0.004},
        {"ip": "192.168.0.2", "request": "POST /form", "response_time": 0.020},
    ]
    while True:
        log = random.choice(web_logs)
        producer.send('web-logs', log)
        time.sleep(1)
