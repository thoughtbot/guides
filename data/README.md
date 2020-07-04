# Data

A guide for managing a series of tubes.

## Best Practices

- Avoid automatic retries for non-idempotent operations.
- Use at least once delivery with idempotent operations.
- Use at most once delivery with non-idempotent operations.
- Use stream processing for data which is not guaranteed to fit into memory.

### Streaming

- Avoid storing messages with different schemas in the same topic or queue.
- Keep messages as small as possible.
- Use as few distinct resources (CPU, Postgres, S3, HTTP requests) as possible in each consumer.
- Use constant memory to process streams when feasible.
- When one message would perform more than one operation, instead have that message append a new message for each
  operation.
- When reading from the same queue with more than one consumer, ensure that it's acceptable to process messages from
  that queue out of order.
- When partitioning messages in a single topic, ensure that it's acceptable for messages from different partitions to be
  processed out of order.

## Glossary

_Data Engineering_: the task of building infrastructure and process for ingesting, processing, and aggregating data so
that it can be displayed to users or made available to data scientists.

_Data Science_: the practice of using statistics, machine learning, and other tools to analyze data to discover trends
and truths that can be used to provide business intelligence.

_Batch Processing_: processing large amounts of data at once. This is acceptable for smaller amounts of data and can be
simpler in terms of development and deployment. Some batch processes can also be useful for "recomputing the world" when
you want to analyze existing data in a new way.

_Data Streaming_: processing data in small chunks, one at a time, rather than processing all data at once. Streaming is
necessary for processing infinite event streams. It's also useful for processing large amounts of data, because it
prevents memory overflows during processing and makes it easier to process data in a distributed or real-time manner.

_Real-time_: analyzing data and delivering results simultaneously so that stream output is always visible. For example,
real-time analytics will mean that the system is constantly processing events (clicks, purchases, etc) and displaying
the latest results in a user interface.

_Parallel Processing_: performing multiple tasks at the same time, for example on different cores or processors.
Parallel processing is necessary in order to perform more than one computation at once; common uses are parsing or
aggregation.

_Concurrent Processing_: managing multiple ongoing tasks at once without necessarily processing more than one task in
the same exact moment. Concurrent processing is required in order to perform more than one effect at once, such as
waiting for multiple network requests to complete.

_Constant Memory_: processing a stream where the amount of memory required does not increase with the size of the
stream.

_At Least Once Delivery_: a guarantee that a given message will be delivered at least once, but may be delivered more
than once. This is achieved in Kafka by committing an offset after it's been fully processed and in RabbitMQ by
acknowledging a message after fully processing it.

_At Most Once Delivery_: a guarantee that a message will never be delivered more than once, but may not be delivered at
all. This is achieved in Kafka by committing an offset before fully processing a message and in RabbitMQ by
acknowledging a message before fully processing it.

_Distributed Data Processing_: breaking up data into partitions so that large amounts of data can be processed by many
machines simultaneously.

_Cluster_: several computers (or virtual machines) grouped together to perform a single task.

_Scala_: a programming language (like Ruby, Python, or JavaScript) which is fast and has become popular for data-focused
tasks. Scala runs on the Java Virtual Machine, which is a high-performance engine for running languages like Scala that
compile into bytecode.

_Type Safety_: languages that provide type safety (such as Scala) check the program for possible errors as part of the
compilation process, which allows developers to prevent many types of bugs before being deployed.

_Spark_: a distributed computing engine for big data and data streams. Spark is a Scala-focused framework for data
engineering and data science.

_Kafka_: a distributed commit log for data streams. Many of the large data systems deployed today use Kafka.

_Record Stream_: a stream where each message is an independent, unique record which does not replace a previous record
in the stream.

_Changelog Stream_: a stream where each message represents the latest state for a particular entity.

_Topic_: in Kafka, a partitioned, append-only log of messages which can be consumed in order by partition.

_Partition_: in Kafka, a way of breaking the messages of a topic into groups which can be consumed in parallel by one or
more workers.

_Queue_: in RabbitMQ, messages sent to an exchange are placed on a queue. Messages on a queue can be consumed in
parallel by one or more workers.

_Consumer_: An application or process that reads from a data stream.

_Producer_: An application or process that writes to a data stream.
