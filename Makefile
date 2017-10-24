copy-jar:
	cp target/kafka-build-trigger.hpi dockerfs/jenkins/plugins/

build-jar:
	mvn clean package -DskipTests

kafka-login:
	docker exec -it kafkabuildtrigger_broker_1 bash

kafka-run-producer:
	docker exec kafkabuildtrigger_broker_1 java -jar /tmp/kafkaProducer-1.0-SNAPSHOT-jar-with-dependencies.jar

docker-clean:
	docker-compose down

jenkins-clean:
	rm -rf dockerfs/jenkins/plugins/kafka-build-trigger
	rm -rf dockerfs/jenkins/plugins/kafka-build-trigger.hpi

run:
	docker-compose up -d jenkins

jenkins-restart:
	docker-compose restart jenkins

jenkins-logs:
	docker logs -f kafkabuildtrigger_jenkins_1