Instructions modified from [here](https://vitalflux.com/hello-world-with-apache-spark-standalone-cluster-on-docker/).  Updated to use Ubuntu 16.04 image and Spark 2.3.1 with Hadoop 2.7.  Also enabled pyspark. 

First rebuild the image

    docker build -t spark .

In one terminal, start the master and worker

    docker-compose up

In another terminal

     docker run -it -p 8088:8088 -p 8042:8042 -p 4041:4040 --name driver -h driver spark bash


