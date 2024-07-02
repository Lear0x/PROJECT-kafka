from kafka import KafkaProducer
import json
import time
import random

producer = KafkaProducer(bootstrap_servers='localhost:9092', value_serializer=lambda v: json.dumps(v).encode('utf-8'))

iot_sensors = [
    {"sensor_id": "sensor_1", "temperature": 22.5, "humidity": 45},
    {"sensor_id": "sensor_2", "temperature": 21.0, "humidity": 50},
    
]

while True:
    sensor_data = random.choice(iot_sensors)
    producer.send('iot-sensors', sensor_data)
    time.sleep(1)
