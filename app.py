import streamlit as st
from kafka import KafkaConsumer
import json
import logging

# Configuration du journal
logging.basicConfig(level=logging.DEBUG)

# Configuration de Kafka
KAFKA_BROKER_URL = 'localhost:9092'
KAFKA_TOPIC = 'web-logs'

# Initialisation du consommateur Kafka
consumer = KafkaConsumer(
    KAFKA_TOPIC,
    bootstrap_servers=[KAFKA_BROKER_URL],
    value_deserializer=lambda x: json.loads(x.decode('utf-8'))
)

st.title("Kafka Streamlit Dashboard")

st.write("Starting to consume messages from Kafka")

# Fonction pour consommer les messages Kafka
def consume_messages():
    for message in consumer:
        logging.debug(f"Received message: {message.value}")
        yield message.value

# Affichage des messages Kafka
for message in consume_messages():
    st.write(message)
