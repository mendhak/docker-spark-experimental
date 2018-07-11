Instructions modified from [here](https://vitalflux.com/hello-world-with-apache-spark-standalone-cluster-on-docker/).  Updated to use Ubuntu 16.04 image and Spark 2.3.1 with Hadoop 2.7.  Also enabled pyspark. 

### Prepare containers

First rebuild the image

    docker build -t spark .

In one terminal, start the master and worker

    docker-compose up

Browse to the master: http://127.0.0.1:8080/   
Browse to the worker: http://127.0.0.1:8081/


### Try spark-shell

In another terminal

    docker-compose exec spark-master bash

    #docker run -it -p 8088:8088 -p 8042:8042 -p 4041:4040 --name driver -h driver spark bash

In this master's bash, start a new spark shell and specify the master.

    spark-shell --master spark://spark-master:7077


Try this code sample to see it working

    val NUM_SAMPLES = 100000000
    val count = sc.parallelize(1 to NUM_SAMPLES).filter { _ =>
    val x = math.random
    val y = math.random
    x*x + y*y < 1
    }.count()
    println(s"Pi is roughly ${4.0 * count / NUM_SAMPLES}")

While it runs, watch it on the master's web page.

Exit the scala shell using `:quit`

### Try pyspark

In the master's bash, start a new pyspark shell and specify the master. 

    pyspark --master spark://spark-master:7077

Try this code sample to see it working

    import random
    num_samples = 100000000

    def inside(p):     
        x, y = random.random(), random.random()
        return x*x + y*y < 1

    count = sc.parallelize(range(0, num_samples)).filter(inside).count()

    pi = 4 * count / num_samples
    print(pi)

    sc.stop()

While it runs, watch it on the master's web page.

Exit the pyspark shell using `quit()`
