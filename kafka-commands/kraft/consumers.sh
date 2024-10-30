# start consumer
kafka-console-consumer --bootstrap-server localhost:9092 --topic first-topic
# WARNING this will start consuming only the new messages and not that are pushed before

# to consume from beginning
kafka-console-consumer --bootstrap-server localhost:9092 --topic first-topic --from-beginning

# display keys, partitions, values, timestamp
kafka-console-consumer --bootstrap-server localhost:9092 --topic first-topic \
--formatter kafka.tools.DefaultMessageFormatter \
--property print.timestamp=true \
--property print.key=true \
--property print.value=true \
--property print.partition=true \
--from-beginning


# to use consumer groups
kafka-console-consumer --bootstrap-server localhost:9092 --topic first-topic \
--group mygroup
# RUN SAME COMMANDS IN MULTIPLE TERMINAL TO CONSUME FROM SAME GROUP
# WARNING --from-beginning doesn't have any affect with consumer groups



