from kafka import KafkaConsumer
import json

consumer = KafkaConsumer('iot-sensors', bootstrap_servers='localhost:9092', value_deserializer=lambda x: json.loads(x.decode('utf-8')))

for message in consumer:
    sensor_data = message.value
    print(f"Received sensor data: {sensor_data}")
