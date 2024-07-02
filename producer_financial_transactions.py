from kafka import KafkaProducer
import json
import time
import random

producer = KafkaProducer(bootstrap_servers='localhost:9092', value_serializer=lambda v: json.dumps(v).encode('utf-8'))

transactions = [
    {"transaction_id": "txn_1", "amount": 100.0, "account": "account_1"},
    {"transaction_id": "txn_2", "amount": 150.0, "account": "account_2"},
]

while True:
    transaction = random.choice(transactions)
    producer.send('financial-transactions', transaction)
    time.sleep(1)
