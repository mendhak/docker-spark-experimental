FROM ubuntu:16.04
 
RUN apt-get -y update && apt-get -y install curl && apt-get -y install software-properties-common
 

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && ln -s /usr/bin/python3 /usr/bin/python
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
 
ENV PATH $PATH:$JAVA_HOME/bin

ARG SPARK_ARCHIVE=http://apache.mirror.anlx.net/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
ENV SPARK_HOME /usr/local/spark-2.3.1-bin-hadoop2.7
 
ENV PATH $PATH:${SPARK_HOME}/bin
RUN curl -s ${SPARK_ARCHIVE} | tar -xz -C /usr/local/
 
WORKDIR $SPARK_HOME
