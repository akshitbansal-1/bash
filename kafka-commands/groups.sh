# List all consumer groups
kafka-consumer-groups --bootstrap-server localhost:9092 --list

#describe a group
kafka-consumer-groups --bootstrap-server localhost:9092 --group mygroup --describe

# we can reset consumer group offsets as well
kafka-consumer-groups --botstrap-server localhost:9092 --group mygroup \
--reset-offsets --to-earliest --topic first-topic --dry-run
# --dry-run flag will not set and will show the new state

# to execute
kafka-consumer-groups --botstrap-server localhost:9092 --group mygroup \
--reset-offsets --to-earliest --topic first-topic --execute


