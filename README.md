# docker-library_rabbitmq-601

https://github.com/docker-library/rabbitmq/issues/601

## Reproduction attempt

* Start with `3.10-management-alpine`
    ```
    make up
    ```
* Check by browsing to `http://SERVER:15672`. You should see PerfTest running as well.
* Stop node
    ```
    make down
    ```
* Upgrade node
    ```
    make upgrade
    ```
* Check cluster by browsing to `http://SERVER:15672`. PerfTest will be running, and node will be upgraded.
