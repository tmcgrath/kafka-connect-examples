#!/bin/bash
# Set you KAFKA_HOME to use

TOPICS=$($KAFKA_HOME/bin/kafka-topics.sh --zookeeper 0.0.0.0:2181 --list )

for T in $TOPICS
do
  if [ "$T" != "__consumer_offsets" ]; then
    $KAFKA_HOME/bin/kafka-topics.sh --zookeeper 0.0.0.0:2181 --delete --topic $T
  fi
done
