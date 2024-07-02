docker-compose exec kafka kafka-topics --create --topic web-logs --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1
docker-compose exec kafka kafka-topics --create --topic iot-sensors --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1
docker-compose exec kafka kafka-topics --create --topic financial-transactions --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1



--------------
# Lancement des producteurs en arrière-plan
Start-Process python -ArgumentList "G:\0_MASTER\KAFKA\PROJECT\producer_financial_transactions.py" -NoNewWindow -PassThru

Start-Process python -ArgumentList "G:\0_MASTER\KAFKA\PROJECT\producer_iot_sensors.py" -NoNewWindow -PassThru

Start-Process python -ArgumentList "G:\0_MASTER\KAFKA\PROJECT\producer_web_logs.py" -NoNewWindow -PassThru

# Lancement des consommateurs en arrière-plan
Start-Process python -ArgumentList "G:\0_MASTER\KAFKA\PROJECT\consumer_financial_transactions.py" -NoNewWindow -PassThru

Start-Process python -ArgumentList "G:\0_MASTER\KAFKA\PROJECT\consumer_iot_sensors.py" -NoNewWindow -PassThru

Start-Process python -ArgumentList "G:\0_MASTER\KAFKA\PROJECT\consumer_web_logs.py" -NoNewWindow -PassThru

# Lancement de l'application Streamlit en arrière-plan
Start-Process streamlit -ArgumentList "run", "G:\0_MASTER\KAFKA\PROJECT\app.py" -NoNewWindow -PassThru



