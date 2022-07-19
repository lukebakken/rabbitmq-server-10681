## Original repo:

https://github.com/lukebakken/docker-rabbitmq-cluster

Branch: `upgrade`

## Steps

* Build RabbitMQ 3.8 image
    ```
    make image-3.8
    ```
* Start cluster
    ```
    make up
    ```
* Check cluster by browsing to `http://SERVER:15672`. You should see PerfTest running as well.
* Import your defs
    ```
    make import
    ```
* Check cluster by browsing to `http://SERVER:15672`. You should see your definitions.
* Upgrade cluster
    ```
    make upgrade
    ```
* Check cluster by browsing to `http://SERVER:15672`. PerfTest will be running, and all idle queues will show `0`
