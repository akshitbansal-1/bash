# Enter producer mode
kafka-console-producer --bootstrap-server localhost:9092 --topic first-topic
# You can publish messages one by one and can exit with ctrl+c

# to make sure that the messages are acked by all brokers
kafka-console-producer --bootstrap-server localhost:9092 --topic first-topic --producer-property acks=all

# WARNING: On localhost, the topic will be created but on most of the remote cluster
# a non-existing topic will not be created.

# to write a key as well
kafka-console-producer --bootstrap-server localhost:9092 \
--topic first-topic \
--producer-property acks=all \
--property parse.key=true \
--property key.separator=:
# >key:value
# >key2:value2

# to start pushing in round robin
kafka-console-producer --bootstrap-server localhost:9092 \
--topic first-topic \
--producer-property acks=all \
--producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner \