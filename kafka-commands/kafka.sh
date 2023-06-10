# start kafka without zookeeper and installed with brew
# brew install kafka

################ START SERVER ###################

# create a random uuid for your cluster
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"
# get the random uuid used in your config file
kafka-storage format -t $KAFKA_CLUSTER_ID -c /opt/homebrew/etc/kafka/kraft/server.properties

# start server in background
# to see logs remove -daemon flag
kafka-server-start -daemon /opt/homebrew/etc/kafka/kraft/server.properties

# to stop the server
kafka-server-stop




################ KAFKA TOPICS ###################

# the following examples are with kraft mode only
# create topics
kafka-topics --bootstrap-server localhost:9092 --topic first-topic --create
# with partitions
kafka-topics --bootstrap-server localhost:9092 --topic first-topic --create --partitions 5
# with replication
kafka-topics --bootstrap-server localhost:9092 --topic first-topic --create --partitions 5 --replication-factor 3
# WARNING: you will get error on localhost as only a single broker is running

# list topics
kafka-topics --bootstrap-server localhost:9092 --list

#describe topics
kafka-topics --bootstrap-server localhost:9092 --topic first-topic --describe

# delete topic
kafka-topics --bootstrap-server localhost:9092 --topic first-topic --delete