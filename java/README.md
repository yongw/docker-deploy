Java Docker Image
==========

Build a base image of Oracle JDK 1.7 based on latest `centos` (currently is 7.1). 
This is supposed to be the base image for building [Zookeeper] and [Kafka] Docker image.

[Zookeeper]: docker-k8s/zookeeper
[Kafka]: docker-k8s/kafka

Configuration
-------------
Below two environment variables are set by default.
- `JAVA_HOME /usr/java/oracle-jdk-1.${VERSION}.0_${UPDATE}`
- `JRE_HOME ${JAVA_HOME}/jre`


Build Image
-----------
`docker built -t dockerlab.int.thomsonreuters.com:30000/oracle-java:1.7 .`