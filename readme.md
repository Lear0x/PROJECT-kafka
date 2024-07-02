# Kafka Streamlit Dashboard

Ce projet contient une application Streamlit qui consomme des données à partir de différents topics Kafka simulés par des producteurs Python.

## Contributor
- **Mathieu Lacroix**
- **Hugo Pires Higino**
- **Valentin Chrétien**

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés et configurés :

- **Python** (version recommandée : 3.7+)
- **Docker** et **Docker Compose** pour l'environnement Kafka
- **Streamlit** (`pip install streamlit`)
- **Librairies Python Kafka** (`pip install kafka-python`)

## Environnement Docker

### Docker Compose

Utilisez Docker Compose pour exécuter l'environnement Kafka. Assurez-vous d'avoir un fichier `docker-compose.yml` correctement configuré avec les services Kafka et Zookeeper.

 ``` docker-compose up -d ```

Créer un environnement virtuelle 
``` python -m venv env ```

Accéder à l'environnement virtuelle 
``` env/Script/activate ```

Installer dépendances
``` pip install -r requirements.txt ```

Lancer topics docker 
``` 
docker-compose exec kafka kafka-topics --create --topic web-logs --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1
docker-compose exec kafka kafka-topics --create --topic iot-sensors --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1
docker-compose exec kafka kafka-topics --create --topic financial-transactions --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1
 ```

Lancer streamlit via script ou commande 

``` 
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

 ```

 ou via script 
``` .\start.ps1 ```