# Lancement des producteurs
Start-Process python -ArgumentList "producer_financial_transactions.py" -NoNewWindow -WorkingDirectory "G:\0_MASTER\KAFKA\PROJECT"
Start-Process python -ArgumentList "producer_iot_sensors.py" -NoNewWindow -WorkingDirectory "G:\0_MASTER\KAFKA\PROJECT"
Start-Process python -ArgumentList "producer_web_logs.py" -NoNewWindow -WorkingDirectory "G:\0_MASTER\KAFKA\PROJECT"

# Lancement des consommateurs
Start-Process python -ArgumentList "consumer_financial_transactions.py" -NoNewWindow -WorkingDirectory "G:\0_MASTER\KAFKA\PROJECT"
Start-Process python -ArgumentList "consumer_iot_sensors.py" -NoNewWindow -WorkingDirectory "G:\0_MASTER\KAFKA\PROJECT"
Start-Process python -ArgumentList "consumer_web_logs.py" -NoNewWindow -WorkingDirectory "G:\0_MASTER\KAFKA\PROJECT"

# Lancement de l'application Streamlit
Start-Process streamlit -ArgumentList "run", "app.py" -NoNewWindow -WorkingDirectory "G:\0_MASTER\KAFKA\PROJECT"
