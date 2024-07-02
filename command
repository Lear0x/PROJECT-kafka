docker-compose exec kafka kafka-topics --create --topic web-logs --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1
docker-compose exec kafka kafka-topics --create --topic iot-sensors --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1
docker-compose exec kafka kafka-topics --create --topic financial-transactions --bootstrap-server kafka:9092 --partitions 3 --replication-factor 1
